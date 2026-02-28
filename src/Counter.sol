// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/**
 * @title Counter
 * @dev A simple on-chain counter contract with increment and decrement functions
 */
contract Counter {
    uint256 private count;
    address public owner;
    event CountIncremented(uint256 newCount, address indexed by);
    event CountDecremented(uint256 newCount, address indexed by);
    event CountReset(address indexed by);
    constructor() {
        count = 0;
        owner = msg.sender;
    }
    /**
     * @dev Get the current counter value
     */
    function getCount() public view returns (uint256) {
        return count;
    }
    /**
     * @dev Increment the counter by 1
     */
    function increment() public {
        count += 1;
        emit CountIncremented(count, msg.sender);
    }
    /**
     * @dev Decrement the counter by 1 (reverts if count is 0)
     */
    function decrement() public {
        require(count > 0, "Counter: Cannot decrement below 0");
        count -= 1;
        emit CountDecremented(count, msg.sender);
    }
    /**
     * @dev Reset counter to 0 (only owner)
     */
    function reset() public onlyOwner {
        count = 0;
        emit CountReset(msg.sender);
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Counter: Only owner can call this");
        _;
    }
}