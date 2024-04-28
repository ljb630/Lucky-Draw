### Project - 1

### LuckyDraw Smart Contract

This Ethereum smart contract, designed for the Solidity ^0.8.19 compiler, facilitates a simple yet secure Lucky Draw game. Users can participate by sending exactly 2 ether, and a designated manager has exclusive controls to manage the game.

#### Key Features:

- **Manager-Controlled**: Only the contract deployer (manager) has the authority to view the contract's balance and initiate winner selection.
- **Secure Participation**: Participants must send exactly 2 ether to enter the draw. This ensures uniform stakes among all participants.
- **Random Winner Selection**: The contract utilizes a pseudo-random number generation method that combines the hash of the most recent block with the contract’s address and the current number of participants to select a winner fairly.
- **Automatic Prize Distribution**: Upon winner selection, all the accumulated ether in the contract is transferred to the randomly selected winner.
- **Reset Mechanism**: After the winner is selected and the prize is distributed, the list of participants is cleared, resetting the game for new entries.

#### Functions:

1. **Constructor**: Sets the contract deployer as the manager.
2. **Receive Function**: Allows users to send 2 ether to participate. Each participant's address is stored in the contract.
3. **getBalance()**: View function for the manager to see the current balance of the contract.
4. **random()**: Internal function used by the manager to generate a pseudo-random index for selecting a winner.
5. **SelectWinner()**: Allows the manager to select a winner, transfer the contract's balance to them, and reset the participants list for a new round.

#### Usage:

Deploy the contract, ensure participants send 2 ether to join, and use the manager-exclusive functions to administer the Lucky Draw. This contract is ideal for transparent, verifiable lucky draws where the fairness of the winner selection can be openly audited due to the deterministic nature of the blockchain.
