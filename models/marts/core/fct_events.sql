{{ config(materialized='table') }}

SELECT
    session_id,
    created_at,
    user_id,
    event_name,
    event_id,
    {{ rolling_average_n_periods() }}

FROM {{ ref('stg_bingeflix__events') }}
