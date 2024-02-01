{% macro rolling_average_n_periods(agg_type="count", column_name="event_id", partition_by="user_id", time_frame="7", order_by='created_at') %}
    {{ agg_type }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ time_frame }} PRECEDING AND CURRENT ROW
            ) AS {{ agg_type }}_{{ time_frame }}_periods_{{ column_name }}
{% endmacro %}
