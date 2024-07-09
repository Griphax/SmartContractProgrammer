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
        require(newOwner != address(0), "wasdasd");
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

contract ArrayBasic {
    // Several ways to initialize an array
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0
    uint256[3] public arrFixedSize;

    // Insert, read, update and delete
    function examples() external {
        // Insert - add new element to end of array
        arr.push(1);
        // Read
        uint256 first = arr[0];
        // Update
        arr[0] = 123;
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[0];

        // pop removes last element
        arr.push(1);
        arr.push(2);
        // 2 is removed
        arr.pop();

        // Get length of array
        uint256 len = arr.length;

        // Fixed size array can be created in memory
        uint256[] memory a = new uint256[](3);
        // push and pop are not available
        // a.push(1);
        // a.pop(1);
        a[0] = 1;
    }

    // Write function get(uint256 i) that will return the array element of arr at index i.

    // This function is external and view.
    function get(uint256 i) external view returns (uint256) {
        return arr[i];
    }

    // Write external function push, it takes in a single input x of type uint256 and appends x to the end of the array arr.
    function push(uint256 x) external {
        arr.push(x);
    }

    // Write external function remove(uint256 i) which will delete element at i from the array arr.
    function remove(uint256 i) external {
        delete arr[i];
    }

    // Write function getLength which will return the current length of the array arr.
    // This function must be external and view.
    function getLength() external view returns (uint256) {
        return arr.length;
    }
}

//////////////////////////////////////////////////
//////////////////// MAPPING /////////////////////
//////////////////////////////////////////////////

contract Mapping {
    mapping(address => uint256) public balances;
    // nested mapping
    mapping(address => mapping(address => bool)) public isFriend;

    function exammples() external {
        balances[msg.sender] = 123;
        uint256 bal = balances[msg.sender];
        uint256 bal2 = balances[address(1)];
        // update a maping
        balances[msg.sender] += 456; //  THIS MEANS THE BALANCE OF THE msg.sender + 456.
            // SO IT WILL BE EQUAL TO:
            // 123 + 456 = 579

        // this will reset the value, because we are
        delete balances[msg.sender];
        //HERE WE ARE SETTING THE VALUE OF THE ADDRESS OF THE SENDER TO 123
        isFriend[msg.sender][address(this)] = true;
        // HERE WE ARE SETTING THE VALUE OF THE ADDRESS OF THE SENDER TO THE ADDRESS OF THIS CONTRACT TO TRUE
        // THIS MEANS THAT THE SENDER IS A FRIEND OF THIS CONTRACT
    }
}

contract MappingBasic {
    // Mapping from address to uint256 used to store balance of addresses
    mapping(address => uint256) public balances;

    // Nested mapping from address to address to bool
    // used to store if first address is a friend of second address
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        // Insert
        balances[msg.sender] = 123;
        // Read
        uint256 bal = balances[msg.sender];
        // Update
        balances[msg.sender] += 456;
        // Delete
        delete balances[msg.sender];

        // msg.sender is a friend of this contract
        isFriend[msg.sender][address(this)] = true;
    }

    function get(address addr) external view returns (uint256) {
        return balances[addr];
    }

    function set(address addr, uint256 val) external {
        balances[addr] = val; // HERE WE ARE NOT USING RETURN BECAUSE WE ARE NOT RETURNING ANYTHING, WE ARE JUST UPDATING THE VALUE.
            // SI IT WILL NOT BE VIEW BECAUSE WE ARE UPDATING THE VALUE.
    }

    function remove(address addr) external {
        delete balances[addr];
    }
}

//////////////////////////////////////////////////
//////////////////// STRUCTS /////////////////////
//////////////////////////////////////////////////

contract Structs {
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        // how to initialize a struct
        // WITHOUT THE CURLY BRACES WE HAVE TO PUT THE KEY VALUES IN THE EXACT SAME ORDER
        Car memory toyota = Car("Toyota", 2020, msg.sender);
        // WITH THE CURLY BRACES WE CAN USE WHAT EVER ORDER WE WANT.
        Car memory lambo = Car({model: "Lamborghini", year: 2021, owner: msg.sender});
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        // THIS IS A SHORTCUT TO DECLARE MEMORY AND PUSH IT TO THE ARRAY
        cars.push(Car("Ferrari", 2020, msg.sender));
        // THIS IS THE SAME AS:
        // Car memory toyota = Car("Toyota", 2020, msg.sender);
        // cars.push(toyota);

        // HERE WE WERE USING MEMORY.  , BUT IF WE WANT TO MODOFY SOMETHING WE NMEED TO USE STORAGE, OTHERWISE IT WILL NOT BE STORED AND WOULD JUST MODIFY IT BY THE DURATION OF THE FUNCTION AND THEN LOSE IT

        Car storage _car = cars[0]; // THIS IS HOW WE HAVE ACCESS TO THE STUCT DATA IN A INDEX, IN THIS CASE IN DEX [0] WHICH IS TOYOTA
        _car.model;
        _car.year = 1999;
        _car.owner;

        // tooo reset the owner of this car
        delete _car.owner;
        // THIS WILL RESET THE owner TO THE DEFAULT VALUE WE ASSIGN AS A STATE VARIABLE IN MEMORY
        delete cars[1];
        // THIS WILL DELETE THE STRUCT STORED IN THE INDEX 1, IN THIS CASE IT WOULD BE LAMBO.
        // THIS WILL RESET THE STRING, UINT256 AND ADDRESS TO THE DEFAULT VALUES ASSIGN IN THE VARIABLES
    }
}

///////////////////////////////////
//////////////  ENUM  /////////////
///////////////////////////////////

contract Enum {
    // WE CAN USE THIS ENUM AS A STATE VARIABLE
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    // how to returb a enum

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        delete status;
    }
}

///////////////////////////////////
////////// DATA LOCATIONS /////////
///////////////////////////////////

// Variables are stored in one of three places.

// storage - variable is a state variable (store on blockchain)
// memory - variable is in memory and it exists temporary during a function call
// calldata - special data location that contains function arguments

// calldata is like memory but not modifiable. calldata saves gas.

contract DataLocations {
    struct MyStruct {
        uint256 foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples() external {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});
    }
}

// contract DataLocations {
//     // Data locations of state variables are storage
//     uint256 public x;
//     uint256 public arr;

//     struct MyStruct {
//         uint256 foo;
//         string text;
//     }

//     mapping(address => MyStruct) public myStructs;

//     // Example of calldata inputs, memory output
//     function examples(uint256[] calldata y, string calldata s) external returns (uint256[] memory) {
//         // Store a new MyStruct into storage
//         myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

//         // Get reference of MyStruct stored in storage.
//         MyStruct storage myStruct = myStructs[msg.sender];
//         // Edit myStruct
//         myStruct.text = "baz";

//         // Initialize array of length 3 in memory
//         uint256[] memory memArr = new uint256[](3);
//         memArr[1] = 123;
//         return memArr;
//     }

//     function set(address addr, string calldata text) external {
//         // Write your code here
//     }

//     function get(address addr) external view returns (string memory) {
//         // Write your code here
//     }
// }
