select
    `app_id`                                        as  `app_id`
    , if(`developer_1`='nan', null, trim(`developer_1`))  as  `developer_1`
    , if(`developer_2`='nan', null, trim(`developer_2`))  as  `developer_2`
    , if(`developer_3`='nan', null, trim(`developer_3`))  as  `developer_3`
    , if(`developer_4`='nan', null, trim(`developer_4`))  as  `developer_4`
    , if(`developer_5`='nan', null, trim(`developer_5`))  as  `developer_5`
    , if(`developer_6`='nan', null, trim(`developer_6`))  as  `developer_6`
    , if(`developer_7`='nan', null, trim(`developer_7`))  as  `developer_7`
from {{ source('staging', 'application_developers') }}
order by `app_id`
