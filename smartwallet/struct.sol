//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract myContract {

// Define a struct
    struct Person {
       string name;
       uint age;
       bool married;
       string Job;
    }

 // Declare a variable of the struct type
    Person public MrBeast;
    Person public Revealer;

 // Initialize the struct variable
 constructor(){
     MrBeast = Person("Jimmy", 24, false, "Youtuber");
     Revealer = Person("Jimmy", 24, false, "Youtuber");
 }
 function addPerson(string memory _name, uint _age, bool _married, string memory _Job ) public{
     Revealer = Person(_name, _age, _married, _Job );
 }

 function updateAge (uint newAge) public {
     MrBeast.age = newAge;
 }

}