contract Agreement {
	address public soren;
	address public raymond;

	function Agreement(address _raymond) {
		soren = msg.sender;
		raymond = _raymond;
	}

	function request() {
		if(msg.sender == soren) {
			soren.send(this.balance);
		}
	}
}
