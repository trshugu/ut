pragma solidity >=0.4.22 <0.7.0;
contract SingleNumRegister {
  uint storedData;
  
  function set(uint x) public
  {
    storedData = x;
  }
  
  function get() public view returns (uint) {
    uint storedData_ = storedData + 1;
    return storedData_;
  }
}
