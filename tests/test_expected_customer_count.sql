-- Test para verificar que hay exactamente 5 clientes
-- Basado en los datos de test

WITH customer_count AS (
    SELECT COUNT(*) AS total_customers
    FROM {{ ref('stg_customers') }}
)

SELECT *
FROM customer_count
WHERE total_customers != 5
