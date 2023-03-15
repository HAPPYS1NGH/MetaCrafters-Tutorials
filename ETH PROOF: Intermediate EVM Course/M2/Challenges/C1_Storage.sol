//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Storage {
    string name;
    uint favouriteNumber;
    mapping(string => uint) PersonalfavouriteNumber;

    event InitialaisedFavoriteNumber(
        string indexed Personname,
        uint PersonFavouriteNumber
    );

    function setName(string memory _name) public{
        name = _name;
    }
    function setFavouriteNumber(uint _num) public {
        favouriteNumber = _num;
    }
    function currentValues() public view returns(string memory , uint ){
        return (name , favouriteNumber) ;
    }

    function setMapping() public { 
        PersonalfavouriteNumber[name] = favouriteNumber;
        emit InitialaisedFavoriteNumber(name ,favouriteNumber);
    }

    function getMapping(string calldata _name) public view returns(uint){
        return PersonalfavouriteNumber[_name] ;
    }
    
}
