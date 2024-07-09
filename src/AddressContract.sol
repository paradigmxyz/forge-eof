pragma solidity ^0.8.0;

contract AddressContract {
    address public contractAddress;

    function setContractAddress() public {
        contractAddress = address(this);
    }
}
