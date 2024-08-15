// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Store.sol";

contract BookStore{
    string public Store_Name;
    address public Store_Address;
    Store[] public genre_addresses;
    string[] public stores;

    error UnauthorizedAccess();
    
    constructor(){
        Store_Name = "BookStore";
        Store_Address = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != Store_Address) {
            revert UnauthorizedAccess();
        }
        _;
    }

    function createStore(string memory _author_name, address _publisher) public onlyOwner{
        Store store = new Store(_author_name, _publisher);
        genre_addresses.push(store);
        stores.push(_author_name);
    }
    
    function allCompanyAddresses()public view returns (Store[] memory){
        return genre_addresses;
    }

    function allCompanies()public view returns (string[] memory){
        string[] memory _data = new string[](stores.length);
        for(uint _index=0; _index<stores.length; _index++){
            _data[_index] = stores[_index];
        }
        return (_data);
    }

}