select
    cast(regexp_substr(`_filename`, '\\d+', 1, 1) as integer)  as  `app_id`
    , `time`                                                   as  `time`
    , `player_count`                                           as  `player_count`
from {{ source('staging', 'player_count_history') }}
order by cast(regexp_substr(`_filename`, '\\d+', 1, 1) as integer), `time`
