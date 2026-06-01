-- Variables constantes del proyecto
-- Utilizables en todas las queries con var('nombre_variable')

{% set min_order_amount = 0 %}
{% set max_order_amount = 100000 %}
{% set payment_categories = {
    'bajo': {'min': 0, 'max': 100},
    'medio': {'min': 100, 'max': 500},
    'alto': {'min': 500, 'max': 1000},
    'premium': {'min': 1000}
} %}
