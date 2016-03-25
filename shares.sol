contract Shares {
	mapping (address => uint) shareOfTotal;
	mapping (address => uint) exchangeCount;
	uint public splitCount;
	uint public total;

	address public owner;
	
	struct Sale {
		uint amount;
		uint price;
		bool completed;
	}
	mapping (address => Sale) sales;

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
	
	function sell(uint _amount, uint _price) {
		if(_amount > shareOfTotal[msg.sender]) throw;
		sales[msg.sender] = Sale({
			price: _price,
			amount: _amount,
			completed: true
		})
	}
	
	function buy(address _seller) {
		if(msg.value != sales[_seller].price) throw;
		if(sales[_seller].completed) throw;
		uint amount = sales[_seller].amount;
		_seller.send(msg.value);
		shareOfTotal[msg.sender] += amount;
		shareOfTotal[_seller] -= amount;
	}
}
