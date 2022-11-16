// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity 0.8.8;
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {

    uint256 public favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    /* It is a dynamic array, if we wanted to specify the length of the array we can simply do:
    People[0] public people; */
 
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    // view/pure function
    // It costs 0 gas, unless it is called inside a function that costs gas
    // IMPORTANT: We only make a transaction if we modify the blockchain state 
    // Unless it is called inside a function that costs gas
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    // calldata (temporary variables that can be modified), memory(temporary variables that can be modified), storage (permament variables that can be modified)
    // the variable that has the memory keyboard
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        /* 
        Instantiating an object in solidity is like in Java but the new keyword is not needed
        
        People memory Pepe = People({favoriteNumber: _favoriteNumber, name: _name});
        people.push(Pepe);

        /*

        /*
        The memory keyword:
        If we ommit the memory keyword we get a TypeError: Data location must be "memory" or "calldata
 for parameter in function, but none was given        */

 /*
    EVM can acceess and store informatin in six places:
    1. Stack 
    2. Memory
    3. Storage
    4. Calldata
    5. Code
    6. Logs
     
 */
        
        // people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
        // long way:
        // people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
        // short way:
        // people.push(People(_favoriteNumber, _name));

        // 
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

