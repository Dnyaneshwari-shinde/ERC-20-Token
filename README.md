# ERC20 using Hardhat
A basic implementation of the ERC20 token standard using the Hardhat development environment.

It generates an ERC20 Token which is deployed on the sepolia testnet: https://sepolia.etherscan.io/token/0x253ef5D024CB1A7c0898E7b0ED172Cdf9cC0D9F4

# Requirements For Initial Setup
- Install NodeJS
- Install Hardhat

# Setting Up
1. Clone/Download the Repository
2. Install Dependencies:
<pre> cd ERC-20 Token</pre>
<pre> npm install </pre>
3. Boot up local development blockchain
<pre> cd ERC-20 Token </pre>
<pre> npx hardhat node </pre>
4. Migrate Smart Contracts
<pre>npx hardhat run scripts/deploy.js --network localhost</pre>

6. Run Tests
$ npx hardhat help
$ npx hardhat test
$ GAS_REPORT=true npx hardhat test
$ npx hardhat node
$ npx hardhat run scripts/deploy.js