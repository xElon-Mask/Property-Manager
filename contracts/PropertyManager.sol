// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.13;

contract Owner {

    address owner;

    constructor() {
        owner = msg.sender;
    }

}