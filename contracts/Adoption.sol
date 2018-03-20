pragma solidity ^0.4.17;

contract Adoption {

  address public _ower;
  address[16] public adopters;
  address receiver = 0x4946C77382D1740D32324470EDD9678cf56Dd9cb;


  event Donation(address from, uint _petid);

  function Adoption() {
    _ower = msg.sender;
  }

    // Adopting a pet
  function adopt(uint petId) public payable returns (uint) {
    require(petId >= 0 && petId <= 15);
    adopters[petId] = msg.sender;
    receiver.transfer(msg.value);
    Donation(msg.sender,petId);
    return petId;
  }

    // Retrieving the adopters
  function getAdopters() public view returns (address[16]) {
    return adopters;
  }

}
