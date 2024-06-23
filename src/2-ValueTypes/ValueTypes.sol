// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

// Data types
// 1. Values: Data stores a value: Example: boolean: true or false. Stores a value: 1 or 0
// 2. References: This is not stored a value, it references a value stored in another location

contract ValueTypes {
    bool public b = true;
    uint256 public u = 123;
    // uint = uint256 (range)0 to 2**256 - 1
    // uint8 = uint8 (range) 0 to 2**8 - 1
    // uint16 = uint16 (range) 0 to 2**16 - 1
    int256 public i = -123;
    // int = int256 (range) -2**255 to 2**255 - 1
    // int128 (range) -2**127 to 2**127 - 1

    /**
     * @notice This is how we return the min or max
     */
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    // address
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 public b32 =
        0x1234567890123456789012345678901234567890123456789012345678901234;
}
