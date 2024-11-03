# API Documentation

## Table of Contents
- [Introduction](#introduction)
- [API Structure](#api-structure)
- [Endpoints](#endpoints)
- [Additional Notes](#additional-notes)

## Introduction
This document details all APIs used in the PetPass Mobile App project, including their configuration and usage examples. The platform utilizes Vottun's blockchain services for NFT management and Crossmint for payment processing.

## API Structure
Each API is documented with the following structure:
- Name and description
- HTTP Method
- Required Headers
- Parameters
- Request Body
- Response Example
- Additional Notes

## Endpoints

### NFT 1155
Used for registering pets in the application and delivering badges for contest winners

**Endpoint:**
```
POST https://ipfsapi-v2.vottun.tech/ipfs/v2/file/upload
```

**Headers:**
```
x-application-vkn: <app-id>
Authorization: Bearer <token>
```

**Body Parameters:**

| Parameter | Type | Required | Description |
|-----------|---------|-----------|----------------------|
| name | string | yes | Token name for the NFT collection |
| symbol | string | yes | Smart contract symbol to be assigned on the blockchain |
| ipfsUri | string | yes | Base URI for asset metadata. Assets will be assigned at ipfsUri/{tokenId}.json |
| royaltyValue | int | yes | Address for receiving royalties |
| network | int | yes | Blockchain network chain ID |
| gasLimit | int | no | Maximum gas estimate for transaction. If not set, platform estimates automatically |
| alias | string | yes | User-friendly nickname for the contract |

**Example Response:**
```json
{
    "contractAddress": "0x62F0E381Cd7f3e..b2b9cB7Eb02856C511",
    "txHash": "0x72f9f35c4fe92b658..c5608c31df06807fc9f5e7243e6db6719e903"
}
```

### NFT 721
Used for issuing unique subscription badges to paying users

**Endpoint:**
```
POST https://ipfsapi-v2.vottun.tech/ipfs/v2/file/upload
```

**Headers:**
```
x-application-vkn: <app-id>
Authorization: Bearer <token>
```

**Body Parameters:**

| Parameter | Type | Required | Description |
|-----------|---------|-----------|----------------------|
| name | string | yes | Smart contract name |
| symbol | string | yes | Smart contract symbol |
| network | int | yes | Target blockchain network chain ID |
| gasLimit | int | no | Maximum transaction gas estimate |
| alias | string | yes | Contract name in Vottun platform |

**Example Response:**
```json
{
    "contractAddress": "0x9a89cef53a044..2acfc3a66153408adf",
    "txHash": "0xb3ba0828ac232c48b69bb3..63ddfef73b5d6860a82a6"
}
```

### Subscription NFT (Crossmint)
Handles pet owner subscriptions, supporting both cryptocurrency and traditional card payments

**Endpoint:**
```
POST https://staging.crossmint.com/api/2022-06-09/collections/
```

**Headers:**
```
Authorization: <X-API-KEY>
```

**Body Parameters:**

| Parameter | Type | Required | Description |
|-----------|---------|-----------|----------------------|
| name | string | yes | Collection name |
| symbol | string | yes | Collection symbol |
| metadata | object | yes | Collection metadata including description and image |
| network | string | yes | Target blockchain network |
| subscription | object | yes | Subscription configuration settings |

**Example Response:**
```json
{
  "id": "5263650e-6d43-4ed3-9e31-0cf593d076a4",
  "metadata": {
    "name": "Collection Subscriptions",
    "description": "Pet Contest Platform Subscription",
    "imageUrl": "https://cdn.io/metadata.json",
    "symbol": "VTN"
  },
  "fungibility": "semi-fungible",
  "onChain": {
    "chain": "arbitrum-sepolia",
    "type": "erc-1155"
  },
  "actionId": "5263650e-6d43-4ed3-9e31-0cf593d076a4",
  "subscription": {
    "enabled": true
  }
}
```

### IPFS Storage
Used for decentralized storage of NFTs, badges, pet images, and related assets

**Endpoint:**
```
POST https://ipfsapi-v2.vottun.tech/ipfs/v2/file/upload
```

**Headers:**
```
x-application-vkn: <app-id>
Authorization: Bearer <token>
```

**Body Parameters:**

| Parameter | Type | Required | Description |
|-----------|---------|-----------|----------------------|
| filename | string | yes | File name for database storage |
| file | file | yes | File to upload in multi-part format |

**Example Response:**
```json
{
    "hash": "https://ipfsgw.vottun.tech/ipfs/bafybeifd5tzmewtajswdp3q4kn52f5nxauovhiqth3m457ucmoe6m3dniq"
}
```

## Additional Notes

### Vottun Integration
- All requests require authentication token in headers
- Gas prices are automatically estimated if not specified
- Supports multiple blockchain networks including Ethereum, Polygon, and Arbitrum
- Test transactions have been conducted on the Arbitrum sepolia test network

### Crossmint Integration
- Supports both crypto and fiat payment methods
- Handles subscription lifecycle management
- Requires separate API keys for staging and production
- Supports major credit cards and popular cryptocurrencies
- After creating the collection for subscribing users approximately 1000 nft are created, a payment order is sent if you want to subscribe and you can get the subscription NFT
- Automatic handling of payment reconciliation
- Payments will always be in USDC or USDC.e
- Test transactions have been performed on the Arbitrum sepolia test network.

  
