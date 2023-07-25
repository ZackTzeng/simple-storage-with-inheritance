// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; 
// having a ^ sign in front of the version means any versions newer also works

/// @title An introductory contract to set best number and retrieve best number for multiple people
contract SimpleStorage {
    uint256 internal myBestNumber;

    struct Friend {
        string name;
        uint256 bestNumber;
    }

    Friend[] friendList;

    mapping(string => Friend) mappingNameToFriend;

    function setNewFriend(string calldata _name, uint256 _bestNumber) public {
        Friend memory newFriend = Friend({
            name: _name,
            bestNumber: _bestNumber
        });

        friendList.push(newFriend);

        mappingNameToFriend[_name] = newFriend;
    }

    function getAllNewFriend() public view returns(Friend[] memory) {
        return friendList;
    }

    function setMyBestNumber(uint256 _myNewNumber) public virtual {
        myBestNumber = _myNewNumber;
    }

    function getMyNumber() public view returns(uint256) {
        return myBestNumber;
    }


    mapping(string => uint256) nameToBestNumber;
    string[] nameList;

    function setPersonBestNumber(string calldata _name, uint256 _bestNumber) public {
        nameToBestNumber[_name] = _bestNumber;
        nameList.push(_name);
    }

    function getPersonBestNumber(string calldata _name) public view returns(uint256) {
        return nameToBestNumber[_name];
    }

    function getPersonList() public view returns(string[] memory) {
        return nameList;
    }
}

// 0x9C1AD8f260a279845E4181b3EA80c9045d66b589
