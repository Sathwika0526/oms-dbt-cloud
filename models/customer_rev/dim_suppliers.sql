{{ config(
    materialized='view'
) }}

select
    supplier_id,
    supplier_name,
    contact_person,
    email,
    phone,
    address,
    city,
    state,
    zipcode
from {{ ref('suppliers_stg') }}