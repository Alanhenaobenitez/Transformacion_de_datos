-- Test para verificar que los clientes del 1 al 5 tienen al menos una orden
-- Identifica clientes sin órdenes

SELECT
    c.id_cliente,
    c.nombre,
    'Sin órdenes' AS error_message
FROM {{ ref('stg_customers') }} c
LEFT JOIN {{ ref('stg_orders') }} o
    ON c.id_cliente = o.id_cliente
WHERE c.id_cliente IN (1, 2, 3, 4, 5)
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(o.id_pedido) = 0
