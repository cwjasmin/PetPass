const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("PetPassToken", function () {
  let PetPassToken;
  let petPassToken;
  let owner;
  let addr1;
  let addr2;

  beforeEach(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();

    PetPassToken = await ethers.getContractFactory("PetPassToken");
    petPassToken = await PetPassToken.deploy(owner.address);
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await petPassToken.owner()).to.equal(owner.address);
    });

    it("Should assign the total supply of tokens to the owner", async function () {
      const ownerBalance = await petPassToken.balanceOf(owner.address);
      expect(await petPassToken.totalSupply()).to.equal(ownerBalance);
    });
  });

  describe("Transactions", function () {
    it("Should transfer tokens between accounts", async function () {
      // Mint some tokens to owner
      await petPassToken.mint(owner.address, 50);

      // Transfer 50 tokens from owner to addr1
      await petPassToken.transfer(addr1.address, 50);
      const addr1Balance = await petPassToken.balanceOf(addr1.address);
      expect(addr1Balance).to.equal(50);

      // Transfer 50 tokens from addr1 to addr2
      await petPassToken.connect(addr1).transfer(addr2.address, 50);
      const addr2Balance = await petPassToken.balanceOf(addr2.address);
      expect(addr2Balance).to.equal(50);
    });

    it("Should fail if sender doesn't have enough tokens", async function () {
      const initialOwnerBalance = await petPassToken.balanceOf(owner.address);

      // Try to send 1 token from addr1 (0 tokens) to owner
      await expect(
        petPassToken.connect(addr1).transfer(owner.address, 1)
      ).to.be.revertedWithCustomError(petPassToken, "ERC20InsufficientBalance");

      // Owner balance shouldn't have changed
      expect(await petPassToken.balanceOf(owner.address)).to.equal(
        initialOwnerBalance
      );
    });
  });

  describe("Minting", function () {
    it("Should mint tokens to a given address", async function () {
      await petPassToken.mint(addr1.address, 100);
      expect(await petPassToken.balanceOf(addr1.address)).to.equal(100);
    });

    it("Should only allow owner to mint tokens", async function () {
      await expect(
        petPassToken.connect(addr1).mint(addr2.address, 100)
      ).to.be.revertedWithCustomError(petPassToken, "OwnableUnauthorizedAccount");
    });
  });
});
