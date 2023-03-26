select
    `app_id`                                      as  `app_id`
    , if(`tag_1` = 'nan', null, trim(`tag_1`))    as  `tag_1`
    , if(`tag_2` = 'nan', null, trim(`tag_2`))    as  `tag_2`
    , if(`tag_3` = 'nan', null, trim(`tag_3`))    as  `tag_3`
    , if(`tag_4` = 'nan', null, trim(`tag_4`))    as  `tag_4`
    , if(`tag_5` = 'nan', null, trim(`tag_5`))    as  `tag_5`
    , if(`tag_6` = 'nan', null, trim(`tag_6`))    as  `tag_6`
    , if(`tag_7` = 'nan', null, trim(`tag_7`))    as  `tag_7`
    , if(`tag_8` = 'nan', null, trim(`tag_8`))    as  `tag_8`
    , if(`tag_9` = 'nan', null, trim(`tag_9`))    as  `tag_9`
    , if(`tag_10` = 'nan', null, trim(`tag_10`))  as  `tag_10`
    , if(`tag_11` = 'nan', null, trim(`tag_11`))  as  `tag_11`
    , if(`tag_12` = 'nan', null, trim(`tag_12`))  as  `tag_12`
    , if(`tag_13` = 'nan', null, trim(`tag_13`))  as  `tag_13`
    , if(`tag_14` = 'nan', null, trim(`tag_14`))  as  `tag_14`
    , if(`tag_15` = 'nan', null, trim(`tag_15`))  as  `tag_15`
    , if(`tag_16` = 'nan', null, trim(`tag_16`))  as  `tag_16`
    , if(`tag_17` = 'nan', null, trim(`tag_17`))  as  `tag_17`
    , if(`tag_18` = 'nan', null, trim(`tag_18`))  as  `tag_18`
    , if(`tag_19` = 'nan', null, trim(`tag_19`))  as  `tag_19`
    , if(`tag_20` = 'nan', null, trim(`tag_20`))  as  `tag_20`
from {{ source('staging', 'application_tags') }}
order by `app_id`
