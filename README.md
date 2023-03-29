# de-course-final-project

Final project for `Data Engineering Zoomcamp` course from [DataTalksClub](https://github.com/DataTalksClub)

## Table of contents

- [Project structure](#project-structure)
  - [Terraform project documentation](terraform/README.md)
  - [AirFlow project documentation](airflow/README.md)
  - [SQL queries documentation](sql/README.md)
  - [DBT project documentation](dbt/README.md)
  - [Dashboards documentation](dashboards/README.md)
- [About Steam Games Dataset](#about-steam-games-dataset)
- [Motivation](#motivation)
- [About data source](#about-data-source)
- [Tecnology stack](#technology-stack)
- [Data pipeline diagram](#data-pipeline-diagram)


## Project structure

```
airflow /      contains Airflow project for data orchestration
credentials /  contains json keys for GCP service account (empty for obvious reasons)
dashboards  /  contains dashboards created with Google Looker Studio
dbt /          contains DBT project for data transformation
docs /         contains files and images for project documentation
terraform /    contains Terraform project for initialization of project infrastructure in GCP
```

## About `Steam Games Dataset`

This dataset consists of player count history, price history, and data about 2000 applications available in the Steam games platform.  The 2000 applications are the applications in Steam with the highest player count within the last 24 hours on the 11th of December 2017 chosen based on the player statistics provided in `SteamDB` (https://steamdb.info/graph/).  

The player count history of each application from `14-12-2017` to `12-08-2020` is available. Player count was collected in 5-minutes intervals for the top 1000 applications (`PlayerCountHistoryPart1.zip`) and in 1-hour intervals for the next 1000 applications(`PlayerCountHistoryPart2.zip`) using the ISteamUserStats interface of the Steamworks web API. One file per each application is available containing UTC Time and `Playercount` columns. 

The price history of non Free to Play applications are available from `07-04-2019` to `12-08-2020`. Price information was collected using the `StorefrontAPI` in `USD` currency and is available in daily frequency. Hence, price changes that did not last for 24 hours would not be available. One file per each application is available containing Date, Initialprice, Finalprice, and Discount columns. 

Data about the applications were collected using the `StorefrontAPI`, except for tags which was collected using SteamSpy API. The format of each file is described as follows:

- `applicationInformation.csv` : This file consists of the application ID used in Steam, application name, the release date of the application, application type representing whether the application is a game, mod, demo, advertising or dlc. (There are 1963 games in the dataset out of the 2000 applications.) Whether the game is Free to play or not is represented as a binary feature. Columns:
  - `appid`
  - `type`
  - `name`
  - `releasedate`
  - `freetoplay`
- `applicationDevelopers.csv`: Consist of the `appid` and a `list of the developers` of the application.
- `applicationPublishers.csv`: Consist of the `appid` and a `list of the publishers` of the application.
- `applicationSupportedlanguages.csv`: Consist of the `appid` and a `list of the languages` the application supports.
- `applicationGenres.csv`: Consist of the `appid` and a `list of the genres` assigned to the application on Steam store.
- `applicationTags.csv`: Consist of the `appid` and the `list of the tags` assigned to the application on Steam store.

## Motivation

This project represents data pipeline, within which exracts, transforms and loads data for steam games to `Google BigQuery` warehouse.
Using this data we can:

- To analyse price history for specific application (game)
- To analyse player count history for specific application (game)
- To research relationship between these metrics

## About data source

Source data for `Steam Games Dataset` located in https://data.mendeley.com/datasets/ycy3sy3vj2/1 . 
Part of files are in `.csv`, part files in `.zip` archive. And I had two ways to create data pipeline:

- Download all files and load them to `GCP` bucket from local storage
- Imitate `fake` bucket and load all files in it. After that this bucket will be as `third-party` source for data.

I choose the second way and created manually bucket `fake-third-party-resource-bucket`:

![img.png](docs/img/airflow/screenshot_1.png)

In fact, I just moved `.csv` files, unzipped archives and uploaded them to bucket as folders.

## Technology stack

- Google Cloud Platform
  - Google Cloud Storage
  - BigQuery
- Terraform
- Airflow
- DBT
- Docker
- GitHub actions (flake8 checks)

## Data pipeline diagram

![data_pipeline.png](docs%2Fimg%2Fdata_pipeline.png)
