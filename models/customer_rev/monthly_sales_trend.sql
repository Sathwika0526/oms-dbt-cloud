{{ config(
    materialized='table'
) }}

select
    d.year_num as year,
    d.month_num as month,
    sum(f.revenue) as total_revenue,
    count(distinct f.order_id) as total_orders,
    sum(f.quantity) as total_units_sold
from {{ ref('fact_sales') }} f
left join {{ ref('dim_dates') }} d
    on cast(f.order_date as date) = cast(d.full_date as date)
group by
    d.year_num,
    d.month_num
order by
    d.year_num,
    d.month_num