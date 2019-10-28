pragma solidity ^0.5.9;

contract Hell
{
  int num;
  
  function set_num(int n) public
  {
    num = n;
  }
  
  function get_num() public returns(int)
  {
    return num;
  }
}
