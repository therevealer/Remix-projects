// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract MyToken {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(
        address indexed _from,
        address indexed _spender,
        uint256 _value
    );

    string public name;
    string public symbol;

    uint256 public immutable decimals;
    uint256 public immutable totalSupply;

    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _allowances;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _decimals,
        uint256 _totalSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        _balances[msg.sender] = _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        require(_owner != address(0), "cannot be an address zero");

        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(
            _balances[msg.sender] >= _value && _balances[msg.sender] != 0,
            "must have value, and not be zero"
        );

        _balances[msg.sender] -= _value;
        _balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256)
    {
        return _allowances[_spender][_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(
            _balances[msg.sender] >= _value,
            "bal must be greater than the value"
        );
        _allowances[_spender][msg.sender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(
        uint256 _value,
        address _from,
        address _to
    ) public returns (bool) {
        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowances[msg.sender][_from] = _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}

//John Fawole*
