// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

// Variables are stored in one of three places.

// storage - variable is a state variable (store on blockchain)
// memory - variable is in memory and it exists temporary during a function call
// calldata - special data location that contains function arguments
// Difference between memory and calldata

////////////////////////////////////
////////////// VIDEO ///////////////
////////////////////////////////////
// contract DataLocation {
//     struct MyStruct {
//         uint256 foo;
//         string text;
//     }

//     mapping(address => MyStruct) public myStructs;

//     function examples() external {
//         myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

//         MyStruct storage myStruct = myStructs[msg.sender];
//         myStruct.text = "foo";
//     }
//     // IF WE WANT TO MODIFY THE STRUCT WE DECLARE THE VARIABLE IN STORAGE
// }

////////////////////////////////////
////////////// COURSE //////////////
////////////////////////////////////

contract DataLocations {
    // Data locations of state variables are storage
    uint256 public x;
    uint256 public arr;

    struct MyStruct {
        uint256 foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    // Example of calldata inputs, memory output
    function examples(uint256[] calldata y, string calldata s) external returns (uint256[] memory) {
        // Store a new MyStruct into storage
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        // Get reference of MyStruct stored in storage.
        MyStruct storage myStruct = myStructs[msg.sender];
        // Edit myStruct
        myStruct.text = "baz";

        // Initialize array of length 3 in memory
        uint256[] memory memArr = new uint256[](3);
        memArr[1] = 123;
        return memArr;
    }

    // TASK 1 //
    // Complete the function set(address addr, string calldata text).
    // This function should set text stored inside MyStruct at addr to text.
    // Notice that text is declared as calldata instead of memory, minimizing gas cost.
    function set(address addr, string calldata text) external {
        MyStruct storage myStruct = myStructs[addr];
        myStruct.text = text;
    }

    // TASK 2 //
    // Complete get(address addr) which returns the text of MyStruct stored at addr.

    function get(address addr) external view returns (string memory) {
        return myStructs[addr].text;
    }
}
