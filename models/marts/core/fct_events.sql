{{
    config(
        materialized='incremental',
        unique_key='event_id',
        on_schema_change='ignore',
        incremental_strategy='delete+insert'
    )
}}

SELECT
    session_id,
    created_at,
    user_id,
    event_name,
    event_id,
    {{ rolling_average_n_periods() }}

FROM {{ ref('stg_bingeflix__events') }}

{% if is_incremental() %}

{{ incremental_where_clause() }}

{% endif %}
