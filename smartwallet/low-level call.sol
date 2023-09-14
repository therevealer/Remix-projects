// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sender {
    receive() external payable {}

    function transfer(address payable to) public {
        to.transfer(10);
    }

    function send(address payable to) public {
      bool sent =  to.send(10);
      require(sent, "Sending Unsuccesfull");
    }
}


contract balanceViewer {
    receive() external payable {}

    function balance() public view returns(uint){
        return address(this).balance;
    }

}

contract receiver {
    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value;
    }

    function balance() public view returns(uint){
        return address(this).balance;
    }

}