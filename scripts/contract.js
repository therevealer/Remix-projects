async function contractInstance(){
    const address = "0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3"
    const abi = [
        {
				"inputs": [],
				"name": "myUint",
				"outputs": [
					{
						"internalType": "uint256",
						"name": "",
						"type": "uint256"
					}
				],
				"stateMutability": "view",
				"type": "function"
			},
			{
				"inputs": [
					{
						"internalType": "uint256",
						"name": "newUint",
						"type": "uint256"
					}
				],
				"name": "setMyUint",
				"outputs": [],
				"stateMutability": "nonpayable",
				"type": "function"
			}
        ];

        let contract = new web3.eth.Contract(abi, address);
}