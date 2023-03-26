select
    `app_id`          as  `app_id`
    , if(`language_1` = 'nan', null, trim(`language_1`))    as  `language_1`
    , if(`language_2` = 'nan', null, trim(`language_2`))    as  `language_2`
    , if(`language_3` = 'nan', null, trim(`language_3`))    as  `language_3`
    , if(`language_4` = 'nan', null, trim(`language_4`))    as  `language_4`
    , if(`language_5` = 'nan', null, trim(`language_5`))    as  `language_5`
    , if(`language_6` = 'nan', null, trim(`language_6`))    as  `language_6`
    , if(`language_7` = 'nan', null, trim(`language_7`))    as  `language_7`
    , if(`language_8` = 'nan', null, trim(`language_8`))    as  `language_8`
    , if(`language_9` = 'nan', null, trim(`language_9`))    as  `language_9`
    , if(`language_10` = 'nan', null, trim(`language_10`))  as  `language_10`
    , if(`language_11` = 'nan', null, trim(`language_11`))  as  `language_11`
    , if(`language_12` = 'nan', null, trim(`language_12`))  as  `language_12`
    , if(`language_13` = 'nan', null, trim(`language_13`))  as  `language_13`
    , if(`language_14` = 'nan', null, trim(`language_14`))  as  `language_14`
    , if(`language_15` = 'nan', null, trim(`language_15`))  as  `language_15`
    , if(`language_16` = 'nan', null, trim(`language_16`))  as  `language_16`
    , if(`language_17` = 'nan', null, trim(`language_17`))  as  `language_17`
    , if(`language_18` = 'nan', null, trim(`language_18`))  as  `language_18`
    , if(`language_19` = 'nan', null, trim(`language_19`))  as  `language_19`
    , if(`language_20` = 'nan', null, trim(`language_20`))  as  `language_20`
    , if(`language_21` = 'nan', null, trim(`language_21`))  as  `language_21`
    , if(`language_22` = 'nan', null, trim(`language_22`))  as  `language_22`
    , if(`language_23` = 'nan', null, trim(`language_23`))  as  `language_23`
    , if(`language_24` = 'nan', null, trim(`language_24`))  as  `language_24`
    , if(`language_25` = 'nan', null, trim(`language_25`))  as  `language_25`
    , if(`language_26` = 'nan', null, trim(`language_26`))  as  `language_26`
    , if(`language_27` = 'nan', null, trim(`language_27`))  as  `language_27`
    , if(`language_28` = 'nan', null, trim(`language_28`))  as  `language_28`
from {{ source('staging', 'application_supported_languages') }}
order by `app_id`
