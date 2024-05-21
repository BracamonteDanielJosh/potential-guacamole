// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract SmartContract{

  //public variable here
  string public Name = "Xarb";
  string public Abbrv = "Daniel";
  uint public TotalMoney = 0;

  //mapping variables here
  mapping (address => uint) public balances;

  //mint function
  function mint (address _address, uint _value) public{
    TotalMoney += _value;
    balances[_address] += _value;

  }
  function burn (address _address, uint _value) public{
    if (balances[_address] >= _value){
    TotalMoney -= _value;
    balances[_address] -= _value;
}
  }
}       
