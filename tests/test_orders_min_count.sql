-- Test para verificar que hay al menos 5 órdenes registradas
-- Basado en los datos de test: esperamos al menos 5 órdenes válidas

WITH order_count AS (
    SELECT COUNT(*) AS total_orders
    FROM {{ ref('stg_orders') }}
    WHERE monto_total > 0
)

SELECT *
FROM order_count
WHERE total_orders < 5
