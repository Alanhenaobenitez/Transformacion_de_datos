--models/staging/stg_orders.sql
SELECT
    order_id AS id_pedido,
    customer_id AS id_cliente,
    order_date AS fecha_pedido,
    amount AS monto_total
FROM {{ source('datos_csv', 'raw_orders') }}