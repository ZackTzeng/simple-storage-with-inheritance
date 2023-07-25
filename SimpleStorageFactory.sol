// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { SimpleStorage } from "./SimpleStorage.sol";

contract SimpleStorageFactory {
    SimpleStorage[] simpleStorageList;

    function getAllSimpleStorageContracts() view public returns(SimpleStorage[] memory) {
        return simpleStorageList;
    }

    function createSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageList.push(simpleStorage);
    }

    function sfSetMyBestNumber(uint256 _index, uint256 _bestNumber) public {
        SimpleStorage simpleStorage = simpleStorageList[_index];
        simpleStorage.setMyBestNumber(_bestNumber);
    }

    function sfGetMyBestNumber(uint256 _index) view public returns(uint256) {
        SimpleStorage simpleStorage = simpleStorageList[_index];
        return simpleStorage.getMyNumber();
    }
}
