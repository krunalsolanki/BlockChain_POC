pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

contract Voter
{
    struct OptionPos{
        uint pos;
        bool exists;
    }
    
    uint[] public votes;
    string[] public options;
    mapping(address=>bool) hasVoted;
    mapping(string => OptionPos) posOfOptions;
    
    constructor (string[] _options ) public {
        options=_options;
        votes.length = options.length;
        
        for(uint i=0;i<options.length;i++){
            OptionPos memory optionPos = OptionPos(i,true);
            string optionName = options[i];
            posOfOptions[optionName] = optionPos;
        }
    }
    
    function vote(uint option) public {
        require(0 <= option && option < options.length, "Please select valid option");
        require(!hasVoted[msg.sender],"Account has already Voted");
        votes[option]=votes[option]+1;
        hasVoted[msg.sender]= true;
    }
    
    function vote (string optionName) public {
        require(!hasVoted[msg.sender],"Account has already Voted");
        OptionPos memory optionPos = posOfOptions[optionName];
        require(optionPos.exists,"Option does not exists");
          votes[optionPos.pos]=votes[optionPos.pos]+1;
        hasVoted[msg.sender]= true;
    }
    
    function getOptions() public view  returns(string[]){
        return options;
    }
    function getVotes() public view returns (uint[]) {
        return votes;
    }

}