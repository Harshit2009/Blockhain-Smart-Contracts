pragma solidity ^0.4.20;
contract Blockspit {
    
    address[] public players;
    mapping (address => bool) public uniquePlayers;
    address[] public winners;
    address public charity = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;
    
    function play(address _participant) payable public {
        require (winners.length <2);
        require (msg.value >= 0.001 ether && msg.value <=1 ether);
        require (uniquePlayers[_participant] == false);
        
        players.push(_participant);
        uniquePlayers[_participant] = true;
    }
    
    function draw() external {
        require (now > 1618202412);
        require (winners.length < 2);
        
        uint256 winningIndex = randomGen();
        address winner = players[winningIndex];
        winners.push(winner);
        
        players[winningIndex] = players[players.length - 1];
        players.length--;
        
        if (winners.length == 2) {
            charity.transfer(address(this).balance);
        }
    }
    
    function randomGen() constant internal returns (uint256 randomNumber){
        uint256 seed = uint256(block.blockhash(block.number - 200));
        return(uint256(keccak256(block.blockhash(block.number-1), seed )) % players.length);
    }
}