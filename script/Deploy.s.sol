// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { Counter } from "../Counter.sol";

contract Deploy {
    function deploy() public returns (address) {
        Counter counter = new Counter();
        return address(counter);
    }
}