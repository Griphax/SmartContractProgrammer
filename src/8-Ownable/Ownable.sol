// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "not owner");
        _;
        //  This is a special character used in function modifiers to execute the rest of the code.
        // If we put the _; at the beginning of the modifier, the rest of the code will not be executed.
    }

    function setOwner(address newOwner) external onlyOwner {
        require(newOwner != address(0), "sdasd");
        owner = newOwner;
    }
}

// Create an external function setOwner(address newOwner) which will set ownertonewOwner.

// This function can only be called by the current owner.

// Check that newOwner is not address(0) and throw an error "new owner = zero address" if it is.

///////////////////////////////////
//////// FUNCTION OUTPUTS /////////
///////////////////////////////////

// Can return multiiple outputs
// Names outputs
// Destructuring Assignment

contract FunctionOutputs {
    // Functions can return multiple outputs.
    // NO INPUTS IN THE FUNCION returnMany("INPUTS ARE DECLARED HERE")
    // INPUTS IN FUNCTION, OUTPUTS RETURNS
    function returnMany() public pure returns (uint256, bool) {
        return (1, true);
    }

    // Outputs can be named.
    function named() public pure returns (uint256 x, bool b) {
        return (1, true);
    }

    // Outputs can be assigned to their name.
    // In this case the return statement can be omitted.
    // THIS METHOD WILL MAKE YOU SAVE SOME GAS.
    function assigned() public pure returns (uint256 x, bool b) {
        x = 1;
        b = true;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple outputs.
    function destructuringAssigments() public pure {
        (uint256 i, bool b) = returnMany();
        // Outputs can be left out.
        // HERE WE ARE ONLY PICKING THE SECOND OUTPUT TYPE AND NAME.
        // WE NEED TO KEEP THE COMMA FOR IT TO WORK
        (, bool _b) = returnMany();
    }

    // HERE WE ASSIGN 2 OUTPUTS (address, bool) and we return a value for each type.
    function myFunc() external view returns (address, bool) {
        return (msg.sender, false);
    }
}

/////////////////////////////
////////// ARRAYS ///////////
/////////////////////////////

// Arrat - dynamic or fixed size
// Initialization
// Insert, get, update, delete, pop, length
// Creating array in memory
// Returning Array from function

contract Array {
    // DYNAMIC ARRAY
    // THIS WILL INITIATE THE DYNAMIC ARRAY WITH 3 VALUES:
    // 1, 2, 3
    uint256[] public nums = [1, 2, 3];
    // THIS IS AN STATIC ARRAY
    // THIS IS LIMITED TO 3 VALUES
    uint256[3] public numesFixed = [4, 5, 6];
    // IF THE NUMBER OF VALUES IS DIFFERENT TO THE ARRAY SIZE, IT WILL THROW AN ERROR

    function examples() external {
        // PUSH
        // THIS WILL ADD A NEW VALUE AT THE END OF THE ARRAY
        // WE CAN NOT PUSH TO A FIXED ARRAY, IT WILL THROW AN ERROR
        nums.push(4);
        uint256 x = nums[1];
        // THIS WILL ADD 777 TO THE ARRAY AT INDEX 2
        nums[2] = 777; // [1, 2, 777, 4]
        // THIS WILL DELETE THE VALUE AT INDEX 1
        delete nums[1]; // [1, 0, 777, 4]
        // POP WILL REMOVE THE LAST ELEMENT OF THE ARRAY
        nums.pop();
        // [1, 0, 777];
        // TO KNOW THE LENGTH OF THE ARRAY WE USE .length
        uint256 len = nums.length;

        // CREATING AN ARRAY IN MEMORY
        // HERE WE ARE CREATING A NEW ARRAY AND WE ARE STORING IT IN MEMORY
        // WE DECLARE THE ARRAY UINT256[](5) OF THE TYPE UINT256 TO STORE IT IN MEMORY
        uint256[] memory a = new uint256[](5);
        // THE ARRAY IN MEMORY HAVES TO BE FIXED, CANT BE DYNAMIC
        // WE CANT USE .POP OR .PUSH WHEN WE CREATE AN ARRAY IN MEMORY, IT WILL THROW AN ERROR
        // SO WE HAVE TO UPDATE THE EXISTING ARRAY LIKE THIS IS WE WANT TO MODIFY IT:
        a[1] = 123;
    }

    // CREATING A FUNCTION THAT RETURNS AN ARRAY

    // ITS NOT IDEAL TO STORE ARRAYS BECAUSE IT WILL BE VERY GAS EXPENSIVE SIMILAR TO THE ERRORS THAT WE USE A STRING AS A MESSAGE THAT THERES A BUG.
    // ITS NOT RECOMMENDED TO USE THIS METHOD.
    function returnArray() external view returns (uint256[] memory) {
        return nums;
    }
}
