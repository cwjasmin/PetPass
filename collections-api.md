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

### IPFS

#### Upload files and JSON metadata to the decentralized InterPlanetary File System
##### Used to store files such as nfts, badgets, pet images, etc.
```http
POST https://ipfsapi-v2.vottun.tech/ipfs/v2/file/upload
```

**Headers:**
```http
x-application-vkn: <app-id>
Authorization: Bearer <token>
```

**Body:**
| name | type    | required | description           |
|-----------|---------|-----------|----------------------|
| filename      | string | yes       | The name of the file. This name is used to store it at database    |
| file     | file | yes      | the file to be uploaded in multi-part format |
			

**Example Response:**
```json
{
    "hash": "https://ipfsgw.vottun.tech/ipfs/bafybeifd5tzmewtajswdp3q4kn52f5nxauovhiqth3m457ucmoe6m3dniq"
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
