pragma solidity ^0.4.0;

contract Casino{

    address Deployer;
    mapping(address=>uint) balance;

    function Casino(){
        Deployer = msg.sender;

    }

    function sendCash(uint amount, address receiver){
        if (msg.sender==Deployer){
            balance[receiver]+=amount;
        }else{
            revert();
        }
    }
    function viewBalance() returns (uint){
        return balance[msg.sender];

    }

}
