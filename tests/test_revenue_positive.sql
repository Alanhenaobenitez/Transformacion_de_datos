-- Test para verificar que los ingresos totales siempre sean positivos
-- Falla si hay algún ingreso negativo o cero en la tabla de hechos

SELECT
    id_cliente,
    codigo_pais,
    ingresos_totales
FROM {{ ref('fct_customer_revenue') }}
WHERE ingresos_totales <= 0
