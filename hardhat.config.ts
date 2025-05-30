
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
        url: "https://sepolia.infura.io/v3/30d9e0d7c5364666a032087db2b0b73a",
        accounts: [process.env.PRIVATE_KEY || ""],
    },
  },
  etherscan: {
    apiKey: {
      sepolia: "1M4RFVNQ2YQX96QNA4NWBZVZ2BQ1PZJWT6"
    },
  },
};

export default config;
