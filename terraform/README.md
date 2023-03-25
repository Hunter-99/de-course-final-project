# Terraform

In this directory contains terraform configuration which creates infrastructure in `Google Cloud` such as:

- Bucket `steam_data_927433242395`
- Big Query dataset `steam_data`

> **Note**: In real project `variables.tf` file must be in `.gitignore`

## Requirements

- Create `Google Cloud` account and setup service account (see [instructions for setup GCP account and servie account](../docs/gcp_setup.md)).
- Install [Terraform](https://developer.hashicorp.com/terraform/downloads)

## Local setup and run

1. Fulfill all the requirements above
2. Initialize terraform infrastructure with command
    ```bash
    terraform init
    ```
   
3. Create terraform infrastructure with command and type `yes` when terraform will ask you to perform actions
    ```bash
    terraform apply
    ```
   
After these actions, our project should create bucket `steam_data_927433242395` and `BigQuery` dataset `steam_data`:

![screenshot_1.png](..%2Fdocs%2Fimg%2Fterraform%2Fscreenshot_1.png)