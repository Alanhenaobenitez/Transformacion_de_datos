-- Test para verificar que los montos de órdenes están dentro del rango válido
-- Esperado: montos entre 0 y 100000

SELECT
    id_pedido,
    id_cliente,
    monto_total
FROM {{ ref('stg_orders') }}
WHERE monto_total < 0 OR monto_total > 100000
