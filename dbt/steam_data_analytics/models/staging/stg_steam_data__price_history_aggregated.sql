select
    `application_information`.`name`    as  `application_name`
    , `price_history`.`final_price`     as  `application_price`
    , `price_history`.`date`            as  `date`
from {{ ref('stg_steam_data__price_history') }} as `price_history`
left join {{ ref('stg_steam_data__application_information') }} as `application_information`
    on `price_history`.`app_id` = `application_information`.`app_id`
