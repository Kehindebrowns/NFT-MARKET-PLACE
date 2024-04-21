 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


 import "hardhat/console.sol";

contract Lock {
    uint256 public unlockTime;
    address payable public owner;

    event Withdrawal(uint256 amount, uint256 when);
    mapping(address => uint256) public deposits;

    constructor(uint _unlockTime) payable {
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );

         unlockTime = _unlockTime;
         owner = payable(msg.sender);
    }

    function withdrawl() external {
        
         console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

        require(block.timestamp >= unlockTime, "You can't withdraw yet");
        require(msg.sender == owner, "You aren't the owner");

        emit Withdrawal(address(this).balance, block.timestamp);

        owner.transfer(address(this).balance);
          console.log(owner);
    }
   function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        deposits[msg.sender] += msg.value;
    }
 function getBalance() external view returns (uint256) {
        return deposits[msg.sender]; 
    }
}
