-- Ejemplo de modelo usando macros y variables constantes
-- Este modelo muestra cómo utilizar las funciones y variables creadas

SELECT
    order_id AS id_pedido,
    customer_id AS id_cliente,
    order_date AS fecha_pedido,
    amount AS monto_total,
    {{ get_payment_category('amount') }} AS categoria_pago,
    {{ validate_amount('amount', 'monto_total') }} AS validacion_monto
FROM {{ source('datos_csv', 'raw_orders') }}
WHERE 
    -- Usar variable constante para filtrar por rango de montos
    amount >= {{ var('min_order_amount') }}
    AND amount <= {{ var('max_order_amount') }}
    -- Usar variable constante para filtrar por fecha
    AND order_date >= '{{ var('start_date') }}'
