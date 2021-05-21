pragma solidity ^0.5.11;
contract Bookhotel{
    enum Availability {Vacant, Occupied}
    Availability status;
    event occupy(address _occupant, uint _value);
   
    address payable public owner;
    
    constructor() public {
        owner = msg.sender;
        status = Availability.Vacant;
    }
    
    modifier availability {
        require(status == Availability.Vacant, "Currently Occupied");
        _;
    }
    
    modifier balance {
        require(msg.value >=2 ether, "Not enough Ether provided.");
        _;
    }
    
    function book() availability balance public payable{
        status = Availability.Occupied;
        owner.transfer(msg.value);
        emit occupy(msg.sender, msg.value);
    }
    
}
//require(msg.value >=2 ether, "Not enough Ether provided.");
//0x9ecEA68DE55F316B702f27eE389D10C2EE0dde84