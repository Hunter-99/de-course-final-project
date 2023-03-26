select
    `app_id`                                              as  `app_id`
    , if(`publisher_1`='nan', null, trim(`publisher_1`))  as  `publisher_1`
    , if(`publisher_2`='nan', null, trim(`publisher_2`))  as  `publisher_2`
    , if(`publisher_3`='nan', null, trim(`publisher_3`))  as  `publisher_3`
    , if(`publisher_4`='nan', null, trim(`publisher_4`))  as  `publisher_4`
from {{ source('staging', 'application_publishers') }}
order by `app_id`
