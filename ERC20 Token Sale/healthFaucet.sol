//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract HealthToken is ERC20 {


    constructor() ERC20("HealthToken", "HEAT") {
        _mint(msg.sender, 1000 * 10 ** decimals());
        owner = msg.sender;
    }

    // Modifier to restrict access to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this operation");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function balance(address _owner) public view returns (uint){
    require(_owner != address(0), "cannot be an address zero");
    return _balances[_owner];
    }

    // Function to submit proof and receive health tokens
    function submitProofAndReceiveRewards(bytes32 proofHash) external {
        require(balanceOf(address(this)) >= 10, "Insufficient Balance");
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