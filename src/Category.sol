// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Book.sol";

contract Category {
    string public author_name;
    string public genre;
    address public publisher;
    Book[] public book_addresses;
    string[] public books;

    // Define the custom error
    error UnauthorizedAccess();

    constructor(string memory _author_name, string memory _genre, address _publisher) {
        author_name = _author_name;
        genre = _genre;
        publisher = _publisher;
    }

    modifier onlyOwner() {
        if (msg.sender != publisher) {
            revert UnauthorizedAccess();
        }
        _;
    }

    function createProduct(string memory _book_name, string memory _book_link, string memory _genre) public onlyOwner {
        Book book_new = new Book(_book_name, author_name, _book_link, _genre);
        book_addresses.push(book_new);
        books.push(_book_name);
    }

    function allBookAddresses() public view returns (Book[] memory) {
        return book_addresses;
    }

    function allBooks() public view returns (string[] memory) {
        string[] memory _data = new string[](books.length);
        for (uint _index = 0; _index < books.length; _index++) {
            _data[_index] = books[_index];
        }
        return _data;
    }
}