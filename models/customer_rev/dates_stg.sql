{{ config(
    materialized='view'
) }}

select
    date as full_date,
    day as day_num,
    month as month_num,
    year as year_num,
    quarter,
    dayofweek as day_of_week,
    weekofyear as week_of_year,
    updated_at
from {{ source('landing', 'dates') }}