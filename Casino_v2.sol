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
    
    function viewBalance() returns  (uint){
        return balance[msg.sender];
    }
    
    function bet(uint amount) returns (string){
        if(balance[msg.sender] < amount){
            return "No funds";
        }
        else{
            uint result = generateNr(666,msg.sender);
            if(result == 1){
                balance[msg.sender]+=amount;
                return "Victory";
            }
            else{
                balance[msg.sender] -= amount;
                return "Lose";
            }
        }
    }
    
    function generateNr(uint rnr,address user) returns (uint){
        uint ret = uint(sha3(user,rnr));
        if(ret>50){
            return 1;
        }
        else{
            return 0;
        }
    }

}
