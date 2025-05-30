import { ethers } from "hardhat";
import * as dotenv from "dotenv";

dotenv.config();

async function main() {

  const CarbonEmissions = await ethers.getContractFactory("CarbonEmissions");
  const carbonEmissions = await CarbonEmissions.deploy();

  await carbonEmissions.deployed();

  console.log(`CarbonEmissions deployed to: ${carbonEmissions.address}`);
}

main().catch((error) => {
  console.error("Deployment failed:", error);
  process.exitCode = 1;
});
