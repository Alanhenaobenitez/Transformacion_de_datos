-- Macro para generar nombres de alias personalizados según el prefijo del modelo

{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {%- if custom_alias_name is none -%}
        {{ node.name }}
    {%- else -%}
        {{ custom_alias_name | replace('_MODEL', '') }}
    {%- endif -%}
{%- endmacro %}
