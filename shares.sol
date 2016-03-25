contract Shares {
	mapping (address => uint) shareOfTotal;
	mapping (address => uint) exchangeCount;
	uint public splitCount;
	uint public total;

	address public owner;

	function Shares(uint _initialShares) {
		total = _initialShares;
		owner = msg.sender;
		shareOfTotal[owner] = total;
	}

	function split() {
		if(msg.sender != owner) throw;
		total *= 2;
		splitCount += 1;
	}

	function exchange() {
		while(exchangeCount[msg.sender] < splitCount) {
			shareOfTotal[msg.sender] *= 2;
			exchangeCount[msg.sender] += 1;
		}
	}

	function yourShares() returns (uint shares) {
		return shareOfTotal[msg.sender];
	}

	function transferShares(address _to, uint amount) {
		if(shareOfTotal[msg.sender] < amount) throw;
		shareOfTotal[_to] += amount;
		shareOfTotal[msg.sender] -= amount;
	}
}
