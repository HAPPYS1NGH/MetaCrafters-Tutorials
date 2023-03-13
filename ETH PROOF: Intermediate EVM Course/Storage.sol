//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Storage{
    address owner;
    uint num;
    constructor(){
        owner = msg.sender;
    }
    modifier isOwner{
        require(msg.sender == owner , "Owner only");
        _;
    }
    function set(uint _num) public isOwner {
        num =_num;
    }
    function get() public view isOwner returns(uint) {
        return num;
    }
}
