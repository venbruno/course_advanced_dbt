{% test not_test(model, column_name) %}

    select *
    from {{ model }}
    where lower({{ column_name }}) like '%test%'

{% endtest %}