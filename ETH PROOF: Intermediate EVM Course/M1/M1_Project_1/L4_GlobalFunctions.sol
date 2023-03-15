// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract GlobalFunctions {
    uint public donation;
    address payable  owner;

    constructor() payable {
        owner = payable(msg.sender);
    }
    function seeOwner() public view returns(address) {
        return owner;
    }
    function addition(uint _num1 , uint _num2) public pure returns (uint) {
        return _num1 + _num2 ;
    }
    function deposit() public payable {
        donation = donation+ msg.value;
    }
    function withdraw() payable public returns(bool){
        require(msg.sender == owner, "Onwer can withdraw");
        bool transaction = owner.send(address(this).balance);
        return transaction;
    }
}
