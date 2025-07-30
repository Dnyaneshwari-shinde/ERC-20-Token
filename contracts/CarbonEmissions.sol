// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

error NotOwner();
error ZeroAddress();
error InsufficientBalance(uint256 available, uint256 required);
error InsufficientAllowance(uint256 available, uint256 required);

interface IBEP20 {

    function totalSupply() external view returns(uint256);
    function decimals() external view returns(uint256);
    function symbol() external view returns(string memory);
    function name() external view returns(string memory);
    function getOwner() external view returns(address);
    function balanceOf(address account) external view returns(uint256);
    function transfer(address recipient, uint256 amount) external returns(bool);
    function allowance(address _owner, address spender) external view returns(uint256);
    function approve(address spender, uint256 amount) external returns(bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns(bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Ownable {
    address public _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    modifier onlyOwner() {
        if (msg.sender != _owner) revert NotOwner();
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        if (newOwner == address(0)) revert ZeroAddress();
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

contract CarbonEmissions is IBEP20, Ownable {
 using SafeMath for uint256;
 
 mapping (address => uint256) private _balances;
 mapping (address => mapping (address => uint256)) private _allowances;

 uint256 private _totalSupply;
 uint8 private _decimals;
 string private _symbol;
 string private _name;

 constructor(){
   _name = "CarbonEmissions";
   _symbol = "CMS";
   _decimals = 18;
   _totalSupply = 1000000000 * 10 ** _decimals;
   _balances[msg.sender] = _totalSupply;
   emit Transfer(address(0), msg.sender, _totalSupply);
 }

 function getOwner() external view returns (address) {
   return _owner;
 }
 function decimals() external view returns (uint256) {
   return _decimals;
 }
 function symbol() external view returns (string memory) {
   return _symbol;
 }
 function name() external view returns (string memory) {
   return _name;
 }
 function totalSupply() external view returns (uint256) {
   return _totalSupply;
 }
 function balanceOf(address account) external view returns (uint256) {
   return _balances[account];
 }
 function transfer(address recipient, uint256 amount) public returns (bool) {
   _transfer(msg.sender, recipient, amount);
   return true;
 }
 function allowance(address owner, address spender) external view returns (uint256) {
   return _allowances[owner][spender];
 }
 function approve(address spender, uint256 amount) public returns (bool) {
   _approve(msg.sender, spender, amount);
   return true;
 }
 function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
   _transfer(sender, recipient, amount);
   _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
   return true;
 }
 function increaseAllowance(address spender, uint256 addedValue) public returns (bool success) {
   _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
   return true;
 }
 function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool success) {
   _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
   return true;
 }

function _transfer(address sender, address recipient, uint256 amount) internal {
    if (sender == address(0)) revert ZeroAddress();
    if (recipient == address(0)) revert ZeroAddress();
    if (_balances[sender] < amount) revert InsufficientBalance(_balances[sender], amount);

    _balances[sender] = _balances[sender].sub(amount);
    _balances[recipient] = _balances[recipient].add(amount);
    emit Transfer(sender, recipient, amount);
}


 function _mint(address account, uint256 amount) internal {
   if (account == address(0)) revert ZeroAddress();

   _totalSupply = _totalSupply.add(amount);
   _balances[account] = _balances[account].add(amount);
   emit Transfer(address(0), account, amount);
 }
 
 function _approve(address owner, address spender, uint256 amount) internal {
    if (owner == address(0) || spender == address(0)) revert ZeroAddress();

    _allowances[owner][spender] = amount;
    emit Approval(owner, spender, amount);
 }

}
