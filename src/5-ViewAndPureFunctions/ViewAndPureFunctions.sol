// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract ViewAndPureFunctions {
    // view function: Can read the state variables but cannot write to them.
    // pure function: Cannot read or write to the state variables.
    uint256 public num;

    // This is a view function because it is reading the state variable num.
    function viewFunc() external view returns (uint256) {
        return num;
        // It reads from the state variable num.
        // it reads some kind of data from the blockchain
    }

    function pureFunc() external pure returns (uint256) {
        return 1;
        // It does not read or write to the state variable num.
        // it does not read or write any data from the blockchain
    }

    function addToNum(uint256 x) external view returns (uint256) {
        return num + x;
    }

    //Heres function add is not calling any state variable so it is pure function
    function add(uint256 x, uint256 y) external pure returns (uint256) {
        return x + y;
    }
}
