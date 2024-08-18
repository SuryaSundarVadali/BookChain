//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "lib/forge-std/src/Script.sol";
import {BasicNFT} from "src/BasicNFT.sol";

contract DeployNFT is Script {
    function run() external returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT nft = new BasicNFT();
        vm.stopBroadcast();
        return nft;
    }
}
