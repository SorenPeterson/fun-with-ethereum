contract Shares {
    mapping (address => uint) public shareOfTotal;
    int public total;
    
    int public splitCount;
    mapping (address => SplitVote) public splitVotes;
    struct SplitVote {
        uint count;
    }
    
    function Shares(uint, _initialShares) {
        numberOfShares[msg.sender] = _initialShares
        total 
    }
}
