# ERC20 using Hardhat
A basic implementation of the ERC20 token standard using the Hardhat development environment.

It generates an ERC20 Token which is deployed on the sepolia testnet: https://sepolia.etherscan.io/token/0x253ef5D024CB1A7c0898E7b0ED172Cdf9cC0D9F4

Requirements For Initial Setup
Install NodeJS
Install Hardhat
Setting Up
1. Clone/Download the Repository
2. Install Dependencies:
$ cd ERC-20 Token
$ npm install
3. Boot up local development blockchain
$ cd ERC-20 Token
$ npx hardhat node
4. Migrate Smart Contracts
npx hardhat run scripts/deploy.js --network localhost

6. Run Tests
$ npx hardhat test