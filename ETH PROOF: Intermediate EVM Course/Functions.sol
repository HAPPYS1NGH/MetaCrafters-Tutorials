
// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract Functions {
    uint donation;
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
    function deposit() public payable {}
}
