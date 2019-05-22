## Description
Attempting to access an uninitialized dynamic array in memory is not implemented in the EVM nor detected by the compiler.

**This could be pottentialy used in a honeypot as it seems legit code and it actually compiles and can be deployed in the blockchain.**

## Environment

- Compiler version: **0.5.8**
- Target EVM version: **default**
- Framework/IDE (e.g. Truffle or Remix): **Remix**
- EVM execution environment / backend / blockchain client: **geth**/**ropsten**/**ganache**

## Steps to Reproduce
The following contract is subject of this bug.
```solidity
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
```
The execution throws **"error invalid opcode"** as it is trying to access the array out of its bounds, which are 0 before initialization.