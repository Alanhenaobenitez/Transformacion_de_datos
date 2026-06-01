-- Macro para limpiar strings: trim y convertir a minúsculas

{% macro clean_string(column_name) -%}
    LOWER(TRIM({{ column_name }}))
{%- endmacro %}
