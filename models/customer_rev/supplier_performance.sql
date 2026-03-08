{{ config(
    materialized='table'
) }}

select
    s.supplier_id,
    s.supplier_name,
    s.city,
    s.state,
    sum(f.quantity) as total_units_sold,
    sum(f.revenue) as total_revenue,
    count(distinct f.order_id) as total_orders
from {{ ref('fact_sales') }} f
left join {{ ref('dim_suppliers') }} s
    on f.supplier_id = s.supplier_id
group by
    s.supplier_id,
    s.supplier_name,
    s.city,
    s.state