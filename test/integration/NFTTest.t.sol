//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "lib/forge-std/src/Test.sol";
import {DeployNFT} from "script/DeployNFT.s.sol";
import {BasicNFT} from "src/BasicNFT.sol";

contract NFTTest is Test {
    DeployNFT public deployNFT;
    BasicNFT public nft;
    address public USER = makeAddr("USER");
    string public constant CAR =
        "https://ipfs.io/ipfs/QmSrmJBwWcebXUmsvfmwMGrqdhLdDrEipEbwaBQvcjU6Vs?filename=Tiger.json";

    function setUp() public {
        deployNFT = new DeployNFT();
        nft = deployNFT.run();
    }

    function testNameisCorrect() public view {
        string memory expectedname = "Porsche";
        string memory actualname = nft.name();
        assert(keccak256(abi.encodePacked(expectedname)) == keccak256(abi.encodePacked(actualname)));
    }

    function testCanMintandHaveABalance() public {
        vm.prank(USER);
        nft.mintNFT(CAR);
        assert(nft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(nft.tokenURI(0))) == keccak256(abi.encodePacked(CAR)));
    }
}
