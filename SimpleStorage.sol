// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

// This line above is saying anything between 0.6.0 and 0.9.0
// It can also be done as :
// ' pragma solidity 0.7.0 ' to compile with that exact version
// ' pragma solidity ^0.6.0 ' to compile with any version of 0.6, i.e. 0.6._ any number

contract SimpleStorage {
    // uint256 is unsigned integer of size 256 bits
    uint256 favoriteNumber = 756;

    // Boolean
    bool isCorrect = true;

    // String
    string myString = "String";

    // Integer (int) signed
    int256 favoriteInt = -200;

    // An Ethereum address
    address favoriteAddress = 0x29D7d1dd5B6f9C864d9db560D72a247c178aE86B;

    // Solidity has different endianness for different data types
    // Endianness is basically the way in which the data in a variable is stored
    // Little Endian: (x86 machines) Here the last bit of the binary representation of the
    // data is stored in the first memory slot (register)
    // Big Endian: The first bit of the binary represntation of the data is stored in the
    // first register

    // In Solidity, Big Endians: strings and bytes
    // Little Endians: all other data types (int. uint, address, ....)

    // Bytes is a special data type in which any data can be stored, and they're mostly
    // treated like arrays. A number in 'uint' and a number in 'bytes' are not the same
    // because their internal representations are different.
    // Bytes represents a sequence of bytes in Solidity
    // Since they're like arrays, they can even be empty, and there 2 types: fixed, dynamic
    // Rather than using an array of bytes, like 'byte[]' it's better to use the
    // 'bytes' data type, since an array uses more padding and hence uses much more
    // space, and hence will cost more gas to deploy the contract

    // Bytes maxmimum size is bytes32, i.e. 32 bytes = 32*8 = 2556 bits
    // Any size of bytes type can be used, like bytes3, bytes 15, bytes 2, ....
    bytes32 favoriteByte = "myByte";

    // Null value in Solidity is 0, i.e., when a variable is declared and not given any
    // value, it sets it to 0 by default
    // Adding 'public' to the variable allows an external user of the contract to see the
    // variable's value
    uint256 public someNumber;
    uint256 public myFavoriteNumber;

    // Struct
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // Arrays same as other languages, they won't change size if an initial size is given
    // But an empty array can have elements added to it

    // An array of the People struct
    People[] public everyone;

    // Mapping: This is sort of like a dictionary in Python. A key is mapped to a value,
    // and the value can be accessed by calling the the key with the name of the mapping
    mapping(string => uint256) public nameToFavoriteNumber;

    // Bulding a function to add people into the array
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        everyone.push(People({favoriteNumber: _favoriteNumber, name: _name}));

        // creating a mapping from name to favoriteNumber
        nameToFavoriteNumber[_name] = _favoriteNumber;

        // You can also add it like this, but the values must be passed in the same order as
        // they have been defined in the struct:
        // everyone.push(People(_favoriteNumber, _name));
    }

    // Memory and Storage in Solidity:
    // These are like RAM and Hard Drive in a computer.
    // During execution, the contract can use any amout of memory. Stuff stored in memory is
    // completely wiped off after the execution of the function.
    // Storage is kind of permanent, as in one the contract executes, it will still be
    // stored, and the contract will have to access it every time it runs from the storage area.

    // State variables and Local Variables of structs, array are always stored in storage
    // by default. Function arguments are in memory.
    // Whenever a new instance of an array is created using the keyword ‘memory’, a
    // new copy of that variable is created. Changing the array value of the new instance
    // does not affect the original array.

    People public person = People({favoriteNumber: 2, name: "Brad"});

    // Functions

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // There are 4 types of visibilities in Solidity; public, internal, external, private

    // External: Only functions can be named external. These can be called from other
    // contracts and transactions, but can't be called internally. This makes them
    // cheaper than public to deploy.

    // Arguments of external fucntions are directly read from calldata, They don't need
    // to be copied into another variable in memory, whereas 'internal' requires this.

    // Public: State variables and fucntions can be named public. These can be accessed
    // by inside and outside. Solidity automatically creates a getter function for these

    // Internal: This is the default visibility of state variables. Even functions can be
    // named internal, and these functions can only be called within the same contract or
    // in a deriving contract, but not anything outside.

    // Private: This is the the most restricted visibility. Private variables and functions
    // can only be accessed within the contract, and nowhere else.

    // IMPORTANT: A transaction on a blockchain is a blockchain-state-changing function call

    // A 'view' function in Solidity is a tag added to a function to make sure that the
    // state of the variable being accessed is not changed

    // In Solidity, all getter functions are view functions, so when a function or variable
    // is declared as public, there are getter functions created automatically, and hence
    // there is a view attribute to public functions. Hence there is a orange 'store' as well
    // as a blue 'myFavoriteNumber' switch to view the number stored. and these 'blue'
    // functions in the Remix IDE after deploying are the ones which don't change the State
    // of the blockchain.
    // If there is a private private function, it won't create view functions by default
    // so we'll have to create one separately.

    // pure functions are the ones which only do some math
    function twice(uint256 myFavoriteNumber) public pure {
        myFavoriteNumber * 2;
    }
}
