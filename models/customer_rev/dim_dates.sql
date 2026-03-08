{{ config(
    materialized='view'
) }}

select
    full_date,
    day_num,
    month_num,
    year_num,
    quarter,
    day_of_week,
    week_of_year
from {{ ref('dates_stg') }}