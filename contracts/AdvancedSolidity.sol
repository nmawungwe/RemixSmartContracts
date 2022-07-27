// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.4;

/*
1. Mappingg
2. Enums
3. Structs
4. View and Pure Fuctions
5. Modifiers
6. Events
7. Constructors
8. Inheritance
9. How to transfer ETH from a smart contract
10. Calling external smart contracts
11. Import statements
12. Solidity Libraries
*/

// contract Mapping {
//     // mapping (keyValue => value) 

//     mapping(address => string) public moods;
//     // access someone's mood value 
    
//     function getMood(address user) public view returns (string memory) {
//         return moods[user];
//     }

//     function setMood(string memory mood) public {
//         moods[msg.sender] = mood;
//     }

//     // current account address 0x194d69F86610815644cf1227889BeF1E4DddFE9a 
//     // 2nd address 0xc25b024D8EeC27aD88E352A6F0dDEFE3776F02fD
// }

// contract MemoryAndStorage {

//     // Solidity has 3 types of 'Storage' location for variables 
//     // 1. Memory 
//     // 2. Storage 

//     /*
//     Where is information stored in a computer 
//     => Theres multiple layers
//     1. CPU Cache, tiny but extremely fast
//     2. RAM, decent amount of storage, decently fast
//     3. Hard Disk/SSD, MUCH more storage, MUCH slower
//     */
// }

// contract Enums {
    
//     // ID => Status mapping 
//     // mapping(uint256 => string) todos;

//     // function addTask(uint256 id) public {
//     //     todos[id] = "TODO";
//     // }

//     // function updateStatus(uint256 id, string memory newStatus) public {
//     //     todos[id] = newStatus;
//     // }

//     // function getStatus(uint256 id) public view returns (string memory) {
//     //     return todos[id];
//     // }

//     // However strings are not the best possible option
//     // 1. Dynamic length, 
//     // 2. Have to validate each string to make sure its a possible option 

//     // Alternate Approach: We can use numbers to represent a status 
//     // 0. TODO
//     // 1. In progress
//     // 2. Done 
//     // 3. Cancelled

//     enum Status {
//         TODO,
//         IN_PROGRESS,
//         DONE,
//         CANCELED
//     }

//     mapping(uint256 => Status) todos;

//     function addTask(uint256 id) public {
//         todos[id] = Status.TODO;
//     }

//     // function updateStatus(uint256 id, uint256 newStatus) public {
//     //     require(newStatus < 0, "Invalid input");
//     //     todos[id] = newStatus;
//     // }

//     function markTaskInProgress(uint256 id) public {
//         todos[id] = Status.IN_PROGRESS;
//     }

//     function getStatus(uint256 id) public view returns (Status) {
//         return todos[id];
//     }

//     // Enums are a way to restrict a variable's value to a predifined set of possible outcomes 

// }

// contract Structs {

//     enum Status {
//         TODO,
//         IN_PROGRESS,
//         DONE,
//         CANCELED
//     }
    
//     struct Task {
//         string title;
//         string description;
//         Status status;
//     }

//     mapping (uint256 => Task) tasks;

//     function addTask(uint256 id, string memory title, string memory description) public {


//         // Method 1 
//         // tasks[id] = Task(title, description, Status.TODO);

//         // Method 2 the easiest and best way
//         tasks[id] = Task({
//             title: title,
//             description: description,
//             status: Status.TODO
//         });

//         // Method 3 
//         // Task memory task; 
//         // task.title = title;
//         // task.description = description;
//         // task.status = Status.TODO;

//         // tasks[id] = task;
//     }

//     function editTaskTitle(uint256 id, string memory newTitle) public {
//         tasks[id].title = newTitle;
//     }

//     function deleteTask(uint256 id) public {
//         delete tasks[id];
//     }


// }

// contract ViewAndPureFunctions {

//     //  3 kinds of keywords to indicate side-effects of a function 
//     // First Kind - no keyword at all 
//     // Second Kind - 'view' function 
//     // Third Kind - 'pure' function 

//     uint y;
//     // First 
//     function someFunction() public {
//         uint x = 0;
//         x = 5; 
//         y = 5;
//     }

//     // View function is a function that READS from state, but does NOT write to state 
//     function getY() public view returns (uint) {
//         return y;
//     }

//     //Pure function is a function that DOES NOT read OR write to state 
//     function addTwoNumbers(uint a, uint b) public pure returns (uint) {
//         return a + b; 
//     }

//     // View and Pure functions are free to call, they dont cost gas other functions which modify/write to state
//     // cost gas 

// }

// contract Modifier {
//     /*
//         Modifiers are pieces of code that can be run before or after any other function

//     */

//     address owner;

//     constructor() {
//         owner= msg.sender;
//     }

//     modifier onylyOwner() {
//         require(msg.sender == owner, "Unauthorized");
//         _;
//     }

//     // these 4 functions below should be called by the owner 
//     function someFunc1() public onylyOwner {
//         require(msg.sender == owner, "Unauthorized")
//     }

//     function someFunc2() public onylyOwner {

//     }

//     function someFunc3() public onylyOwner {

//     }

//     function someFunc4() public onylyOwner {

//     }


// }

// contract ETHSender {
//     // Three different ways to send ETH from a contract 
//     // Reason for having three different methods is basically  
//     // Solidity got upgraded over the years  
//     // Shitty code got deprecated 
//     // 2 of the 3 methods are no longer recommended to use 
//     // .call method 
    
//     function mirror() public payable {
//         // msg.sender person we getting Eth from  
//         // and also the person sending back the Eth 

//         // msg.value is the amount of ETH we receive, and amount we send back 

//         address payable target = payable(msg.sender);
//         uint256 amount = msg.value;

//         // (payable address).call{value: amount}("")
//         // .call() returns two variables
//         // the first is a boolean indicating success or failure
//         // the second is some bytes which have data  

//         // if you had a function that returns a single uint 
//         // you can do something like 
//         // uint result = someFuntion();

//         // (bool success, bytes memory data) = target.call{value: amount}("");
//         (bool success, ) = target.call{value: amount}("");
//         require(success, "FAILURE");
//     }

// }

/*
    There are two kinds of imports you can do 
    1. Local import
    2. External import
*/

// interface SomeInterface {

// }

// library SafeMath {
//     function add(uint x, uint y) internal pure returns(uint) {
//         uint z = x + y;
//         // make sure an overflow didn't occur 
//         require (z >= x, "overflow happened");
//         require (z >= y, "overflow happened");
//         return z;
//     }
// }

// contract Libraries {

//  /*
//     So far we have seen two top-level contructs in Solidity
//     1. contract
//     2. interface

//     The is actually a third top-level construct 
//     3. library 
//  */
//   function testAddition(uint x, uint y) public pure returns (uint) {
//       return SafeMath.add(x, y);
//   }

// }

// interface MinimalERC20 {
//     // we dont need an interface for the ENTIRE contract  
//     // if we are not using those functions 

//     function balanceOf(address account) external view returns (uint256);
// }

// contract ExternalCaller {
//     /*
//     What is an interface 
//     -> An interface is kind of like an ABI to a contract
//     -> It defines function declarations
//         1. What is the name of the function present in this contract 
//         2. What are the input values
//         3. What is the return value 
//         4. What is the visibility (public/private/external etc)
//         5. What is the mutability (view, pure, nothing) 
//     */
//     MinimalERC20 externalContract;

//     constructor(address someERC20Contract) {
//         externalContract = MinimalERC20(someERC20Contract);
//     }

//     function doIHaveBalance() public view {

//         uint balance = externalContract.balanceOf(msg.sender);
//         require(balance > 0, "you don't have enough tokens");
//     }
// }

contract Events {
    /*
        What are events ?
        -> Events are 'logs' on the Ethereum blockchain

        You can use events to 'log' information on the blockchain, kind of for 
        as a proof of history that something happened at a certain block 

        Events have: 
        1. name 
        2. arguments that you want to log
    */

    // event TestFunctionCalled(address sender, string message);

    // function test() public {
    //     emit TestFunctionCalled(msg.sender, "Somebody called test()");
    // }
    address owner;

        constructor() {
        owner= msg.sender;
    }

    event Transfer(address from, address to);

    // address ownerOfNFT;

    function transfer(address newOwner) public {
        require(msg.sender == owner, "you cannot transfer");
        owner = newOwner;

        emit Transfer(msg.sender, newOwner);
    }

}
