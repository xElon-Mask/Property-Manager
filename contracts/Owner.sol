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