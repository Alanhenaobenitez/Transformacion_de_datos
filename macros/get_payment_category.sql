-- Macro para categorizar montos de pagos

{% macro get_payment_category(amount_column) -%}
    CASE
        WHEN {{ amount_column }} < 100 THEN 'Bajo'
        WHEN {{ amount_column }} >= 100 AND {{ amount_column }} < 500 THEN 'Medio'
        WHEN {{ amount_column }} >= 500 AND {{ amount_column }} < 1000 THEN 'Alto'
        ELSE 'Premium'
    END
{%- endmacro %}
