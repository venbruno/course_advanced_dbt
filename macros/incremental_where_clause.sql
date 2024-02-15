{%- macro incremental_where_clause(column_name = 'created_at', lookback_window = -3, periods = 'day') -%}

WHERE {{ column_name }} >= (SELECT DATEADD('{{ periods }}', {{ lookback_window }}, MAX({{ column_name }})) FROM {{ this }})

{%- endmacro -%}