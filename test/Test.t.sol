pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {UniswapV3Factory} from "../src/UniswapV3Flattened.sol";

contract EOFTest is Test {
    UniswapV3Factory public factory;
    function setUp() public {
        factory = new UniswapV3Factory();
    }

    function test_Swap() public {
        factory.runTest();
    }
}
