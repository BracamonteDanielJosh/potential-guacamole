# Smart Contract README

## Overview

This Solidity smart contract, named SmartContract, provides basic functionalities for minting and burning tokens. It also includes functionality for querying balances of addresses.

## Contract Details

### Public Variables

1. **Name**: A public variable representing the name of the contract. It is initialized with the value "Xarb".

2. **Abbrv**: A public variable representing an abbreviation for the contract. It is initialized with the value "Daniel".

3. **TotalMoney**: A public variable representing the total amount of money in the contract. It is initialized with the value 0.

### Mapping Variables

1. **balances**: A mapping variable that maps addresses to their respective balances. It stores the balance of each address in the contract.

### Functions

1. **mint**: A function used to mint new tokens. It increases the total money in the contract and updates the balance of the specified address.

    - Parameters:
        - `_address`: The address to which tokens will be minted.
        - `_value`: The amount of tokens to mint.

2. **burn**: A function used to burn tokens. It decreases the total money in the contract and updates the balance of the specified address, if the address has sufficient tokens.

    - Parameters:
        - `_address`: The address from which tokens will be burned.
        - `_value`: The amount of tokens to burn.
