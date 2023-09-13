// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundWithdrawalExample {
    address payable public owner;
    uint256 public fundingGoal;
    uint256 public totalFunds;

    constructor(uint256 _goal) {
        owner = payable(msg.sender);
        fundingGoal = _goal;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Function for contributors to send Ether
    function contribute() external payable {
        require(msg.value > 0, "Contribution must be greater than 0");
        totalFunds += msg.value;
    }

    // Function for the owner to withdraw funds
    function withdrawFunds() external onlyOwner {
        // Check if the funding goal is met
        require(totalFunds >= fundingGoal, "Funding goal not met");
        
        // Attempt to transfer funds to the owner
        bool success = owner.send(totalFunds);
        if (success) {
            totalFunds = 0; // Reset total funds after successful transfer
        } else {
            // Handle the withdrawal error gracefully
            // Log the error or take appropriate action
            emit WithdrawalError("Transfer failed");
        }
    }

    // Function to check the current balance of the contract
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Event to log withdrawal errors
    event WithdrawalError(string error);
}
