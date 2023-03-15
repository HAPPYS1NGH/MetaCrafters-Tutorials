// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract VariableChallenge{
    bool isCoder;
    uint favouriteNumber;
    address owner;
    string name;

    constructor(){
        owner = msg.sender;
    }

     function setCoder(bool _isCoder) public returns (bool){
        isCoder = _isCoder;
        return isCoder;
    }
     function getCoder() public view returns (bool) {
        return isCoder ;
    } 

    function setFavouriteNumber(uint _favouriteNumber) public returns (uint){
        favouriteNumber = _favouriteNumber;
        return favouriteNumber;
    }
    function getFavouriteNumber() public view returns(uint){
        return favouriteNumber;
    }

    function setOwner(address _owner) public returns (address){
        require(msg.sender == owner , "Next Owner can be set only by the Current Owner");
        owner = _owner;
        return owner;
    }
    function getOwner() public view returns (address){
        return owner;
    }

    function setName(string calldata _name) public returns (string memory){
        name = _name;
        return name;
    }

    function getName() public view returns(string memory){
        return name;
    }

}
