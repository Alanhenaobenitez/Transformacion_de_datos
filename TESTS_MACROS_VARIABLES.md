# Tests, Macros y Variables Constantes - Documentación

## 📋 Tests Creados

### 1. **staging_tests.yml**
Tests YAML para los modelos de staging que validan:
- **stg_customers**: 
  - `id_cliente`: único y no nulo
  - `nombre`: no nulo
  - `codigo_pais`: no nulo
  - `fecha_creacion`: no nulo

- **stg_orders**: 
  - `id_pedido`: único y no nulo
  - `id_cliente`: no nulo
  - `fecha_pedido`: no nulo
  - `monto_total`: no nulo y >= 0

### 2. **final_tests.yml**
Tests YAML para el modelo final `fct_customer_revenue`:
- `id_cliente`: único y no nulo
- `codigo_pais`: no nulo
- `ingresos_totales`: no nulo
- `total_pedidos`: no nulo

### 3. **test_revenue_positive.sql**
Test personalizado que falla si hay ingresos negativos o cero en la tabla de hechos.

### 4. **test_customer_id_match.sql**
Test de referencia que verifica que todos los `customer_id` en órdenes existan en la tabla de clientes.

---

## 🔧 Macros Creadas

### 1. **generate_alias_name.sql**
Genera nombres personalizados para los aliases de las tablas.

### 2. **clean_string.sql**
Macro reutilizable para limpiar strings (trim + lowercase).
```sql
{{ clean_string(column_name) }}
```

### 3. **validate_amount.sql**
Valida que los montos sean válidos (no nulos, no negativos, no cero).
```sql
{{ validate_amount(monto_total, 'monto_total') }}
```

### 4. **get_payment_category.sql**
Categoriza los montos en 4 categorías: Bajo, Medio, Alto, Premium.
```sql
{{ get_payment_category(monto_total) }}
```

### 5. **constants.sql**
Define variables constantes del proyecto.

---

## 📦 Variables Constantes

Las variables se definen en `dbt_project.yml` y se usan en los modelos con `{{ var('nombre_variable') }}`:

| Variable | Valor | Descripción |
|----------|-------|-------------|
| `min_order_amount` | 0 | Monto mínimo de orden |
| `max_order_amount` | 100000 | Monto máximo de orden |
| `start_date` | 2020-01-01 | Fecha de inicio para filtros |
| `payment_min_low` | 0 | Rango bajo mínimo |
| `payment_max_low` | 100 | Rango bajo máximo |
| `payment_min_medium` | 100 | Rango medio mínimo |
| `payment_max_medium` | 500 | Rango medio máximo |
| `payment_min_high` | 500 | Rango alto mínimo |
| `payment_max_high` | 1000 | Rango alto máximo |

---

## 🚀 Cómo Usar

### Ejecutar todos los tests:
```bash
dbt test
```

### Ejecutar tests de un modelo específico:
```bash
dbt test --select stg_customers
```

### Usar macros en modelos:
```sql
SELECT
    {{ clean_string('nombre') }} as nombre,
    {{ get_payment_category('monto_total') }} as categoria,
    {{ validate_amount('monto_total') }} as validacion
FROM {{ ref('modelo') }}
WHERE monto_total >= {{ var('min_order_amount') }}
```

### Usar variables:
```sql
WHERE fecha_pedido >= '{{ var('start_date') }}'
AND monto_total BETWEEN {{ var('payment_min_low') }} AND {{ var('payment_max_high') }}
```

---

## 📁 Estructura de Archivos

```
macros/
  ├── generate_alias_name.sql
  ├── clean_string.sql
  ├── validate_amount.sql
  ├── get_payment_category.sql
  └── constants.sql

models/
  ├── staging/
  │   └── staging_tests.yml
  └── final/
      └── final_tests.yml

tests/
  ├── test_revenue_positive.sql
  └── test_customer_id_match.sql
```

---

## ✅ Próximos Pasos Opcionales

1. Agregar tests para el modelo intermedio `int_customers_orders`
2. Crear más macros específicas del negocio
3. Implementar tests de dbt-expectations para validaciones más complejas
4. Crear seedscon datos de referencia
