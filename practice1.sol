pragma solidity ^0.6.0;

contract Mycontract {
    string public mystring = "Hello, World";
    int public myInt = -1;
    uint public uInt = 1;
    uint256 public uInt256 = 1;
    uint8 public uInt8 = 1;
    address public myAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;

function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
}
}


//0x95c2dC3eFEC5Fb8fBB4FA2133a8E67d64b82D8a7