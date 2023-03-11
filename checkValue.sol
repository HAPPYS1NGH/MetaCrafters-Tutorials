// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract units{
    uint valueInWei;
    uint valueInGwei;
    uint valueInEther;

    constructor() payable{

    }

    function valueConverter() public payable {
        valueInWei = msg.value;
        valueInGwei = valueInWei / (10 ** 9);
        valueInEther = valueInWei / (10 ** 18);
    }
    function getWei() public view returns (uint){
        return valueInWei;
    }
    function getGwei() public view returns (uint){
        return valueInGwei;
    }
    function getEther() public view returns (uint){
        return valueInEther;
    }
    
}
