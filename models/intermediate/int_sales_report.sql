{{
    config(
        materialized = 'table'
    )
}}

with total_sales as (
    select
        employee_id,
        sum(sales_amount) as total_sales
    from
        {{ source('sales_source', 'sales_data')}}
    group by
        employee_id
)

select
    employee_id,
    total_sales,
    case
        when total_sales >= {{ var('sales_expectation') }} then 'Met'
        else 'Not Met'
    end as sales_expectation_status
from
    total_sales