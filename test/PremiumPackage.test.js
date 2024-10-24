const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("PremiumPackage", function () {
    let PremiumPackage, premiumPackage, owner, addr1, addr2;
    const mintPrice = ethers.utils.parseEther("1");

    beforeEach(async function () {
        [owner, addr1, addr2] = await ethers.getSigners();
        PremiumPackage = await ethers.getContractFactory("PremiumPackage");
        premiumPackage = await PremiumPackage.deploy(mintPrice);
        await premiumPackage.deployed();
    });

    it("should mint a premium NFT and start a subscription", async function () {
        await premiumPackage.connect(addr1).mintPremiumNFT("tokenURI", { value: mintPrice });
        const tokenId = 0;
        expect(await premiumPackage.isTokenPremium(tokenId)).to.be.true;
        expect(await premiumPackage.isSubscriptionActive(tokenId)).to.be.true;
    });

    it("should not allow minting with insufficient payment", async function () {
        await expect(
            premiumPackage.connect(addr1).mintPremiumNFT("tokenURI", { value: ethers.utils.parseEther("0.5") })
        ).to.be.revertedWith("Insufficient payment to mint premium NFT");
    });

    it("should allow subscription renewal", async function () {
        await premiumPackage.connect(addr1).mintPremiumNFT("tokenURI", { value: mintPrice });
        const tokenId = 0;

        // Simulate time passing
        await ethers.provider.send("evm_increaseTime", [30 * 24 * 60 * 60]); // 30 days
        await ethers.provider.send("evm_mine");

        await premiumPackage.connect(addr1).renewSubscription(tokenId, { value: mintPrice });
        expect(await premiumPackage.isSubscriptionActive(tokenId)).to.be.true;
    });

    it("should not allow renewal with insufficient payment", async function () {
        await premiumPackage.connect(addr1).mintPremiumNFT("tokenURI", { value: mintPrice });
        const tokenId = 0;

        // Simulate time passing
        await ethers.provider.send("evm_increaseTime", [30 * 24 * 60 * 60]); // 30 days
        await ethers.provider.send("evm_mine");

        await expect(
            premiumPackage.connect(addr1).renewSubscription(tokenId, { value: ethers.utils.parseEther("0.5") })
        ).to.be.revertedWith("Insufficient payment to renew subscription");
    });

    it("should allow subscription cancellation", async function () {
        await premiumPackage.connect(addr1).mintPremiumNFT("tokenURI", { value: mintPrice });
        const tokenId = 0;

        await premiumPackage.connect(addr1).cancelSubscription(tokenId);
        expect(await premiumPackage.isSubscriptionActive(tokenId)).to.be.false;
    });

    it("should allow owner to withdraw funds", async function () {
        await premiumPackage.connect(addr1).mintPremiumNFT("tokenURI", { value: mintPrice });
        const initialOwnerBalance = await ethers.provider.getBalance(owner.address);

        await premiumPackage.connect(owner).withdraw();
        const finalOwnerBalance = await ethers.provider.getBalance(owner.address);

        expect(finalOwnerBalance).to.be.gt(initialOwnerBalance);
    });

    it("should run a simple test", function () {
        expect(true).to.be.true;
    });
});
