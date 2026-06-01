--models/final/fct_customer_revenue.sql

WITH customers_orders AS (
    SELECT
        id_cliente,
        id_pedido,
        monto_total,
        codigo_pais
    FROM {{ ref('int_customers_orders') }}
)

SELECT
    id_cliente,
    codigo_pais,
    SUM(monto_total) AS ingresos_totales,
    COUNT(id_pedido) AS total_pedidos
FROM customers_orders
GROUP BY 1,2