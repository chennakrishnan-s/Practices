{{
    config(
        materialized='table'
    )
}}


{%- set project_cities = ['Bangalore', 'Chennai', 'Pune', 'Kochi', 'Mumbai',
'Goa', 'Coimbatore', 'Mangalore', 'Hyderabad'] -%}


select project_city,
{%- for project_city in project_cities -%}
sum(case when project_city = '{{project_city}}' then site_visit end) as {{project_city}}
{% if not loop.last %},{% endif %}
{%- endfor -%}
from snow_db.public.dim1_tb 
group by 1