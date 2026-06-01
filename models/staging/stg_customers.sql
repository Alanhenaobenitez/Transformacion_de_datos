--models/staging/stg_customers.sql

SELECT
    customer_id AS id_cliente,
    name AS nombre,
    country_code AS codigo_pais,
    created_at AS fecha_creacion
FROM {{ source('datos_csv', 'raw_customers') }}