{{ config(
    materialized='table'
) }}

select
    c.customer_id,
    c.customer_name,
    count(distinct f.order_id) as total_orders,
    sum(f.revenue) as total_revenue,
    sum(f.revenue) / count(distinct f.order_id) as avg_order_value
from {{ ref('fact_sales') }} f
left join {{ ref('dim_customers') }} c
    on f.customer_id = c.customer_id
group by
    c.customer_id,
    c.customer_name