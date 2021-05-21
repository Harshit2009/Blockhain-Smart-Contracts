pragma solidity ^0.5.11;

contract yourToken{
    address public minter;
    mapping (address => uint) public balances;
    event Sent(address from, address to, uint amount);
    
    //function yourToken() public{
        constructor() public{
            minter = msg.sender;
    }
    function mint(address receiver, uint amount) public {
        if(msg.sender != minter) return;
        balances[receiver]+=amount;
    }
    function send(address receiver, uint amount) public {
        if(balances[msg.sender] < amount) return;
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

//minter address - 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//smart conttract address - 0xd9145CCE52D386f254917e481eB44e9943F39138
//injected web3 - 0x60B33719E6D40748213000Dc23d4a3fb0BFE0300
//2nd - 0x04BA2f05E6d6E40451091b41d6FcFE28EAF9B7b1
