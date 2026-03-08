{{ config(
    materialized='table'
) }}

select
    o.order_id,
    c.customer_id,
    oi.product_id,
    s.store_id,
    o.order_date,
    p.supplier_id,
    oi.quantity,
    oi.unit_price,
    oi.line_revenue as revenue
from {{ ref('orders_stg') }} o
join {{ ref('orderitems_stg') }} oi
    on o.order_id = oi.order_id
left join {{ ref('dim_customers') }} c
    on o.customer_id = c.customer_id
left join {{ ref('dim_stores') }} s
    on o.store_id = s.store_id
left join {{ ref('dim_products') }} p
    on oi.product_id = p.product_id
left join {{ ref('dim_dates') }} d
    on o.order_date = d.full_date