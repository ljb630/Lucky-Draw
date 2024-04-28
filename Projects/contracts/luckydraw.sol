// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract LuckyDraw {
    address public manager;
    address payable[] public Users;

    constructor()
    //Here we will be giving access to manager controll the contract
    {
        manager = msg.sender; //msg.sender is a global variable
    }

    receive()
        external
        payable
    // we can only use this recevie only once in contract
    {
        require(msg.value==2 ether, "You have to give Min 2 Ethe");
        Users.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint256) {
        require(msg.sender == manager, "Only manager can vie Balance");
        return address(this).balance;
    }

    // Function to generate a pseudo-random index to pick a winner
    function random() public   view returns (uint256) {
        require(msg.sender == manager, "Only manager can draw a winner");
        require(Users.length >=3, "Min 3 participants neeed to be available");

        // Combine current block number with the last blockhash used as a seed
        uint256 blockNumber = block.number - 1; // Using the last block for the hash
        bytes32 hashVal = keccak256(abi.encodePacked(blockhash(blockNumber),address(this),Users.length));
        return uint256(hashVal) % Users.length; // % this is called M percent this gives use the reminder of a value
    }

    function SelectWinner()public  {
        require(msg.sender==manager, "Only Manager can select the Winner");
        uint index = random();
        // Get Users address who got picked up randomly from index
        address payable winner = Users[index];
        // Send Eth to winner
        winner.transfer(getBalance());
        //Clear after selecting the Winner
        delete Users;

    }

}
