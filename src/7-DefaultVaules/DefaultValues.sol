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
        uint256 s;
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
// 

contract Error {}
