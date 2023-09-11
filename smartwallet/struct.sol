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
    Person[] public people; // Array to store multiple persons

 // Initialize the struct variable
 constructor(){
     MrBeast = Person("Jimmy", 24, false, "Youtuber");
 }

// Function to add a new person
 function addPerson(string memory _name, uint _age, bool _married, string memory _Job ) public{
     Person memory newPerson  = Person(_name, _age, _married, _Job );
     people.push(newPerson);
 }

 function updateAge (uint newAge) public {
     MrBeast.age = newAge;
 }

 function totalPeople() public view returns (uint) {
     return people.length;
 }

}