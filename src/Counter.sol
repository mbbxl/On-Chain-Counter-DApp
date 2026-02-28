// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 private count;

    event CountIncreased(uint256 newCount);
    event CountDecreased(uint256 newCount);
    event CountReset();

    constructor() {
        count = 0;
    }

    function increment() public {
        count++;
        emit CountIncreased(count);
    }

    function decrement() public {
        require(count > 0, "Count is already zero");
        count--;
        emit CountDecreased(count);
    }

    function reset() public {
        count = 0;
        emit CountReset();
    }

    function getCount() public view returns (uint256) {
        return count;
    }
}