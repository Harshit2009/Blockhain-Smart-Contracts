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
    function book() public payable{
        require(status == Availability.Vacant, "Currently Occupied");
        require(msg.value >=2 ether, "Not enough Ether provided.");
        status = Availability.Occupied;
        owner.transfer(msg.value);
        emit occupy(msg.sender, msg.value);
    }
}
//0xa131AD247055FD2e2aA8b156A11bdEc81b9eAD95