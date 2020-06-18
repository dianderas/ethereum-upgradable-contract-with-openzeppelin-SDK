// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts-ethereum-package/contracts/access/Ownable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/Initializable.sol";

contract Box is OwnableUpgradeSafe {
    uint256 private value;

    // Emitted when the stored value changes
    event ValueChanged(uint256 newValue);

    function initialize() public initializer {
        OwnableUpgradeSafe.__Ownable_init();
    }

    // Stores a new value in the contract
    function store(uint256 newValue) public onlyOwner {
        value = newValue;
        emit ValueChanged(newValue);
    }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return value;
    }

    function increment() public {
        value = value + 1;
        emit ValueChanged(value);
    }
}