import io
import json
from tempfile import NamedTemporaryFile
from typing import Iterable

import pandas as pd


def extract_data(bucket, list_files: Iterable[str], files_encoding: str = 'utf-8') -> pd.DataFrame:
    """Read files data form bucket"""
    df = pd.DataFrame()

    for blob_name in list_files:
        blob = bucket.blob(blob_name)
        blob_data = io.BytesIO(blob.download_as_string())
        blob_df = pd.read_csv(
            blob_data,
            encoding=files_encoding
        )

        blob_df['_filename'] = blob_name

        df = pd.concat(
            objs=[df, blob_df]
        )

    return df


def transform_data(dataset_name: str, df: pd.DataFrame) -> pd.DataFrame:
    """Transform data for dataset"""
    with open(f"dags/configs/{dataset_name}.json") as config_file:
        config = json.load(config_file)

    df.columns = df.columns.str.lower()
    df = df.rename(columns=config['columns_to_rename'])

    for column, column_fillna_value in config['columns_fillna_values'].items():
        df[column] = df[column].fillna(column_fillna_value)

    df = df.astype(dtype=config['columns_dtypes'])

    return df


def load_data(bucket, filename: str, df: pd.DataFrame) -> None:
    """Load dataset to bucket"""
    with NamedTemporaryFile() as file:
        temp_file_name = f"{file.name}.parquet"

        df.to_parquet(
            path=temp_file_name,
            engine='fastparquet',
            index=False
        )

        bucket.blob(blob_name=filename).upload_from_filename(
            temp_file_name
        )
