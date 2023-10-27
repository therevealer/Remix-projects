// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Store a string on the blockchain that is readable for everyone 
//and can only be writeable by the one who deployed the smart contract.

import "@openzeppelin/contracts/access/Ownable.sol";

contract blockchainMessenger is Ownable{

    string public testString = "First Very own Logic";

    function setTestString (string memory newString ) public{
        require(msg.sender == owner(), "Access Denied");
        testString = newString;
    }

    function getString() public view returns(string memory){
        return testString;
    }
}