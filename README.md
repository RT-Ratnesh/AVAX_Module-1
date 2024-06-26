# Sports_Event Smart Contract 

This Solidity smart contract named 'Sports_Event' that allows an organizer to manage player registrations for a sports event. It includes functionalities to register players, close the event for further registrations, and unregister players in case of emergencies. The contract ensures that only the organizer can perform certain critical actions such as closing the event or unregistering players.

## Description

The 'Sports_Event' smart contract is designed to manage player registrations for a sports event using Ethereum blockchain technology. This contract allows an organizer to set the maximum number of participants, handle player registrations, close the event to prevent further registrations, and manage emergency player unregistrations. The contract ensures security and transparency by leveraging the immutability and decentralization features of blockchain technology.

### Features 

1. **Player Registration:** Players can register for the event if it is still open and the maximum player limit has not been reached. Each registration is recorded on the blockchain for transparency. Players are prevented from registering multiple times through the use of the 'Registered_Players' mapping and the register function, which checks if a player is already registered and if the maximum player limit has been reached before allowing a new registration.
2. **Event Closure:** The organizer has the authority to close the event, preventing any new registrations. This is useful once the player limit is reached or the registration period ends. The 'Close_Event' function allows the organizer to set the Event status to false, effectively closing the event.
3. **Emergency Unregistration:** In case of emergencies, the organizer can unregister a player. This feature ensures flexibility in managing unforeseen circumstances. The 'Urgent_Withdrawal' function allows the organizer to unregister a player, reducing the player count and updating the 'Registered_Players' mapping accordingly. This function uses the 'revert' statement to handle the case where a player is not registered.
4. **Player Status Check:** Anyone can verify if a player is registered for the event, providing transparency and trust in the registration process. The 'Player_Status' function returns the registration status of a given player.

### Key Elements

1. **Max Players ('Max_Players'):** Specifies the maximum number of players that can register for the event.
2. **Player Count ('Players_Count'):** Keeps track of the current number of registered players.
3. **Organizer ('Organizer'):** The address of the contract creator who acts as the event organizer and has special permissions.
4. **Event Status ('Event'):** A boolean that indicates whether the event is open for registrations ('true') or closed ('false').

The contract also makes use of Solidity's error handling mechanisms with 'require()', 'assert()', and 'revert()' statements to ensure the correct and secure functioning of the contract.

## Getting Started

### Executing Program

#### Deployment 
Deploy the 'Sports_Event' contract by providing the maximum number of players allowed.
```
constructor (uint _Max_Players)
```
#### Player Registration
Players can register for the event by calling the 'register' function.
```
function register() public
```
#### Close Event
The organizer can close the event for further registrations by calling the 'Close_Event' function.
```
function Close_Event() public onlyOrganizer
```
#### Emergency Withdrawal
The organizer can unregister a player in case of emergencies by calling the 'Urgent_Withdrawal' function.
```
function Urgent_Withdrawal(address player) public onlyOrganizer
```
#### Check Player Status
Anyone can check if a player is registered for the event by calling the 'Player_Status' function.
```
function Player_Status(address player) public view returns (bool)
```
### Example

1. **Deploy the Contract:** Deploy the contract by specifying the maximum number of players allowed.
3. **Register a Player:** Call the 'register' function from the player's address.
4. **Close the Event:** Call the 'Close_Event' function from the organizer's address to close the event.
5. **Emergency Unregistration:** Call the 'Urgent_Withdrawal' function from the organizer's address to unregister a player.
6. **Check Player Status:** Call the 'Player_Status' function to check if a player is registered.


## Author
Ratnesh Tiwari
(ratneshtiwari389@gmail.com)


## License
This project is licensed under the MIT License.
