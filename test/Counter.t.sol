// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    address public user = address(0x123);

    function setUp() public {
        counter = new Counter();
    }

    function test_InitialCountIsZero() public view {
        assertEq(counter.getCount(), 0);
    }

    function test_IncrementWorks() public {
        counter.increment();
        assertEq(counter.getCount(), 1);
    }

    function test_IncrementMultipleTimes() public {
        for (uint i = 0; i < 5; i++) {
            counter.increment();
        }
        assertEq(counter.getCount(), 5);
    }

    function test_DecrementWorks() public {
        counter.increment();
        counter.increment();
        counter.decrement();
        assertEq(counter.getCount(), 1);
    }

    function test_DecrementFailsAtZero() public {
        vm.expectRevert("Counter: Cannot decrement below 0");
        counter.decrement();
    }

    function test_OnlyOwnerCanReset() public {
        counter.increment();
        counter.reset();
        assertEq(counter.getCount(), 0);
        vm.prank(user);
        vm.expectRevert("Counter: Only owner can call this");
        counter.reset();
    }

    function test_EventEmission() public {
        vm.expectEmit(true, false, false, true);
        emit CountIncremented(1, address(this));
        counter.increment();
    }
}