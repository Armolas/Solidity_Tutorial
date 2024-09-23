// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import { PriceConverter } from "./price_converter.sol";

error UnauthorizedTransaction();
contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MIN_USD = 5e18;
    address[] public funders;
    mapping (address funder => uint256 amtFunded) public addressToAmtFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MIN_USD, "Didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmtFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        for (uint256 index = 0; index < funders.length; index++) 
        {
            addressToAmtFunded[funders[index]] = 0;
        }
        funders = new address[](0);

        // transfer
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "withdrawal call failed");
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not contract owner");
        if(msg.sender != i_owner){
            revert UnauthorizedTransaction();
        }
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}