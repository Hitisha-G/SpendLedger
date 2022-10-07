pragma solidity ^0.8.0;


contract SpentLedger
{
    uint public collected;
    uint public remaining ; 
    address public owner;
    string name;

constructor(uint _collected){
     collected=remaining=_collected;
     owner = msg.sender;
}

mapping (string  => uint) public spent;


// function Spent(string memory _name,uint _amount) public 
//     {
//         name=_name;
//         objective storage newRequest= spendings[numSpends];
//         remaining-=_amount;
//         numSpends++;
//         spent[_name]=_amount;
//         newRequest.description=_name;
//         newRequest.value=_amount;
//         if(_amount<remaining)
//             newRequest.HaveCollected=true;
//         spent[_name]+=_amount;
//     }


struct objective
    {
        string description;
        uint value;
        bool HaveCollected;
        //uint amount;
    }
    
    mapping(uint=>objective)public spendings;
    uint public numSpends;

    modifier OnlyOwner{
        require(msg.sender==owner);
        _;
    }

 function Spent(string memory _description,uint _value) public OnlyOwner
    {
        objective storage newRequest= spendings[numSpends];
        numSpends++;
        remaining-=_value;
        spent[_description]+=_value;
        newRequest.description=_description;
        newRequest.value=_value;
        if(_value<collected)
            newRequest.HaveCollected=true;
    }


}
