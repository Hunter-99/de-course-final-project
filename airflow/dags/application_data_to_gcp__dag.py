import datetime
import logging

from airflow import DAG
from airflow.models import Variable
from airflow.operators.python import PythonOperator
from google.cloud import storage

from utils.etl import (
    extract_data,
    transform_data,
    load_data
)

SOURCE_BUCKET_NAME = 'fake-third-party-resource-bucket'
DESTINATION_BUCKET_NAME = 'steam_data_927433242395'


def application_data_to_gcp(**kwargs):
    rewrite_files = kwargs['dag_run'].conf.get('rewrite_files') or False

    storage_client = storage.Client.from_service_account_info(
        Variable.get(
            key='gcp_service_account_info',
            deserialize_json=True
        )
    )

    source_bucket = storage_client.get_bucket(SOURCE_BUCKET_NAME)
    destination_bucket = storage_client.get_bucket(DESTINATION_BUCKET_NAME)

    blobs_names = list(
        [blob.name for blob in source_bucket.list_blobs(prefix='application')]
    )

    for blob_name in blobs_names:
        destination_blob_name = f"ApplicationData/{blob_name.replace('.csv', '')}.parquet"

        if destination_bucket.blob(destination_blob_name).exists() and not rewrite_files:
            logging.info(f"File {destination_blob_name} already exists in {destination_bucket.name} bucket!")
            continue

        logging.info(f"Generating file {destination_blob_name} ...")

        blob_df = extract_data(
            bucket=source_bucket,
            list_files=[blob_name],
            files_encoding='unicode_escape'
        )

        blob_df = transform_data(
            dataset_name=blob_name.replace('.csv', '').split('/')[0],
            df=blob_df
        )

        load_data(
            bucket=destination_bucket,
            filename=destination_blob_name,
            df=blob_df
        )


with DAG(
        dag_id='application_data_to_gcp',
        start_date=datetime.datetime(2023, 3, 21),
        schedule_interval='@daily',
        catchup=False,
        default_args={
            'owner': 'andrew.ch'
        }
) as dag:
    PythonOperator(
        task_id='application_data_to_gcp',
        python_callable=application_data_to_gcp,
        dag=dag,
        provide_context=True
    )
