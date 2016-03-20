contract Company {
	address public ceo;

	mapping (address => Employee) public employees;
	struct Employee
	{
		uint salary;
		bytes32 name;
	}

	function Company()
	{
		ceo = msg.sender;
	}

	function withdraw(uint amount)
	{
		if(amount > this.balance) throw;
		if(msg.sender == ceo) ceo.send(amount);
	}

	function hire(address onboardingAddress, uint salary) {
	}
}
