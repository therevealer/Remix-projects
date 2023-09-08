//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract StorageContract {
 int256 public variable;

constructor(){
    variable = 0;
}

function increment() public {
    variable++;
}

function decrement() public {
    variable--;
}

}