// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
//Arbiscan deployed: 0x12707256c92680a1696098a2d405E7D3871A1DB5
// https://sepolia.arbiscan.io/address/0x12707256c92680a1696098a2d405E7D3871A1DB5#code
// Fork contracts of TaxExemption

contract PremiumPackage {
    string public name;
    string public symbol;
    address private _owner;
    uint256 public tokenCounter;
    uint256 public mintPrice;
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(uint256 => string) private _tokenURIs;
    mapping(uint256 => bool) public isPremium;
    mapping(uint256 => uint256) public mintTimestamps;

    struct Subscription {
        bool active;
        uint256 renewalDate;
    }
    mapping(uint256 => Subscription) public subscriptions;

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );
    event SubscriptionRenewed(uint256 indexed tokenId, uint256 newRenewalDate);
    event SubscriptionCancelled(uint256 indexed tokenId);

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not the contract owner");
        _;
    }

    constructor(uint256 _mintPrice) {
        name = "PremiumPackage";
        symbol = "PP";
        _owner = msg.sender;
        tokenCounter = 0;
        mintPrice = _mintPrice;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        _owner = newOwner;
    }

    function balanceOf(address account) public view returns (uint256) {
        require(account != address(0), "Balance query for the zero address");
        return _balances[account];
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        address tokenOwner = _owners[tokenId];
        require(tokenOwner != address(0), "Owner query for nonexistent token");
        return tokenOwner;
    }

    function _exists(uint256 tokenId) internal view returns (bool) {
        return _owners[tokenId] != address(0);
    }

    function approve(address to, uint256 tokenId) public {
        address tokenOwner = ownerOf(tokenId);
        require(to != tokenOwner, "Approval to current owner");
        require(msg.sender == tokenOwner, "Caller is not token owner");
        _tokenApprovals[tokenId] = to;
        emit Approval(tokenOwner, to, tokenId);
    }

    function getApproved(uint256 tokenId) public view returns (address) {
        require(_exists(tokenId), "Approved query for nonexistent token");
        return _tokenApprovals[tokenId];
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "Mint to the zero address");
        require(!_exists(tokenId), "Token already minted");

        _balances[to] += 1;
        _owners[tokenId] = to;
        emit Transfer(address(0), to, tokenId);
    }

    function _setTokenURI(uint256 tokenId, string memory uri) internal {
        require(_exists(tokenId), "URI set of nonexistent token");
        _tokenURIs[tokenId] = uri;
    }

    function tokenURI(uint256 tokenId) public view returns (string memory) {
        require(_exists(tokenId), "URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }

    function mintPremiumNFT(address to, string memory uri)
        public
        payable
        returns (uint256)
    {
        require(
            msg.value >= mintPrice,
            "Insufficient payment to mint premium NFT"
        );
        require(to != address(0), "Cannot mint to the zero address");

        uint256 newTokenId = tokenCounter;
        _mint(to, newTokenId);
        _setTokenURI(newTokenId, uri);

        isPremium[newTokenId] = true;
        mintTimestamps[newTokenId] = block.timestamp;
        subscriptions[newTokenId] = Subscription(
            true,
            block.timestamp + 30 days
        );

        tokenCounter += 1;
        return newTokenId;
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        payable(_owner).transfer(balance);
    }

    function isTokenPremium(uint256 tokenId) public view returns (bool) {
        require(_exists(tokenId), "Query for nonexistent token");
        return isPremium[tokenId];
    }

    function renewSubscription(uint256 tokenId) public payable {
        require(_exists(tokenId), "Query for nonexistent token");
        require(subscriptions[tokenId].active, "Subscription is not active");
        require(
            msg.value >= mintPrice,
            "Insufficient payment to renew subscription"
        );
        require(
            block.timestamp >= subscriptions[tokenId].renewalDate,
            "Subscription not yet due for renewal"
        );

        subscriptions[tokenId].renewalDate += 30 days;
        emit SubscriptionRenewed(tokenId, subscriptions[tokenId].renewalDate);
    }

    function cancelSubscription(uint256 tokenId) public {
        require(_exists(tokenId), "Query for nonexistent token");
        require(
            ownerOf(tokenId) == msg.sender,
            "Only the owner can cancel the subscription"
        );

        subscriptions[tokenId].active = false;
        emit SubscriptionCancelled(tokenId);
    }

    function isSubscriptionActive(uint256 tokenId) public view returns (bool) {
        require(_exists(tokenId), "Query for nonexistent token");
        return
            subscriptions[tokenId].active &&
            block.timestamp <= subscriptions[tokenId].renewalDate;
    }

    function setMintPrice(uint256 _newPrice) public onlyOwner {
        mintPrice = _newPrice;
    }

    function getSubscriptionDetails(uint256 tokenId)
        public
        view
        returns (bool active, uint256 renewalDate)
    {
        require(_exists(tokenId), "Query for nonexistent token");
        Subscription memory sub = subscriptions[tokenId];
        return (sub.active, sub.renewalDate);
    }
}
