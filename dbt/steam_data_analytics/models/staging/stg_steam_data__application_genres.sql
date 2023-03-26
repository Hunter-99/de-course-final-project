select
    `app_id`                                      as  `app_id`
    , if(`genre_1`='nan', null, trim(`genre_1`))  as  `genre_1`
    , if(`genre_2`='nan', null, trim(`genre_2`))  as  `genre_2`
    , if(`genre_3`='nan', null, trim(`genre_3`))  as  `genre_3`
    , if(`genre_4`='nan', null, trim(`genre_4`))  as  `genre_4`
    , if(`genre_5`='nan', null, trim(`genre_5`))  as  `genre_5`
    , if(`genre_6`='nan', null, trim(`genre_6`))  as  `genre_6`
    , if(`genre_7`='nan', null, trim(`genre_7`))  as  `genre_7`
    , if(`genre_8`='nan', null, trim(`genre_8`))  as  `genre_8`
from {{ source('staging', 'application_genres') }}
order by `app_id`
