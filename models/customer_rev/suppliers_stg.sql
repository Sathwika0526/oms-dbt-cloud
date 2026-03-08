{{ config(
    materialized='view'
) }}

select
    supplierid      as supplier_id,
    suppliername    as supplier_name,
    contactperson   as contact_person,
    email           as email,
    phone           as phone,
    address         as address,
    city            as city,
    state           as state,
    zipcode         as zipcode,
    updated_at
from {{ source('landing', 'suppliers') }}