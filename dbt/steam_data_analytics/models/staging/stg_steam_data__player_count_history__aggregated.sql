select
    `application_information`.`name`  as  `application_name`
    , cast(`time` as date)            as  `date`
    , avg(`player_count`)             as  `avg_player_count`
from {{ ref('stg_steam_data__player_count_history') }} as `player_count_history`
left join {{ ref('stg_steam_data__application_information') }} as `application_information`
    on `player_count_history`.`app_id` = `application_information`.`app_id`
group by `application_information`.`name`, cast(`time` as date)
