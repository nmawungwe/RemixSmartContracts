// SPDX-License-Identifier: MIT 
// Version I want to use 
pragma solidity ^0.8.0;

// import ERC20 Contract from OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract VisionToken is ERC20 {

    // We also want to call the constructor present inside ERC20 
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        
        // Get some tokens for ourselves 
        // msg.sender is wallet deploying contract 
        _mint(msg.sender, 1000 * (10 ** 18));
        // This is OUR constructor 

    }

}