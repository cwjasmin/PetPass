// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * filename: PetPassToken
 * desc: This contract implements an ERC1155 token with minting functionality, allowing users to tokenize their pets.
 *      Each pet is represented by a unique token ID (auto incremented), enabling flexible and secure management of multiple pet tokens.
 *      The token is owned by a specified owner who can mint new tokens.
 *      The PetPassToken is designed to be used within the PetPass ecosystem, providing a flexible and secure
 *      token standard for managing and interacting with tokenized pets.
 * author: TaxExemption
 */
contract PetPassToken is ERC1155, Ownable {
    uint256 private currentTokenId = 0;

    constructor(address initialOwner) ERC1155("URI Where Metadata is stored") {
        transferOwnership(initialOwner);
    }

    function mintPetToken(address to, uint256 amount, bytes memory data) public onlyOwner {
        uint256 newTokenId = currentTokenId;
        _mint(to, newTokenId, amount, data);
        currentTokenId += 1;
    }
}
