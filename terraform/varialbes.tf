locals {
  data_lake_bucket = "stack_overflow_ads"
}

variable "project" {
  description = "Project number"
  default = "927433242395"
}

variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default = "us-east1"
  type = string
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default = "STANDARD"
}

variable "BQ_DATASET" {
  description = "BigQuery Dataset that raw data (from GCS) will be written to"
  type = string
  default = "stack_overflow_ads"
}

variable "credentials" {
  description = "Absolute path to service account's key"
  type = string
  default = "/home/andrew/Main/PetProjects/de-course-final-project/credentials/de-course-final-project-94b23c680299.json"
}
