--models/intermediate/int_customers.sql

WITH customers AS (
    SELECT
        id_cliente,
        nombre,
        codigo_pais,
        fecha_creacion
    FROM {{ ref('stg_customers') }}
),

orders AS (
    SELECT
        id_pedido,
        id_cliente,
        fecha_pedido,
        monto_total
    FROM {{ ref('stg_orders') }}
)

SELECT
    c.id_cliente,
    c.codigo_pais,
    c.fecha_creacion,
    o.id_pedido,
    o.fecha_pedido,
    o.monto_total
FROM customers c
LEFT JOIN orders o 
     ON c.id_cliente = o.id_cliente