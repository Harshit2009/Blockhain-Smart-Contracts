pragma solidity ^0.5.11;
contract mintingTokenn{
address public minter;
mapping (address => uint) public balances;
event Sent(address from, address to, uint amount);

constructor() public{
minter=msg.sender;
}
function mint(address receiver, uint amount) public {
if(msg.sender != minter) return;
balances[receiver]+=amount;
}
function withdrawl(uint amount) public {
if(balances[msg.sender]<amount) return;
balances[msg.sender]-=amount;
}
function send(address receiver, uint amount) public {
if(balances[msg.sender]<amount) return;
balances[msg.sender]-=amount;
balances[receiver]+=amount;
emit Sent(msg.sender, receiver, amount);
}
}
//0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B

