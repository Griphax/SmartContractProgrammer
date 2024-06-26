// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract DefaultVales {
    bool public b; // false
    uint256 public u; // 0
    int256 public i; // 0
    address public a; // 0x00000000000000000000000000000000
    bytes32 public b32; // 0x0000000000000000000000000000000000000000000000000000000000000000
}

///////////////////////////////
/////////// IF ELSE ///////////
///////////////////////////////

contract IfElse {
    // _x is the input we are assigning to the function.
    function example(uint256 _x) external pure returns (uint256) {
        if (_x < 10) {
            return 1;
        } else if (_x < 20) {
            return 2;
        } else {
            return 3;
        }
    }

    function ternary(uint256 _x) external pure returns (uint256) {
        // if (_X < 10) {
        //     return 1;
        // } else {
        //     return 2;
        // }

        // THIS IS THE TERNARY METHOD OF THE CODE ABOVE
        return _x < 10 ? 1 : 2;
    }
}

//////////////////////////////////////////
/////////// FOR AND WHILE LOOPS //////////
//////////////////////////////////////////

contract ForAndWhileLoops {
    function loops() external pure {
        for (uint256 i = 0; i < 10; i++) {
            // code
            if (i == 3) {
                // With continue we  skip the current iteration and move to the next one.
                continue;
            }
            if (i == 5) {}
            break;
            // Here break will stop the loop. It will not continue to the next iteration 5.
        }
        // WHILE LOOP
        // j is assign as 0
        // We assign a condition "j < 10" and we increment j by 1.
        // So it will start with 0 and increment by 1 until it reaches 10.
        uint256 j = 0;
        while (j < 10) {
            j++;
        }
    }

    // ITS IMPORTANT TO CONSIDER THAT THE MORE LOOPS WE ASSIGN THE MORE GAS EXPENSIVE IT WILL GET, SO ITS IMPORTANT TO LIMIT THE LOOPS AS MUCH AS WE CAN.
    function sum(uint256 _n) external pure returns (uint256) {
        uint256 s; //
        for (uint256 i = 1; i <= _n; i++) {
            s += i;
        }
        return s;
    }
}

/////////////////////////////////
/////////// ERROR ///////////////
/////////////////////////////////

// There are 3 ways to declare an error:
// require, revert, assert
// gas refund, state updates are reverted
// custom error - save gas

contract Error {
    // REQUIRE
    function testRequire(uint256 _i) public pure {
        require(_i <= 10, "Value must be greater than 10");
    }

    // REVERT
    function testRevert(uint256 _i) public pure {
        if (_i <= 10) {
            revert("Value must be greater than 10");
        }
    }

    // ASSERT
    uint256 public num = 123;

    function testAssert() public view {
        assert(num == 123);
    }

    function foo(uint256 _i) public {
        // HERE WE ACCIDENTALLY INCREMENT THE NUM VARIABLE
        // SO THE ASSERT FUNCTION WILL FAIL(that is above)
        // AND THE TRANSACTION WILL BE REVERTED
        num += 1;
        // WE CAN USE REQUIRE INSIDE THE FUNCTION TO MAKE SURE THE VALUE IS LESS THAN 10
        require(_i < 10);
    }

    // CUSTOM ERROR

    error myError(address caller, uint256 i);

    function testCustomError(uint256 _i) public view {
        if (_i > 10) {
            revert myError(msg.sender, _i);
        }
    }
}

////////////////////////////////////////
/////////// MODIFIERS ///////////
//////////////////////////////////////

contract FunctionModifier {
    bool public paused;
    uint256 public count;

    // Modifier to check if not paused
    modifier whenNotPaused() {
        require(!paused, "paused");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    modifier whenPaused() {
        require(paused, "not paused");
        _;
    }

    function reset() external whenPaused {
        count = 0;
    }

    function setPause(bool _paused) external {
        paused = _paused;
    }

    // This function will throw an error if paused
    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    // Modifiers can take inputs.
    // Here is an example to check that x is < 10
    modifier cap(uint256 x) {
        require(x < 10, "x >= 10");
        _;
    }

    function incBy(uint256 x) external whenNotPaused cap(x) {
        count += x;
    }

    // Modifiers can execute code before and after the function.
    modifier sandwich() {
        // code here
        _;
        // more code here
    }
}

////////////////////////////////////////////
/////////// CONSTRUCTOR /////////
///////////////////////////////////////////

contract Constructor {
    address public owner;
    uint256 public x;

    constructor(uint256 _x) {}
}
