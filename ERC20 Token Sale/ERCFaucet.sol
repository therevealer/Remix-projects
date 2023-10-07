// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract HealthTokenFaucet {
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _from, address indexed _spender, uint _value);
    
    string public name;
    string public symbol;
    
    uint public immutable decimals;
    uint public immutable totalSupply;

    mapping(address => uint) _balances;
    mapping(address => mapping(address => uint)) _allowances;

    constructor(string memory _name, string memory _symbol, uint _decimals, uint _totalSupply) {
      name = _name;
      symbol = _symbol;
      decimals = _decimals;
      totalSupply = _totalSupply;
      _balances[msg.sender] = _totalSupply;
    }

    function balanceOf(address _owner) public view returns(uint){
      require(_owner != address(0), "cannot be an address zero");

      return _balances[_owner];
    }

    function transfer(address _to, uint _value) public returns(bool){
      require(_balances[msg.sender] >= _value && _balances[msg.sender] != 0, "must have value, and not be zero");

      _balances[msg.sender] -= _value;
      _balances[_to] += _value;

      emit Transfer(msg.sender, _to, _value);
      return true;
    }

    function allowance(address _owner, address _spender) public view returns(uint){
      return _allowances[_spender][_owner];
    }

    function approve (address _spender, uint _value) public returns(bool){
     require(_balances[msg.sender] >= _value, "bal must be greater than the value");
     _allowances[_spender][msg.sender] = _value;  
     emit Approval(msg.sender, _spender, _value);
     return true;
    }

    function transferFrom(uint _value, address _from, address _to) public returns(bool) {
        _balances[_from] -= _value;
        _balances[_to]  += _value;
        _allowances[msg.sender][_from] = _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
  }

//John Fawole*
