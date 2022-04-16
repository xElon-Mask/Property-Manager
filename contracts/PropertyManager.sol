// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.13;

contract Owner {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(owner == msg.sender, "Not the Property Manager");
        _;
    }

}

contract PropertyManager {

    enum typeProperty { field, apartment, house}

    struct property {
        uint id;
        string name;
        uint price;
        typeProperty _typeProperty;
    }

    mapping(address => property[]) PropertiesOwned;

}