// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract good{
    address public currentwinner;
    uint256 public currentauctionprice;

    constructor(){
        currentwinner=msg.sender;
    }
    function price() public payable{
        require(msg.value > currentauctionprice, "not enough eth");
        (bool sent,) = currentwinner.call{value: currentauctionprice}("");
        if(sent){
            currentwinner= msg.sender;
            currentauctionprice = msg.value;
        }
    }
}