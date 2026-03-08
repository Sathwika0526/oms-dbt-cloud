{{ config(
    materialized='view'
) }}

select
    product_id,
    product_name,
    category,
    retail_price,
    supplier_price,
    supplier_id
from {{ ref('products_stg') }}