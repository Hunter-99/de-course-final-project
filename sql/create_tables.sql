create or replace table `de-course-final-project.steam_data.price_history`
    partition  by  `date`
    cluster    by  `_filename`
as
    select
         date(timestamp_seconds(cast(`date`/1000000000 as int64)))  as  `date`
        , `initial_price`                                           as  `initial_price`
        , `final_price`                                             as  `final_price`
		, `discount`                                                as  `discount`
        , `_filename`                                               as  `_filename`
    from `de-course-final-project.steam_data_external.price_history__external`;

create or replace table `de-course-final-project.steam_data.player_count_history`
    partition  by  date(`time`)
    cluster    by  `_filename`
as
    select
        datetime(timestamp_seconds(cast(`time`/1000000000 as int64)))  as  `time`
        , `player_count`                                               as  `player_count`
        , `_filename`                                                  as  `_filename`
    from `de-course-final-project.steam_data_external.player_count_history__external`;

create or replace table `de-course-final-project.steam_data.application_developers`
    cluster by `app_id`
as
    select
        `app_id`         as  `app_id`
        , `developer_1`  as  `developer_1`
        , `developer_2`  as  `developer_2`
        , `developer_3`  as  `developer_3`
        , `developer_4`  as  `developer_4`
        , `developer_5`  as  `developer_5`
        , `developer_6`  as  `developer_6`
        , `developer_7`  as  `developer_7`
        , `_filename`    as  `_filename`
    from `de-course-final-project.steam_data_external.application_developers__external`;

create or replace table `de-course-final-project.steam_data.application_genres`
    cluster by `app_id`
as
    select
        `app_id`       as  `app_id`
        , `genre_1`    as  `genre_1`
        , `genre_2`    as  `genre_2`
        , `genre_3`    as  `genre_3`
        , `genre_4`    as  `genre_4`
        , `genre_5`    as  `genre_5`
        , `genre_6`    as  `genre_6`
        , `genre_7`    as  `genre_7`
        , `genre_8`    as  `genre_8`
        , `_filename`  as  `_filename`
    from `de-course-final-project.steam_data_external.application_genres__external`;

create or replace table `de-course-final-project.steam_data.application_information`
    partition  by  `release_date`
    cluster    by  `app_id`
as
    select
        `app_id`                                                             as  `app_id`
        , `type`                                                             as  `type`
        , `name`                                                             as  `name`
        , date(timestamp_seconds(cast(`release_date`/1000000000 as int64)))  as  `release_date`
        , `free_to_play`                                                     as  `free_to_play`
        , `_filename`                                                        as  `_filename`
    from `de-course-final-project.steam_data_external.application_information__external`;

create or replace table `de-course-final-project.steam_data.application_publishers`
    cluster by `app_id`
as
    select
        `app_id`         as  `app_id`
        , `publisher_1`  as  `publisher_1`
        , `publisher_2`  as  `publisher_2`
        , `publisher_3`  as  `publisher_3`
        , `publisher_4`  as  `publisher_4`
        , `_filename`    as  `_filename`
    from `de-course-final-project.steam_data_external.application_publishers__external`;

create or replace table `de-course-final-project.steam_data.application_supported_languages`
    cluster by `app_id`
as
    select
        `app_id`          as  `app_id`
        , `language_1`    as  `language_1`
        , `language_2`    as  `language_2`
        , `language_3`    as  `language_3`
        , `language_4`    as  `language_4`
        , `language_5`    as  `language_5`
        , `language_6`    as  `language_6`
        , `language_7`    as  `language_7`
        , `language_8`    as  `language_8`
        , `language_9`    as  `language_9`
        , `language_10`   as  `language_10`
        , `language_11`   as  `language_11`
        , `language_12`   as  `language_12`
        , `language_13`   as  `language_13`
        , `language_14`   as  `language_14`
        , `language_15`   as  `language_15`
        , `language_16`   as  `language_16`
        , `language_17`   as  `language_17`
        , `language_18`   as  `language_18`
        , `language_19`   as  `language_19`
        , `language_20`   as  `language_20`
        , `language_21`   as  `language_21`
        , `language_22`   as  `language_22`
        , `language_23`   as  `language_23`
        , `language_24`   as  `language_24`
        , `language_25`   as  `language_25`
        , `language_26`   as  `language_26`
        , `language_27`   as  `language_27`
        , `language_28`   as  `language_28`
        , `_filename`     as  `_filename`
    from `de-course-final-project.steam_data_external.application_supported_languages__external`;

create or replace table `de-course-final-project.steam_data.application_tags`
    cluster by `app_id`
as
    select
        `app_id`        as  `app_id`
        , `tag_1`       as  `tag_1`
        , `tag_2`       as  `tag_2`
        , `tag_3`       as  `tag_3`
        , `tag_4`       as  `tag_4`
        , `tag_5`       as  `tag_5`
        , `tag_6`       as  `tag_6`
        , `tag_7`       as  `tag_7`
        , `tag_8`       as  `tag_8`
        , `tag_9`       as  `tag_9`
        , `tag_10`      as  `tag_10`
        , `tag_11`      as  `tag_11`
        , `tag_12`      as  `tag_12`
        , `tag_13`      as  `tag_13`
        , `tag_14`      as  `tag_14`
        , `tag_15`      as  `tag_15`
        , `tag_16`      as  `tag_16`
        , `tag_17`      as  `tag_17`
        , `tag_18`      as  `tag_18`
        , `tag_19`      as  `tag_19`
        , `tag_20`      as  `tag_20`
        , `_filename`   as  `_filename`
    from `de-course-final-project.steam_data_external.application_tags__external`;
