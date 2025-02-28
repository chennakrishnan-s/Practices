{% snapshot snappy %}
   {{
    config(
            target_schema = 'snippts',
            unique_key = 'employee_id',
            strategy = 'check',
            check_cols = ['salary', 'location']
    )
   }}

    select * from {{ source('employee_source', 'dim_employee_details') }}
 {% endsnapshot %}