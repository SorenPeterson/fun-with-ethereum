contract LinkedLists {
  struct Link {
    bytes data;
    uint next;
  }

  mapping (uint => Link) public list;
  Link public root;
  Link public last;
  uint public count;

  function Link() {
    count = 0;
  }

  function () {
    throw;
  }

  function append(bytes data) {
    if(!root) {
      root = Link(data)
      last = root
      list[0] = root
    } else {
    }
  }
}
