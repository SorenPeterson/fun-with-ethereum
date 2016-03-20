contract Company {
	address public ceo;

	mapping (address => Employee)
	struct Employee
	{
		uint dailySalary;
	}

	function Company()
	{
		ceo = msg.sender;
	}

	function withdraw(uint amount)
	{
		if(amount / 1000 > this.balance) throw;
		if(msg.sender == ceo) ceo.send(amount / 1000);
	}
}
