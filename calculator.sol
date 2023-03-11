// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract calculator {
   uint num1 ;
   uint num2 ;
   function setNum(uint _num1 , uint _num2) public{
       num1 =_num1;
       num2 =_num2;
   }
   function getNum() public view returns (uint , uint){
       return (num1 , num2) ;

   }

    function addition() public  view returns (uint) {
        return num1 + num2 ;
    }
    function substraction() public view returns (uint){
        return num1 - num2;
    }
    function multiplication() public  view returns (uint) {
        return num1 * num2 ;
    }
    function division() public  view returns (uint) {
        return num1 / num2 ;
    }
}
