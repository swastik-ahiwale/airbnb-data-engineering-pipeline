{% macro tag(column_name) %}

    CASE
        WHEN {{ column_name }} < 50 THEN 'LOW'
        WHEN {{ column_name }} < 150 THEN 'MEDIUM'
        ELSE 'HIGH'
    END

{% endmacro %}