{{ config(
    materialized='view'
) }}

select
    store_id,
    store_name,
    address,
    city,
    state,
    zipcode,
    email,
    phone
from {{ ref('stores_stg') }}