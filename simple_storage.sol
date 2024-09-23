// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract SimpleStorage{
    uint256 public myFavoriteNumber;
    string public myName = "Muritadhor Arowolo";
    bool hasFavoriteNumber = true;

    struct Person{
        string firstName;
        string lastName;
    }
    
    Person public Armolas = Person("Muritadhor", "Arowolo");

    Person[] public listOfPersons;

    mapping(string => Person) public nickToFullname;

    
    function addPerson(string memory firstName, string memory lastName) public {
        listOfPersons.push(Person(firstName, lastName));
        nickToFullname["armolas"] = Armolas;
    }

    function store(uint256 favoriteNumber) public virtual {
        myFavoriteNumber = favoriteNumber;
        hasFavoriteNumber = true;
    }

    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }
}