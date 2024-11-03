# Documentación de APIs

## Índice
- [Introducción](#introducción)
- [Estructura de las APIs](#estructura-de-las-apis)
- [Base URLs](#base-urls)
- [Autenticación](#autenticación)
- [Endpoints](#endpoints)

## Introducción
Este documento detalla todas las APIs utilizadas en el proyecto, su configuración y ejemplos de uso.

## Estructura de las APIs
Cada API está documentada con la siguiente estructura:
- Nombre y descripción
- Método HTTP
- Headers requeridos
- Parámetros
- Ejemplo de Request
- Ejemplo de Response
- Códigos de estado
- Notas adicionales

## Base URLs
- Producción: `https://api.ejemplo.com/v1`
- Desarrollo: `https://dev-api.ejemplo.com/v1`
- Staging: `https://staging-api.ejemplo.com/v1`

## Autenticación
```http
Authorization: Bearer <your_token>
```

## Endpoints

### Usuarios

#### Obtener Usuario
```http
GET /api/users/{id}
```

**Headers:**
```http
Accept: application/json
Authorization: Bearer <token>
```

**Parámetros URL:**
| Parámetro | Tipo   | Requerido | Descripción     |
|-----------|--------|-----------|-----------------|
| id        | string | Sí        | ID del usuario  |

**Ejemplo Request:**
```http
GET /api/users/123
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...
```

**Ejemplo Response:**
```json
{
    "status": "success",
    "data": {
        "id": "123",
        "name": "Juan Pérez",
        "email": "juan@ejemplo.com",
        "created_at": "2024-01-01T00:00:00Z"
    }
}
```

**Códigos de Estado:**
| Código | Descripción                     |
|--------|---------------------------------|
| 200    | Success                         |
| 401    | No autorizado                   |
| 404    | Usuario no encontrado           |
| 500    | Error interno del servidor      |

---

### Productos

#### Listar Productos
```http
GET /api/products
```

**Headers:**
```http
Accept: application/json
Authorization: Bearer <token>
```

**Parámetros Query:**
| Parámetro | Tipo    | Requerido | Descripción           |
|-----------|---------|-----------|----------------------|
| page      | integer | No        | Número de página     |
| limit     | integer | No        | Elementos por página |
| category  | string  | No        | Filtrar por categoría|

**Ejemplo Request:**
```http
GET /api/products?page=1&limit=10&category=electronics
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...
```

**Ejemplo Response:**
```json
{
    "status": "success",
    "data": {
        "items": [
            {
                "id": "1",
                "name": "Smartphone XYZ",
                "price": 599.99,
                "category": "electronics"
            }
        ],
        "pagination": {
            "current_page": 1,
            "total_pages": 5,
            "total_items": 50
        }
    }
}
```

**Códigos de Estado:**
| Código | Descripción                |
|--------|----------------------------|
| 200    | Success                    |
| 400    | Parámetros inválidos      |
| 401    | No autorizado             |
| 500    | Error interno del servidor |

---

### Órdenes

#### Crear Orden
```http
POST /api/orders
```

**Headers:**
```http
Content-Type: application/json
Accept: application/json
Authorization: Bearer <token>
```

**Body Parameters:**
```json
{
    "products": [
        {
            "id": "1",
            "quantity": 2
        }
    ],
    "shipping_address": {
        "street": "Calle Principal 123",
        "city": "Ciudad Ejemplo",
        "country": "País Ejemplo",
        "postal_code": "12345"
    }
}
```

**Ejemplo Response:**
```json
{
    "status": "success",
    "data": {
        "order_id": "ORD-123456",
        "total": 1199.98,
        "status": "pending",
        "created_at": "2024-01-01T00:00:00Z"
    }
}
```

**Códigos de Estado:**
| Código | Descripción                     |
|--------|---------------------------------|
| 201    | Orden creada exitosamente       |
| 400    | Datos de orden inválidos        |
| 401    | No autorizado                   |
| 422    | Error de validación             |
| 500    | Error interno del servidor      |

## Notas Adicionales
- Todas las peticiones deben incluir el token de autenticación en el header
- Los timestamps están en formato ISO 8601
- Las respuestas de error incluyen un mensaje descriptivo
- Se recomienda manejar los errores 429 (Rate Limit) con un backoff exponencial
