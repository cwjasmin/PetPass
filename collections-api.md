# Documentación de APIs

## Índice
- [Introducción](#introducción)
- [Estructura de las APIs](#estructura-de-las-apis)
- [Endpoints](#endpoints)

## Introducción
Este documento detalla todas las APIs utilizadas en el proyecto, su configuración y ejemplos de uso.

## Estructura de las APIs
Cada API está documentada con la siguiente estructura:
- Nombre y descripción
- Método HTTP
- Headers requeridos
- Parámetros
- Body
- Ejemplo de Request
- Ejemplo de Body
- Ejemplo de Response
- Notas adicionales

## Endpoints


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



## Notas Adicionales
- Todas las peticiones deben incluir el token de autenticación en el header
- Los timestamps están en formato ISO 8601
- Las respuestas de error incluyen un mensaje descriptivo
- Se recomienda manejar los errores 429 (Rate Limit) con un backoff exponencial
