// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {SimpleStorage} from "./simple_storage.sol";

contract AddFive is SimpleStorage {
    function store(uint256 favoriteNumber) public override {
        myFavoriteNumber = favoriteNumber + 5;
    }
}