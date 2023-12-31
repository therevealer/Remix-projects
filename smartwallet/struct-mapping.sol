//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract dataStructure{

struct Person {
    string name;
    uint age;
}

mapping(address => Person) public people;


// Function to add a new person to the mapping
function addPerson (address _address, string memory _name, uint _age) public {
    // Create a new Person struct
    Person memory newPerson = Person(_name, _age);

    // Store the newPerson struct in the mapping with the sender's address as the key
    people[_address] = newPerson;
}

// Function to retrieve a person's information by address
function getPerson(address _address) public view returns(string memory, uint){
    
    // Retrieve the Person struct associated with the given address
    Person memory person = people[_address];
    return(person.name, person.age);
}

}