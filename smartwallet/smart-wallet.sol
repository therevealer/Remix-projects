// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract smartWallet {
    address public owner;
    uint256 public balances;

    constructor(){
        owner = msg.sender;
    }

    receive () external payable {
        require(msg.value > 0, "Insuffucient Amount");
        balances += msg.value;
    }


    function transfer(address payable to, uint amount) public {
        to.transfer(amount);
    }

    function viewBalance() public view returns (uint){
        return address(this).balance;
    }

}


   