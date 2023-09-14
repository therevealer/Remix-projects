// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract smartWallet {
    address public owner;
    uint256 public balances;

// Wallet has one owner 
    constructor(){
        owner = msg.sender;
    }

//Be able to receive funds with a fallback function
    receive () external payable {
        require(msg.value > 0, "Insuffucient Amount");
        balances += msg.value;
    }

// Spend money on any address
    function transfer(address payable to, uint amount) public {
        to.transfer(amount);
    }

    function viewBalance() public view returns (uint){
        return address(this).balance;
    }

}


   