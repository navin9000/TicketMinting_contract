//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//contract for ticket minting for to join some event
// and tickets only available for limited time 
//here considering time in days


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract TicketMint is ERC721{
    address payable owner;
    uint public tickets;
    uint public ticketPrice;
    uint public count;
    uint startTime;

    //creating modifier onlyFans
    modifier onlyFans{
        require(block.timestamp < startTime,"time completed to mint the ticket");
        require(msg.sender != owner,"u cant mint tickets");
        require(msg.sender != address(0),"cant be minted to zero addresses");
        require(count < tickets,"tickets completed");
        require(msg.value == 50 wei,"ticket price is 50 wei");
        _;
    }

    constructor(uint noOfTickets,uint _noOfDays) ERC721("Ticket","TC"){
        owner=payable(msg.sender);
        tickets = noOfTickets;
        ticketPrice=50 wei;
        startTime = block.timestamp +(((_noOfDays*24)*60)*60);
    }

    function Buy()public payable onlyFans{
        _safeMint(msg.sender,count,"");
        count+=1;
    }

}