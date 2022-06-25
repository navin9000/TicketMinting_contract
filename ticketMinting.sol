//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//contract for ticket minting for to join some event

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract TicketMint is ERC721{
    address payable owner;
    uint public tickets;
    uint public ticketPrice;
    mapping(address => uint) private _balances;
    uint public count;

    constructor(uint noOfTickets) ERC721("Ticket","TC"){
        owner=payable(msg.sender);
        tickets = noOfTickets;
        ticketPrice=50 wei;
    }

    function Buy(address to)public payable{
        require(msg.sender != owner,"u cant mint tickets");
        require(to != address(0),"cant be minted to zero addresses");
        require(count < tickets,"tickets completed");
        require(msg.value == 50 wei,"ticket price is 50 wei");
        _safeMint(to,count,"");
        count+=1;
    }

}