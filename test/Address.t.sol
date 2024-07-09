pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {AddressContract} from "../src/AddressContract.sol";

contract AddressTest is Test {
    AddressContract  public addressContract;
    function setUp() public {
        addressContract = new AddressContract();
    }

    function test_address() public {
        addressContract.setContractAddress();

        assertEq(addressContract.contractAddress(), address(addressContract), "Contract address should match the instance address");
    }
}
