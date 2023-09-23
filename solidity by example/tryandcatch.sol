//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract tester {
    address public owner;

    constructor(address _owner){
        require(_owner != address(0), "invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunction (uint x) public pure returns (string memory){
        require(x != 0, "require failed");
        return "myFunction was called";
    }
}


contract executor {
    event logMessage(string message);
    event logBytes(bytes data);

    tester public execute;

    constructor(){
        execute = new tester(msg.sender);
    }


    function tryandCatchCall(uint _input) public {
        try execute.myFunction(_input) returns (string memory){
            emit logMessage("call successful");
        } catch {
            emit logMessage("External call Failed");
        }
    }


}

