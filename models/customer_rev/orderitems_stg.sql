{{ config(
    materialized='view'
) }}

select
    orderitemid as order_item_id,
    orderid as order_id,
    productid as product_id,
    quantity as quantity,
    unitprice as unit_price,
    quantity * unitprice as line_revenue,
    updated_at,
    current_timestamp as dbt_updated_at
from {{ source('landing', 'orderitems') }}