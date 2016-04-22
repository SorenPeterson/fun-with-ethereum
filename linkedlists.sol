contract LinkedLists {
  struct Link {
    uint next;
    bytes data;
  }

  mapping (uint => Link) public list;
  Link public root;

  function () {
  }

  function append() {
    if(!root) {
      root
    }
  }
}
