select
    `app_id`                          as  `app_id`
    , if(`type`='nan', null, `type`)  as  `type`
    , trim(`name`)                    as  `name`
    , `release_date`                  as  `release_date`
    , `free_to_play`                  as  `free_to_play`
from {{ source('staging', 'application_information') }}
order by `app_id`
