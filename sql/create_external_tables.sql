create or replace external table `de-course-final-project.steam_data_external.price_history__external`
options (
    format = 'PARQUET',
    uris = [
        'gs://steam_data_927433242395/PriceHistory/*.parquet'
    ]
);

create or replace external table `de-course-final-project.steam_data_external.player_count_history__external`
options (
    format = 'PARQUET',
    uris = [
        'gs://steam_data_927433242395/PlayerCountHistory/*.parquet'
    ]
);

create or replace external table `de-course-final-project.steam_data_external.application_developers__external`
options (
    format = 'PARQUET',
    uris = [
        'gs://steam_data_927433242395/ApplicationData/applicationDevelopers.parquet'
    ]
);

create or replace external table `de-course-final-project.steam_data_external.application_genres__external`
options (
    format = 'PARQUET',
    uris = [
        'gs://steam_data_927433242395/ApplicationData/applicationGenres.parquet'
    ]
);

create or replace external table `de-course-final-project.steam_data_external.application_information__external`
options (
    format = 'PARQUET',
    uris = [
        'gs://steam_data_927433242395/ApplicationData/applicationInformation.parquet'
    ]
);

create or replace external table `de-course-final-project.steam_data_external.application_publishers__external`
options (
    format = 'PARQUET',
    uris = [
        'gs://steam_data_927433242395/ApplicationData/applicationPublishers.parquet'
    ]
);

create or replace external table `de-course-final-project.steam_data_external.application_supported_languages__external`
options (
    format = 'PARQUET',
    uris = [
        'gs://steam_data_927433242395/ApplicationData/applicationSupportedlanguages.parquet'
    ]
);

create or replace external table `de-course-final-project.steam_data_external.application_tags__external`
options (
    format = 'PARQUET',
    uris = [
        'gs://steam_data_927433242395/ApplicationData/applicationTags.parquet'
    ]
);
