//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

error InsufficientBalance(uint balance, uint withdrawAmount);

contract Errors {
    
    uint public num;
    receive () external payable{

    }

    function testRequire(uint _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    function testAssert() public view {
        assert(num == 0);
    }
    function setNum(uint _num) public {
        num =_num;
    }

    // custom error
    
    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}
