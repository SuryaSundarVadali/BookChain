// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./Category.sol";

contract Company{
    string public author_name;
    address public publisher;
    Category[] public genre_addresses;
    string[] public genres;

    error UnauthorizedAccess();
    
    constructor(string memory _author_name, address _publisher){
        author_name = _author_name;
        publisher = _publisher;
    }

    modifier onlyOwner {
    if (msg.sender != publisher) {
        revert UnauthorizedAccess();            
    }
    _;
}

    function createCategory(string memory _genre) public onlyOwner{
        Category category = new Category(author_name, _genre, publisher);
        genre_addresses.push(category);
        genres.push(_genre);
    }
    
    function allCategoryAddresses()public view returns (Category[] memory){
        return genre_addresses;
    }

    function allCategories()public view returns (string[] memory){
        string[] memory _data = new string[](genres.length);
        for(uint _index=0; _index<genres.length; _index++){
            _data[_index] = genres[_index];
        }
        return (_data);
    }

    function changeBrandName(string memory _new_author_name) public onlyOwner{
        author_name = _new_author_name;
    }

}