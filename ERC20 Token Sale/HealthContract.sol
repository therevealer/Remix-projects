//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "./ERCFaucet.sol";

contract HealthFaucet {
    address public owner; // Address of the contract owner
    HealthTokenFaucet public HealthToken; // Your ERC20 Health Token contract
    
     // Mapping to store the last submission time for each user
    mapping(address => uint256) public lastSubmissionTime;

    uint256 public TokenPerDay = 10;

     constructor(address _tokenAddress) {
        owner = msg.sender;
        HealthToken = HealthTokenFaucet(_tokenAddress);
    }

      // Modifier to restrict access to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this operation");
        _;
    }
    
    // Function to submit proof and receive health tokens
    function submitProofAndReceiveRewards(bytes32 proofHash) external {
        require(HealthToken.balanceOf(address(this)) >= 10, "Insufficient Balance");
    }

    // Event to log token transfers
    event RewardsReceived(address indexed to, uint256 amount);
}












// contract TokenFunctionalities{

// function name() public view returns (string memory) {
// }


// // function symbol() public view returns (string)
// // function decimals() public view returns (uint8)
// // function totalSupply() public view returns (uint256)
// // function balanceOf(address _owner) public view returns (uint256 balance)
// // function transfer(address _to, uint256 _value) public returns (bool success)
// // function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
// // function approve(address _spender, uint256 _value) public returns (bool success)
// // function allowance(address _owner, address _spender) public view returns (uint256 remaining)

// // event Transfer(address indexed _from, address indexed _to, uint256 _value)
// // event Approval(address indexed _owner, address indexed _spender, uint256 _value)


// }