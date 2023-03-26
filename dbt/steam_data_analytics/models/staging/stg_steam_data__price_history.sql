select
    cast(regexp_substr(`_filename`, '\\d+', 1, 1) as integer)  as  `app_id`
    , `date`                                                   as  `date`
    , round(`initial_price`, 2)                                as  `initial_price`
    , round(`discount`, 2)                                     as  `discount`
    , round(`final_price`)                                     as  `final_price`
from {{ source('staging', 'price_history') }}
order by cast(regexp_substr(`_filename`, '\\d+', 1, 1) as integer), `date`
