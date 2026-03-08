{{ config(
    materialized='view'
) }}

select
    orderid as order_id,
    orderdate as order_date,
    customerid as customer_id,
    employeeid as employee_id,
    storeid as store_id,
    status as status_cd,
    case
        when status = '01' then 'In Progress'
        when status = '02' then 'Completed'
        when status = '03' then 'Cancelled'
        else null
    end as status_desc,
    case
        when storeid = '1000' then 'Online'
        else 'In-store'
    end as order_channel,
    updated_at,
    current_timestamp as dbt_updated_at
from {{ source('landing', 'orders') }}