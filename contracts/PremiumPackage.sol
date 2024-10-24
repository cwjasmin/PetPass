// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * name: PremiumPackage
 * desc: This contract defines a PremiumPackage NFT contract, which represents a subscription to a premium service.
 *      The subscription must be renewed or canceled by the owner.
 *      The contract owner can set the price for minting and manage withdrawals of funds.
 *      Premium NFTs represent access to special competitions, and subscriptions are
 *  tied to the NFT with automatic expiry after 30 days. Users can renew their 
 *      subscriptions by paying the minting fee again.
 * author: TaxExemption
 */

contract PremiumPackage is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;
    uint256 public mintPrice;
    mapping(uint256 => bool) public isPremium;
    mapping(uint256 => uint256) public mintTimestamps;
    struct Subscription {
        bool active;
        uint256 renewalDate;
    }
    mapping(uint256 => Subscription) public subscriptions;

    // Set the price for premium NFT minting in the constructor
    constructor(uint256 _mintPrice) ERC721("PremiumPackage", "PP") {
        tokenCounter = 0;
        mintPrice = _mintPrice;
    }

    // Allow users to mint a premium NFT by paying the mintPrice
    function mintPremiumNFT(string memory tokenURI) public payable returns (uint256) {
        require(msg.value >= mintPrice, "Insufficient payment to mint premium NFT");
        
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        isPremium[newTokenId] = true;
        mintTimestamps[newTokenId] = block.timestamp;
        subscriptions[newTokenId] = Subscription(true, block.timestamp + 30 days);
        tokenCounter += 1;

        return newTokenId;
    }

    // Withdraw funds to the contract owner
    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    // Additional functions for premium NFT interactions
    function isTokenPremium(uint256 tokenId) public view returns (bool) {
        require(_exists(tokenId), "Query for nonexistent token");
        return isPremium[tokenId];
    }

    function renewSubscription(uint256 tokenId) public payable {
        require(_exists(tokenId), "Query for nonexistent token");
        require(subscriptions[tokenId].active, "Subscription is not active");
        require(msg.value >= mintPrice, "Insufficient payment to renew subscription");
        require(block.timestamp >= subscriptions[tokenId].renewalDate, "Subscription not yet due for renewal");

        subscriptions[tokenId].renewalDate += 30 days;
    }

    function cancelSubscription(uint256 tokenId) public {
        require(_exists(tokenId), "Query for nonexistent token");
        require(ownerOf(tokenId) == msg.sender, "Only the owner can cancel the subscription");

        subscriptions[tokenId].active = false;
    }

    // Check if the subscription is active. Useful for frontend to check if the user can enter a competition.
    function isSubscriptionActive(uint256 tokenId) public view returns (bool) {
        require(_exists(tokenId), "Query for nonexistent token");
        return subscriptions[tokenId].active && block.timestamp <= subscriptions[tokenId].renewalDate;
    }
}
