-- Test para verificar que no hay órdenes duplicadas
-- FALLA si hay múltiples órdenes con el mismo ID

SELECT
    id_pedido,
    COUNT(*) AS cantidad
FROM {{ ref('stg_orders') }}
GROUP BY id_pedido
HAVING COUNT(*) > 1
