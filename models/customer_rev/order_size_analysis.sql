{{ config(
    materialized='table'
) }}

with order_summary as (

    select
        f.order_id,
        count(distinct f.product_id) as total_products,
        sum(f.quantity) as total_items,
        sum(f.revenue) as order_value
    from {{ ref('fact_sales') }} f
    group by
        f.order_id

)

select
    order_id,
    total_products,
    total_items,
    order_value,
    avg(order_value) over () as overall_avg_order_value
from order_summary