{{ config(
    materialized='view'
) }}

select
    storeid     as store_id,
    storename   as store_name,
    address     as address,
    city        as city,
    state       as state,
    zipcode     as zipcode,
    email       as email,
    phone       as phone,
    updated_at
from {{ source('landing', 'stores') }}