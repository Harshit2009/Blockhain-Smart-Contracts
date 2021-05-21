pragma solidity ^0.4.20;
contract Election{
    
    struct candidate{
        string name;
        uint256 votecount;
    }
    
    struct voter{
        bool voted;
        uint256 voteIndex;
        uint256 weight;
    }
    
    address owner;
    mapping(address => voter) public voters;
    candidate[] public candidates;
    uint256 ElectionEnd;
    
    event ElectionResult(string _candidate, uint256 _votecount);
    
    function init(string memory _candidate1, string memory _candidate2, uint _durationMinutes) public
    {
        owner = msg.sender;
        candidates.push(candidate(_candidate1, 0));
        candidates.push(candidate(_candidate2, 0));
        ElectionEnd = now + (_durationMinutes * 1 minutes);
    }
    
    function authrize(address _voter) public{
        require(msg.sender == owner,"you not the Election Commission");
        require(!voters[_voter].voted,"you already voted");
        voters[_voter].weight = 1;
    }
    
    function vote(uint256 _voteIndex) public {
        require(now < ElectionEnd,"Times Up.");
        require(voters[msg.sender].weight == 1,"not authorised");
        require(!voters[msg.sender].voted,"Already Voted");
        voters[msg.sender].voted = true;
        voters[msg.sender].voteIndex = _voteIndex;
        candidates[_voteIndex].votecount += voters[msg.sender].weight;
    }
    
    function endElection() public{
        require(msg.sender == owner);
        require(now > ElectionEnd);
        
        for(uint256 i = 0; i < candidates.length; i++)
        {
            emit ElectionResult(candidates [i].name, candidates[i].votecount);
        }
    }
}