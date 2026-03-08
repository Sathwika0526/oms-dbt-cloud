{{ config(
    materialized='table'
) }}

select
    p.product_id,
    p.product_name,
    p.category,
    sum(f.quantity) as units_sold,
    sum(f.revenue) as total_revenue
from {{ ref('fact_sales') }} f
left join {{ ref('dim_products') }} p
    on f.product_id = p.product_id
group by
    p.product_id,
    p.product_name,
    p.category