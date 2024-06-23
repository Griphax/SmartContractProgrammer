// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Functions {
    function add(
        uint256 x,
        uint256 y /* Two Parameters */
    ) external pure returns (uint256) {
        return x + y;
    }

    function sub(
        uint256 x,
        uint256 y /* Two Parameters */
    ) external pure returns (uint256) {
        return x - y;
    }
}
