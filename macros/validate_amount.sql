-- Macro para validar que los montos sean positivos y no nulos

{% macro validate_amount(amount_column, column_name='amount') -%}
    CASE
        WHEN {{ amount_column }} IS NULL THEN 'ERROR: ' || '{{ column_name }} es nulo'
        WHEN {{ amount_column }} < 0 THEN 'ERROR: ' || '{{ column_name }} es negativo'
        WHEN {{ amount_column }} = 0 THEN 'WARNING: ' || '{{ column_name }} es cero'
        ELSE 'OK'
    END
{%- endmacro %}
