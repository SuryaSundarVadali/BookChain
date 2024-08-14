//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Book.sol";

contract Category{
    string public author_name;
    string public categoryName;
    address public publisher;
    Book[] public productAddresses;
    string[] public products;
    
    constructor(string memory _author_name, string memory _categoryName, address _categoryAddress){
        author_name = _author_name;
        categoryName = _categoryName;
        publisher = _categoryAddress;
    }

    modifier onlyOwner(){
        require(msg.sender == publisher,"Function accessible only by the owner !!");
        _;
    }

    function createProduct(string memory _book_name, uint256 _initialStock, uint256 _warrentyPeriod) public onlyOwner{
        Book book = new Book(_book_name, author_name, _initialStock, publisher, _warrentyPeriod);
        productAddresses.push(book);
        book.push(_book_name);
    }
    
    function allProductAddresses()public view returns (Book[] memory){
        return productAddresses;
    }

    function allProducts()public view returns (string[] memory){
        string[] memory _data = new string[](products.length);
        for(uint _index=0; _index<products.length; _index++){
            _data[_index] = products[_index];
        }
        return (_data);
    }

}