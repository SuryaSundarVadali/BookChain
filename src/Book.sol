//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Book {
    uint256 private totalStock;
    uint256 private stock;
    address publisher;
    bool private supplyEnded;
    uint256 warrentyPeriod;
    address[] customers;


    /* Error */
    error UnauthorizedAccess();
    
    constructor(string memory _book_name, uint256 _initial_stock,string memory _author_name, address _publisher,uint256 _warrentyPeriod) {
        // constructor
        totalStock = _initial_stock;
        stock = _initial_stock;
        publisher = _publisher;
        supplyEnded = false;
        warrentyPeriod = _warrentyPeriod*31536000;


        
    }

    modifier onlyOwner {
    if (msg.sender != publisher) {
        revert UnauthorizedAccess();            
    }
    _;
}

    function functionName(uint256) public {
        // function
    }

    function supplyLimit() public view returns (uint256) {
        return totalStock;
    }

    function remainingSupply() public view returns(uint256){
        return stock;
    }

    function addSupply(uint _stock) public onlyOwner{
        totalStock+=_stock;
    }

    function ended() public view returns (bool) {
        return supplyEnded;
    }

    function endSupply() public onlyOwner returns (bool) {
        require(supplyEnded == false, 'Supply has already ended');
        supplyEnded = true;
        return supplyEnded;
    }

    

}