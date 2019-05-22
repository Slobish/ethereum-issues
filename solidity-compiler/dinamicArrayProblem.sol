pragma solidity >=0.5.8;

contract Test {
    
    function foo() public pure returns (uint256[] memory) {
        //uninitialized memory array
        uint256[] memory arr;
        //assignation to array slot
        arr[3] = 4;
        return arr;
    }
}