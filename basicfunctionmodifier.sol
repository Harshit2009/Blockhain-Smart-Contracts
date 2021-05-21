pragma solidity ^0.4.18;
contract Coursetro{
    
    string fName;
    uint age;
    address owner;
    
    function Coursetro() public {
        owner=msg.sender;
    }
    
    modifier onlyowner {
        require(msg.sender==owner);
        _;
    }
    
    function setInstructor(string _fName, uint _age) onlyowner public {
        fName = _fName;
        age = _age;
    }
    
    function getInstructor() view public returns (string, uint) {
        return (fName, age);
    }
    
}
//0xd9145CCE52D386f254917e481eB44e9943F39138