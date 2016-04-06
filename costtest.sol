contract CostTest {
  mapping (uint => bytes) public storage;
  uint public counter;

  function () {
    counter = 0;
  }

  function insert (uint size) {
    /*for (uint i = counter; i < size + counter; i++) {
      storage[counter] = "abcdefghijklmnopqrstuvwxyz";
    }
    counter = i;*/

    /*for (uint i = counter; counter < size + i; counter++) {
      storage[counter] = "abcdefghijklmnopqrstuvwxyz";
    }*/

    while (size--) {
      storage[counter++] = "abcdefghijklmnopqrstuvwxyz";
    }
  }
}
