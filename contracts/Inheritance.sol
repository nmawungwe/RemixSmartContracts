// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.4;


/*
    1. Solidity supports multiple inheritance
    2. Functions marked as 'virtual' in parent contracts can be overriden by child contracts.
    3. Child contracts can override parent functions using the 'override' keyword
    4. Order of inheritance matters
*/
contract A {
    // top level parent contract
    // virtual marks this function to be able to be overriden by children
    function foo() public pure virtual returns (string memory) {
        return "contract A";
    }
}
//  B inherits A 
contract B is A {
    // Override A.foo() 
    // When we call 'foo()' on contract B, it will return the string "contract B" 
    function foo() public pure virtual override returns(string memory) {
        return "contract B";
    }
}

contract C is A {
    // both virtual and override means 
    // override A.foo()
    // but also, make C.foo() able to be overridden later 
    // if someone is inheriting C directly 
    function foo() public pure virtual override returns (string memory) {
        return "contract C";
    }
}

// D inherits from BOTH 
// B and C 
contract D is B, C {
    function foo() public pure override(B, C) returns(string memory) {
        // super 
        // you might have seen super in javascript
        // it is a special keyword that lets you call your parents functions 

        return super.foo(); 
    }
}

contract E is C, B{
    function foo() public pure override (C, B) returns (string memory) {
        
        
        return super.foo();
    }
}