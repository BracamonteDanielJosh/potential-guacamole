// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Frontend {
    address payable public accountHolder; // Address of the account holder
    uint256 public accountBalance; // Current balance in the account

    mapping(address => uint256) public deposits; // Mapping to track deposits made by each address
    mapping(address => uint256) public withdrawals; // Mapping to track withdrawals made by each address

    event FundsDeposited(address indexed depositor, uint256 amount); // Event emitted when funds are deposited into the account
    event FundsWithdrawn(address indexed withdrawer, uint256 amount); // Event emitted when funds are withdrawn from the account

    // Constructor to initialize the account holder and initial balance
    constructor(uint initialBalance) payable {
        accountHolder = payable(msg.sender);
        accountBalance = initialBalance;
    }

    // Function to get the current balance of the account
    function getAccountBalance() public view returns (uint256) {
        return accountBalance;
    }

    // Function to deposit funds into the account
    function depositFunds(uint256 _amount) public payable {
        // Store the previous balance for assertion
        uint256 previousBalance = accountBalance;

        // Ensure the sender is the account holder
        require(msg.sender == accountHolder, "You are not the account holder");

        // Update the account balance
        accountBalance += _amount;

        // Update the deposits mapping
        deposits[msg.sender] += _amount;

        // Assert that the transaction completed successfully
        assert(accountBalance == previousBalance + _amount);

        // Emit the event for funds deposited
        emit FundsDeposited(msg.sender, _amount);
    }

    // Custom error for insufficient funds
    error InsufficientFunds(uint256 balance, uint256 withdrawAmount);

    // Function to withdraw funds from the account
    function withdrawFunds(uint256 _withdrawAmount) public {
        // Ensure the sender is the account holder
        require(msg.sender == accountHolder, "You are not the account holder");

        // Store the previous balance for assertion
        uint256 previousBalance = accountBalance;

        // Check if the account balance is sufficient for withdrawal
        if (accountBalance < _withdrawAmount) {
            revert InsufficientFunds({
                balance: accountBalance,
                withdrawAmount: _withdrawAmount
            });
        }

        // Update the withdrawals mapping
        withdrawals[msg.sender] += _withdrawAmount;

        // Withdraw the given amount from the account
        accountBalance -= _withdrawAmount;

        // Assert that the balance is correct after withdrawal
        assert(accountBalance == (previousBalance - _withdrawAmount));

        // Emit the event for funds withdrawn
        emit FundsWithdrawn(msg.sender, _withdrawAmount);
    }
}

