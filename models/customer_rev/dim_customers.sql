{{ config(
    materialized='view'
) }}

select
    customerid as customer_id,
    firstname as first_name,
    lastname as last_name,
    firstname || ' ' || lastname as customer_name,
    email,
    phone,
    address,
    city,
    state,
    zipcode,
    updated_at
from {{ source('landing', 'customers') }}