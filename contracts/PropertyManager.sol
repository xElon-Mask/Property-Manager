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

contract PropertyManager is Owner {

    enum typeProperty { field, apartment, house}

    struct property {
        uint id;
        string name;
        uint price;
        typeProperty _typeProperty;
    }

    uint trackID;

    mapping(address => property[]) PropertiesOwned;

    function addProperty(address _landlord, string memory _name, uint _price, typeProperty _typeProperty) public isOwner {
        require(_price > 5000, "The property must cost more than 5000 wei");
        require(uint(_typeProperty) >= 0, "Only three choices avalaible : field : 0, apartement : 1, house: 2");
        require(uint(_typeProperty) <= 2, "Only three choices avalaible : field : 0, apartement : 1, house: 2");
        PropertiesOwned[_landlord].push(property(trackID, _name, _price, _typeProperty));
        trackID++;
    }

    function getProperty(address _landlord) public view isOwner returns(property[] memory) {
        return PropertiesOwned[_landlord];
    }

    function getTotalProperties(address _landlord) public view isOwner returns(uint) {
        return PropertiesOwned[_landlord].length;
    }

    function getMyProperties() public view returns(property[] memory) {
        return PropertiesOwned[msg.sender];
    }

}