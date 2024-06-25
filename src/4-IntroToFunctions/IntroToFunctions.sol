// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

////////////////////////////
///// STATE VARIABLES //////
////////////////////////////

// State variables store data in the blockchain, so its more expensive to use them than local variables.
contract StateVariables {
    // The data assigned to the state variable will be stored in the blockchain.In this example would be the number 123.
    uint256 public i;
    bool public b;
    address public myAddress;

    ////////////////////////////
    ///// LOCAL VARIABLES //////
    ////////////////////////////

    function localVariables() external pure {
        // Is it wrong to put public in local variables? It is not possible to put public in local variables.
        uint256 localVariable = 456;
        // Local variables only exist while the function is being executed.
    }

    function foo() external {
        uint256 x = 123;
        bool f = false;
        //more code
        // After the code is executed x and f will be updated with the data below:
        x += 456;
        f = true;

        // Same as above, when the function is called all the variables will be updated to the data below:
        i = 123;
        b = true;
        myAddress = address(1);
        // After the variables are updated they will be stored in the state variables.
        // We are updating the data from the state variables inside a function. This will store the data.
        // i, b and myAddress are state variables being updated.
    }
}

////////////////////////////
///// GLOBAL VARIABLES /////
////////////////////////////

contract GlobalVariables {
    function globalVars() external view returns (address, uint256, uint256) {
        address sender = msg.sender;
        uint256 timestamp = block.timestamp;
        uint256 blocknum = block.number;
        return (sender, timestamp, blocknum);
    }
}

/////////////////////////
/////// CONSTANTS ///////
/////////////////////////

contract Constants {
    // Constants are variables that are assigned a value and cannot be changed.
    // This will be more cost efficient than not declaring it a constant.
    // Constants are stored in the contract code and not in the storage.
    address public constant MY_ADDRESS = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    uint256 public constant MY_UINT256 = 123;
}

contract Var {
    // This variable will be stored in the storage.
    // So this will be more gas expensive than using a constant.
    // Because the value will be stored in the blockchain.
    address public MY_ADDRESS = 0x976EA74026E726554dB657fA54763abd0C3a0aa9;
}
