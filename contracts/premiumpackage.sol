// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

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

    event SubscriptionRenewed(uint256 indexed tokenId, uint256 newRenewalDate);
    event SubscriptionCancelled(uint256 indexed tokenId);

    constructor(uint256 _mintPrice) 
        ERC721("PremiumPackage", "PP") 
        Ownable(msg.sender) 
    {
        tokenCounter = 0;
        mintPrice = _mintPrice;
    }

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

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        payable(owner()).transfer(balance);
    }

    function isTokenPremium(uint256 tokenId) public view returns (bool) {
        require(_exists(tokenId), "PremiumPackage: Query for nonexistent token");
        return isPremium[tokenId];
    }

    function renewSubscription(uint256 tokenId) public payable {
        require(_exists(tokenId), "PremiumPackage: Query for nonexistent token");
        require(subscriptions[tokenId].active, "PremiumPackage: Subscription is not active");
        require(msg.value >= mintPrice, "PremiumPackage: Insufficient payment to renew subscription");
        require(
            block.timestamp >= subscriptions[tokenId].renewalDate, 
            "PremiumPackage: Subscription not yet due for renewal"
        );

        subscriptions[tokenId].renewalDate += 30 days;
        emit SubscriptionRenewed(tokenId, subscriptions[tokenId].renewalDate);
    }

    function cancelSubscription(uint256 tokenId) public {
        require(_exists(tokenId), "PremiumPackage: Query for nonexistent token");
        require(
            ownerOf(tokenId) == msg.sender, 
            "PremiumPackage: Only the owner can cancel the subscription"
        );

        subscriptions[tokenId].active = false;
        emit SubscriptionCancelled(tokenId);
    }

    function isSubscriptionActive(uint256 tokenId) public view returns (bool) {
        require(_exists(tokenId), "PremiumPackage: Query for nonexistent token");
        return subscriptions[tokenId].active && block.timestamp <= subscriptions[tokenId].renewalDate;
    }

    function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _ownerOf(tokenId) != address(0);
    }

    function setMintPrice(uint256 _newPrice) public onlyOwner {
        mintPrice = _newPrice;
    }


    function getSubscriptionDetails(uint256 tokenId) public view returns (bool active, uint256 renewalDate) {
        require(_exists(tokenId), "PremiumPackage: Query for nonexistent token");
        Subscription memory sub = subscriptions[tokenId];
        return (sub.active, sub.renewalDate);
    }
}