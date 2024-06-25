// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Counter {
    uint256 public count;

    // Here we are initializing the count to 0, if the value is not provided.

    function countInc() external {
        count++;
    }

    function counterDec() external {
        count--;
    }
}
