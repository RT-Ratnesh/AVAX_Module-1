//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Sports_Event {
    uint public Max_Players;
    uint public Players_Count;
    address public Organizer;
    bool public Event;

    mapping (address => bool) public Registered_Players;

    constructor (uint _Max_Players) {
        Organizer = msg.sender;
        Max_Players = _Max_Players;
        Players_Count = 0;
        Event = true;
    }

    modifier onlyOrganizer() {
        require (msg.sender == Organizer, "Action is performed only by Organizer.");
        _;
    }

    modifier Open_Event() {
        require (Event, "Registration closed.");
        _;
    }

    event Player_Registered(address player);
    event Event_Closed();

    function register() public Open_Event {
        require (!Registered_Players[msg.sender], "Player is registered already.");
        require (Players_Count < Max_Players, "Limit Reached.");

        Registered_Players[msg.sender] = true;
        Players_Count++;

        assert (Players_Count <= Max_Players);

        emit Player_Registered(msg.sender);
    }

    function Close_Event() public onlyOrganizer {
        Event = false;
        emit Event_Closed();
    }

    function Urgent_Withdrawal(address player) public onlyOrganizer {
        if (!Registered_Players[player]){
            revert ("Player not Registered.");
        }

        Registered_Players[player] = false;
        Players_Count--;
    }

    function Player_Status(address player) public view returns (bool) {
        return Registered_Players[player];
    }
}
