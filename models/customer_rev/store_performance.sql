{{ config(
    materialized='table'
) }}

select
    s.store_id,
    s.store_name,
    s.city,
    s.state,
    count(distinct f.order_id) as total_orders,
    sum(f.revenue) as total_revenue
from {{ ref('fact_sales') }} f
left join {{ ref('dim_stores') }} s
    on f.store_id = s.store_id
group by
    s.store_id,
    s.store_name,
    s.city,
    s.state