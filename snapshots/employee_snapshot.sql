{% snapshot employee_details_history %}

    {{
        config(
            target_schema='mart',
            strategy='timestamp',
            unique_key='ID',
            updated_at='RECEIVED_AT',
            invalidate_hard_deletes=True
        )
    }}

with emp_details as (
    select * from {{ ref('stg_employee_details') }}
)

select * from emp_details

{% endsnapshot %}