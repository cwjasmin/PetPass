// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./PremiumPackage.sol"; // Import the PremiumPackage contract

/**
 * filename: PetPassCompetition
 * desc: This contract manages competitions where participants can contribute to a prize pool.
 *      The contract owner can create competitions, and participants can join by contributing Ether.
 *      Participants who have paid for the PremiumPackage NFT are eligible to join the competition for free.
 *      After the competition ends, the owner can distribute the prize to the winner.
 *      Competitions have a defined start and end time for registration. Voting for the winner
 *      is conducted off-chain, and the winner is awarded the prize by the contract owner.
 * author: TaxExemption
 */

contract PetPassCompetition is Ownable {
    struct Competition {
        uint256 prizePool;
        address[] participants;
        bool completed;
        address winner;
        uint256 startTime;
        uint256 endTime;
    }

    uint256 public totalCompetitions;
    mapping(uint256 => Competition) public competitions;
    PremiumPackage public premiumPackage; // Reference to the PremiumPackage contract

    event CompetitionCreated(uint256 indexed competitionId, uint256 prizePool, uint256 startTime, uint256 endTime);
    event PrizeDistributed(uint256 indexed competitionId, address indexed winner, uint256 prize);
    event ContributionReceived(uint256 indexed competitionId, address indexed participant, uint256 amount, bool isSubscriber);

    constructor(address _premiumPackageAddress) {
        premiumPackage = PremiumPackage(_premiumPackageAddress);
    }

    function createCompetition(uint256 startTime, uint256 endTime) external onlyOwner returns (uint256) {
        require(startTime < endTime, "Start time must be before end time");
        totalCompetitions += 1;
        competitions[totalCompetitions] = Competition({
            prizePool: 0,
            participants: new address[](0),
            completed: false,
            winner: address(0),
            startTime: startTime,
            endTime: endTime
        });
        emit CompetitionCreated(totalCompetitions, 0, startTime, endTime);
        return totalCompetitions;
    }

    // Allow participants to contribute to the prize pool
    function contributeToPrizePool(uint256 competitionId) external payable {
        Competition storage comp = competitions[competitionId];
        require(block.timestamp >= comp.startTime, "Competition has not started yet");
        require(block.timestamp <= comp.endTime, "Competition registration has closed");
        require(!comp.completed, "Competition already completed");

        bool isSubscriber = false;
        uint256 balance = premiumPackage.balanceOf(msg.sender);

        for (uint256 i = 0; i < balance; i++) {
            uint256 tokenId = premiumPackage.tokenOfOwnerByIndex(msg.sender, i);
            if (premiumPackage.isSubscriptionActive(tokenId)) {
                isSubscriber = true;
                break;
            }
        }

        uint256 contributionAmount = 0;
        if (!isSubscriber) {
            require(msg.value > 0, "Ether required to join if not a subscriber");
            comp.prizePool += msg.value;
            contributionAmount = msg.value;
        }

        comp.participants.push(msg.sender);

        emit ContributionReceived(competitionId, msg.sender, contributionAmount, isSubscriber);
    }

    // Complete the competition and distribute prizes to the winner
    // Voting should be done off-chain, and then call distributePrizes with the winner's address once voting is complete.
    function distributePrizes(uint256 competitionId, address winner) external onlyOwner {
        Competition storage comp = competitions[competitionId];
        require(block.timestamp > comp.endTime, "Competition is still ongoing");
        require(!comp.completed, "Competition already completed");
        require(comp.prizePool > 0, "No prize pool available");

        uint256 prize = comp.prizePool;
        comp.winner = winner;
        comp.completed = true;

        // Transfer the prize to the winner
        (bool success, ) = winner.call{value: prize}("");
        require(success, "Prize distribution failed");

        emit PrizeDistributed(competitionId, winner, prize);
    }

    // Get the prize pool for a competition
    function getPrizePool(uint256 competitionId) public view returns (uint256) {
        return competitions[competitionId].prizePool;
    }
}
