//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Book {
    address publisher;
    address[] customers;
    string public book_name;
    string public author_name;
    string public book_link;
    string public genre;


    /* Error */
    error UnauthorizedAccess();
    
    constructor(string memory _book_name, string memory _author_name, string memory _book_link, string memory _genre) {
        book_name = _book_name;
        author_name = _author_name;
        book_link = _book_link;
        genre = _genre;
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

    

}