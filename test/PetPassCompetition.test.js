const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("PetPassCompetition", function () {
    let PetPassCompetition;
    let petPassCompetition;
    let PremiumPackage;
    let premiumPackage;
    let owner;
    let addr1;
    let addr2;

    beforeEach(async function () {
        [owner, addr1, addr2] = await ethers.getSigners();

        PremiumPackage = await ethers.getContractFactory("PremiumPackage");
        premiumPackage = await PremiumPackage.deploy(ethers.utils.parseEther("1"));
        await premiumPackage.deployed();

        PetPassCompetition = await ethers.getContractFactory("PetPassCompetition");
        petPassCompetition = await PetPassCompetition.deploy(premiumPackage.address);
    });

    it("should allow owner to create a competition", async function () {
        await petPassCompetition.createCompetition(0, 1000);
        expect(await petPassCompetition.totalCompetitions()).to.equal(1);
    });

    it("should accept contributions to the prize pool", async function () {
        await petPassCompetition.createCompetition(0, 1000);
        await petPassCompetition.connect(addr1).contributeToPrizePool(1, { value: ethers.utils.parseEther("1") });
        const prizePool = await petPassCompetition.getPrizePool(1);
        expect(prizePool).to.equal(ethers.utils.parseEther("1"));
    });

    it("should allow owner to distribute prize to the winner", async function () {
        await petPassCompetition.createCompetition(0, 1000);
        await petPassCompetition.connect(addr1).contributeToPrizePool(1, { value: ethers.utils.parseEther("1") });
        await petPassCompetition.connect(owner).distributePrizes(1, addr1.address);
        const competition = await petPassCompetition.competitions(1);
        expect(competition.winner).to.equal(addr1.address);
    });
});
