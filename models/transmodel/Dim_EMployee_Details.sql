{{
    config(
        materialized='table'
    )
}}

select * from {{ source('employee_source', 'employee_details') }}

