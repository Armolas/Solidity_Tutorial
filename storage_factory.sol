// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import { SimpleStorage } from "./simple_storage.sol";
contract StorageFactory{
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 index, uint256 favoriteNumber) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[index];
        mySimpleStorage.store(favoriteNumber);
    }

    function sfGet(uint index) public view returns(uint256) {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[index];
        return mySimpleStorage.retrieve();
    }
}

