//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleMapping{
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    function setValue(uint _index) public{
        myMapping[_index] = true;
    }

     function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}