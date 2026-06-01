-- Test para verificar que no hay clientes duplicados
-- FALLA si hay múltiples clientes con el mismo ID

SELECT
    id_cliente,
    COUNT(*) AS cantidad
FROM {{ ref('stg_customers') }}
GROUP BY id_cliente
HAVING COUNT(*) > 1
