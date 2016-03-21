contract Lending {
	mapping (address => uint32) public balance;
	mapping (address => uint32) public reputation;

	function () {
		increaseReputation();
		balance[msg.sender] += msg.value;
		reputation[msg.sender] += msg.value;
	}

	function withdraw(uint32 amount) {
		if(reputation[msg.sender] < amount) {
			throw;
		}
		msg.sender.send(amount);
		reputation[msg.sender] -= amount;
		balance[msg.sender] -= amount;
	}
}
