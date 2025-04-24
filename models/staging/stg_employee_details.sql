{{
  config(
    materialized = 'incremental',
    unique_key = 'id',
    merge_update_columns = ['position', 'department']
  )
}}

select
  *

from {{ source('stg_employee_source', 'employee_details') }}

{% if is_incremental() %}

  where received_at > (select max(received_at) from {{this}})

{% endif %}