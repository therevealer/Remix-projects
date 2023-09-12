//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tryandCatch {
    address payable  public owner;
    uint public fundingGoal;
    uint public totalFunds;

    constructor(uint _goal){
        owner = payable (msg.sender);
        fundingGoal = _goal;
    }

    modifier onlyOwner () {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    

    function contribute() external payable {
        require(msg.value > 0, "Contribution must be greater than 0");
        totalFunds += msg.value;
    }

    function withdrawFunds() external onlyOwner{
        require(totalFunds >= fundingGoal, "Funding goal not met");
        
      try  owner.transfer(totalFunds){
          totalFunds = 0;

      } catch(bytes memory errorData){

          emit WithdrawalError(errorData);
      }
    }
    // Event to log withdrawal errors
    event WithdrawalError(bytes errorData);
}