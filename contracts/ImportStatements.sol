pragma solidity ^0.8.4;
import "./Inheritance.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

/*
    There are two kinds of imports you can do 
    1. Local import
    2. External import

    When using Hardhat, we use OpenZeppelin contracts, but we dont import them externally we download 
    openzeppelin contracts as a node package through npm
    npm install @openzeppelin/contracts

    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
    it then becomes a local import hehehehe.

    when you donwload npm packages, they go into your `node_modules` folder and you're just importing files
    from the `node_modules` folder

    so this is still a LOCAL import, not an external import  
*/

