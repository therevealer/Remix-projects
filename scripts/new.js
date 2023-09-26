async function getAccountsAndLog(){
    let accounts = await web3.eth.getAccounts();

    console.log('These are the avialable accounts: ', accounts)
}

getAccountsAndLog()