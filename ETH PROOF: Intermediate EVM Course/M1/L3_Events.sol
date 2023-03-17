//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17; 

contract Events{

    address payable public  owner;
    // mapping (address donated => uint value) public Donated;
    // mapping (address donation => uint value) public Donation;

    constructor() payable{
        owner = payable(msg.sender);
    }
    modifier isOwner{
        require(msg.sender == owner , "Owner only");
        _;
    }

    event TransactionSent(
        address indexed sender ,
        address indexed recipient ,
        uint amount
    );
    event Donated(
        address indexed sender,
        uint amount
    );

    event Donation (
        address indexed _recipient ,
        uint value
    );

    function sendMoney(address payable _recipient) payable public  returns(bool) {
        bool transaction = _recipient.send(msg.value);
        // Donated[msg.sender] = msg.value;
        // Donation[_recipient] = msg.value;
        emit Donation(_recipient , msg.value);
        emit Donated( msg.sender , msg.value);

        emit TransactionSent(msg.sender , _recipient , msg.value);
        return transaction;
    }



}

       