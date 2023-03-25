import datetime
import logging
import re

from airflow import DAG
from airflow.models import Variable
from airflow.operators.python import PythonOperator
from google.cloud import storage

from utils.chunk import chunk
from utils.etl import (
    extract_data,
    transform_data,
    load_data
)

SOURCE_BUCKET_NAME = 'fake-third-party-resource-bucket'
DESTINATION_BUCKET_NAME = 'steam_data_927433242395'
MAX_FILES_PER_CHUNK = 10


def player_count_history_data_to_gcp(**kwargs):
    rewrite_files = kwargs['dag_run'].conf.get('rewrite_files') or False

    storage_client = storage.Client.from_service_account_info(
        Variable.get(
            key='gcp_service_account_info',
            deserialize_json=True
        )
    )

    source_bucket = storage_client.get_bucket(SOURCE_BUCKET_NAME)
    destination_bucket = storage_client.get_bucket(DESTINATION_BUCKET_NAME)

    # Note: First blob from source_bucket.list_blobs is folder PlayerCountHistory/, it isn't file.
    # For this we need to exclude first item from list with slise.
    blobs_names = list(
        [blob.name for blob in source_bucket.list_blobs(prefix='PlayerCountHistory/')]
    )[1::]
    blobs_names.sort(key=lambda x: int(re.search(r'\d+', x).group(0)))

    for blobs_names_chunk in chunk(blobs_names, MAX_FILES_PER_CHUNK):
        destination_blob_name = f"PlayerCountHistory/" \
                                f"{blobs_names_chunk[0].split('/')[-1].replace('.csv', '')}_" \
                                f"{blobs_names_chunk[-1].split('/')[-1].replace('.csv', '')}.parquet"

        if destination_bucket.blob(destination_blob_name).exists() and not rewrite_files:
            logging.info(f"File {destination_blob_name} already exists in {destination_bucket.name} bucket!")
            continue

        logging.info(f"Generating file {destination_blob_name} ...")

        blobs_chunk_df = extract_data(
            bucket=source_bucket,
            list_files=blobs_names_chunk
        )

        blobs_chunk_df = transform_data(
            dataset_name='playerCountHistory',
            df=blobs_chunk_df
        )

        load_data(
            bucket=destination_bucket,
            filename=destination_blob_name,
            df=blobs_chunk_df
        )

        logging.info(f"File {destination_blob_name} downloaded to {destination_bucket.name} bucket")


with DAG(
        dag_id='player_count_history_data_to_gcp',
        start_date=datetime.datetime(2023, 3, 21),
        schedule_interval='@daily',
        catchup=False,
        default_args={
            'owner': 'andrew.ch'
        }
) as dag:
    PythonOperator(
        task_id='player_count_history_data_to_gcp',
        python_callable=player_count_history_data_to_gcp,
        dag=dag,
        provide_context=True
    )
