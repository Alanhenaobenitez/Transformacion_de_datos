-- Modelo intermedio mejorado usando macros
-- Ejemplo de cómo combinar datos limpiando strings y categorizando

WITH customers AS (
    SELECT
        id_cliente,
        {{ clean_string('nombre') }} AS nombre_limpio,
        codigo_pais
    FROM {{ ref('stg_customers') }}
),

orders AS (
    SELECT
        id_cliente,
        id_pedido,
        monto_total,
        fecha_pedido,
        {{ get_payment_category('monto_total') }} AS categoria_pago
    FROM {{ ref('stg_orders') }}
    WHERE monto_total > 0  -- Usar variable sería: > {{ var('min_order_amount') }}
)

SELECT
    o.id_pedido,
    c.id_cliente,
    c.nombre_limpio,
    c.codigo_pais,
    o.monto_total,
    o.categoria_pago,
    o.fecha_pedido
FROM orders o
INNER JOIN customers c
    ON o.id_cliente = c.id_cliente
