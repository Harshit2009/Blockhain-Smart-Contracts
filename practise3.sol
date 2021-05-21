pragma solidity >=0.4.0 <0.6.0;
contract SimpleStorage {
    unit storedData;
    function set(unit x) public {
        storedData = x;
    }
    function get() public view returns (unit) {
        return storedData;
    }
}