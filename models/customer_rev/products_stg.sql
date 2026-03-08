{{ config(
    materialized='view'
) }}

select
    productid      as product_id,
    name           as product_name,
    category       as category,
    retailprice    as retail_price,
    supplierprice  as supplier_price,
    supplierid     as supplier_id,
    updated_at
from {{ source('landing', 'products') }}