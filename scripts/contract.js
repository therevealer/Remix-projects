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
        let accounts = await web3.eth.getAccounts();
        let sendCall = await contract.methods.setMyUint(345).send({from: accounts[0]});

        console.log(sendCall);
        console.log(await contract.methods.myUint().call());
        console.log(accounts)

        //I don't know what happened here but it is working!
}

contractInstance()