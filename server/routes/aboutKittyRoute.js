const express = require('express');
const router = express.Router();
const { ethers } = require('ethers');

router.get('/:address?', async (req, res) => {
  try {
    // Connect to Ethereum network using a public RPC endpoint
    const provider = new ethers.JsonRpcProvider('https://eth.public-rpc.com');
    
    // Replace with your smart contract address and ABI
    const contractAddress = "0x06012c8cf97BEaD5deAe237070F9587f8E7A266d";
    const contractABI = [
      "function name() view returns (string)",
      "function symbol() view returns (string)",
      "function balanceOf(address) view returns (uint256)",
      "function ownerOf(uint256) view returns (address)"
    ];

    // Create contract instance
    const contract = new ethers.Contract(contractAddress, contractABI, provider);

    // Example: Call a read method from your smart contract
    const ctxSymbol = await contract.symbol();
    const ctxName = await contract.name();
    let ctxBalance = '0';

    if (req.params.address) {
      ctxBalance = await contract.balanceOf(req.params.address);
      ctxBalance = ctxBalance.toString();
    }

    return res.json({ 
      message: '🐈 Smart contract data fetched successfully 🐈‍⬛', 
      data: {
        symbol: ctxSymbol,
        name: ctxName,
        balance: ctxBalance
      } 
    })

  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
});

module.exports = router;