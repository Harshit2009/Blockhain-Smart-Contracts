pragma solidity ^0.6.0;

contract SimpleStorage {
    uint storedData;
    function set(uint x) public {
        storedData = x;
    }

function getValue() public view returns(uint) {
        return storedData;
}
}
