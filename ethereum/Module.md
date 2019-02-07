Connects to Ethereum from Ballerina.

# Ballerina Ethereum Connector

The Ethereum connector allows you to access the Ethereum JSON RPC API through Ballerina. 

## Compatibility

|                          |    Version     |
|:------------------:      |:--------------:|
| Ballerina Language       |   0.990.3      |
| JSON-RPC API Version     |   v2.0         |

### Starting Geth Client

1. Download the Geth client from [https://geth.ethereum.org/downloads/](https://geth.ethereum.org/downloads/).

2. Install the Geth Client. For more information, see [https://ethereum.github.io/go-ethereum/install/](https://ethereum.github.io/go-ethereum/install/).

3. Check whether the installation is complete or not by starting the HTTP JSON-RPC. To do this, run the `geth` command in your command line.

### Enabling JSON RPC Server

1. Create a folder for chain data. Let's call that folder `<chaindata>`.

2. Let’s create a private network by running the following command. Here, change the `<chaindata>` value to your actual folder path.
    ````
    geth --identity "testServer" --rpc --rpcport "8080" --rpccorsdomain "*" --datadir "<chaindata>/TestChain" --port "30304" --nodiscover --rpcapi "db,eth,net,web3,admin,shh" --networkid 1999 console --shh`
    ````
3. To create the new account, use the following command in the Geth JavaScript console.
    ```
    personal.newAccount()
    ```

4. To start the mine, use the following command in the Geth JavaScript console.
    ```
    miner.start()
    ```

## Sample

The Ethereum connector can be instantiated using the JSON-RPC server URL, version and networkId in the Ethereum client config.

* First, obtain the JSON-RPC server URL, version and networkId from your created network.

* import the `wso2/ethereum` module into the Ballerina project.

    ```ballerina
    import wso2/ethereum;
    ```       

* Enter the above obtained values in the Ethereum client config:

    ```ballerina
    ethereum:EthereumConfiguration ethereumConfig = {
        jsonRpcEndpoint: "<JSON_RPC_url>",
        jsonRpcVersion: "<JSON_RPC_version>",
        networkId: "<network_id>"
    };
        
    ethereum:Client ethereumClient = new(ethereumConfig);

    ```

The `getWeb3ClientVersion` function used to get the current client version.

if the request was successful, the response from `getWeb3ClientVersion` is a current client version. if the request was unsuccessful, the response is an Error. 

```ballerina
//getWeb3ClientVersion.
var response = ethereumClient->web3ClientVersion();
if (response is string) {
    string value = response.result;
    io:println("The web3 client version: " + value);
} else {
    io:println(response);
}
```

The `getWeb3Sha3` function used to convert data into a SHA3 hash.

The `data` represents the data to convert into a SHA3 hash. if the request was successful, the response from `getWeb3Sha3` is a SHA3 hash data . if the request was unsuccessful, the response is an Error. 

```ballerina
//getWeb3Sha3.
var response = ethereumClient->web3Sha3(testData);
if (response is string) {
    string value = response;
    io:println("The data in the SHA3-256: " + value);
} else {
    io:println(response);
}
```

The `getNetVersion` function used to get the current network id.

if the request was successful, the response from `getNetVersion` is a current network id. if the request was unsuccessful, the response is an Error. 

```ballerina
//getNetVersion.
var response = ethereumClient->netVersion();
if (response is string) {
    string value = response;
    io:println("The current network id: " + value);
} else {
    io:println(response);
}
```

## Example

```ballerina
import ballerina/io;
import wso2/ethereum;
import ballerina/config;

ethereum:EthereumConfiguration ethereumConfig = {
    jsonRpcEndpoint: "<JSON_RPC_url>",
    jsonRpcVersion: "<JSON_RPC_version>",
    networkId: "<network_id>"
};

public function main() {
    ethereum:Client ethereumClient = new(ethereumConfig);

    string data = "<data to convert into a SHA3 hash>";
    string block = "<block number>";
    string position = "<position in the storage>";
    string blockHash = "<hash of a block>";
    string message = "<message to sign>";
    string transactionOptionsData ="<transaction data>";
    string transactionCallObjectTovalue = "<transaction call object>";
    string transactionObjectStatus = "<transaction objects status>";
    string nonce = "<nonce>";
    string powHash = "<powHash>";
    string mixDigest = "<mixDigest>";
    string address ;
    string filterId;

    io:println("---------------------Calling web3ClientVersion()----------------------");
        var response = ethereumClient->web3ClientVersion();
        if (response is string) {
            string value = response;
            io:println("The web3 client version: " + value);
        } else {
            io:println(response);
        }
    
        string testData = "0x68656c6c6f20776f726c64";
        io:println("------------------------Calling web3Sha3()----------------------------");
        response = ethereumClient->web3Sha3(testData);
        if (response is string) {
            string value = response;
            io:println("The data in the SHA3-256: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling netVersion()----------------------------");
        response = ethereumClient->netVersion();
        if (response is string) {
            string value = response;
            io:println("The current network id: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling netPeerCount()--------------------------");
        response = ethereumClient->netPeerCount();
        if (response is string) {
            string value = response;
            io:println("The number of peers currently connected to the client: " + value);
        } else {
            io:println(response);
        }
    
        io:println("--------------------Calling netListening()--------------------------");
        response = ethereumClient->netListening();
        if (response is boolean) {
            boolean value = response;
            io:println("The status for client is actively listening for network connections: " + value);
        } else {
            io:println(response);
        }
    
        io:println("--------------------Calling ethProtocolVersion()----------------------");
        response = ethereumClient->ethProtocolVersion();
        if (response is string) {
            string value = response;
            io:println("The current ethereum protocol version: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-------------------------Calling ethSyncing()------------------------");
        response = ethereumClient->ethSyncing();
        if (response is string) {
            string value = response;
            io:println("The sync status of an object with data: " + value);
        } else {
            io:println(response);
        }
    
        io:println("----------------------Calling ethCoinbase()--------------------------");
        response = ethereumClient->ethCoinbase();
        if (response is string) {
            string value = response;
            io:println("The client coinbase address: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethMining()------------------------");
        response = ethereumClient->ethMining();
        if (response is string) {
            string value = response;
            io:println("The status for client is actively mining new blocks: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethHashrate()------------------------");
        response = ethereumClient->ethHashrate();
        if (response is string) {
            string value = response;
            io:println("The number of hashes per second that the node is mining with: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethGasPrice()-------------------------");
        response = ethereumClient->ethGasPrice();
        if (response is string) {
            string value = response;
            io:println("The current price per gas in wei: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethAccounts()-------------------------");
        response = ethereumClient->ethAccounts();
        if (response is string) {
            string value = response;
            address = untaint value;
            io:println("Addresse owned by client: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethBlockNumber()---------------------");
        response = ethereumClient->ethBlockNumber();
        if (response is string) {
            string value = response;
            io:println("The number of most recent block: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethGetBalance()-----------------------");
        response = ethereumClient->ethGetBalance(address,testblock);
        if (response is string) {
            string value = response;
            address = untaint address;
            io:println("The balance of the account of given address: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethGetStorageAt()---------------------");
        response = ethereumClient->ethGetStorageAt(address, testposition, testblock);
        if (response is string) {
            string value = response;
            io:println("The value from a storage position at a given address: " + value);
        } else {
            io:println(response);
        }
    
        io:println("--------------------Calling ethGetTransactionCount()-----------------");
        response = ethereumClient->ethGetTransactionCount(address, testblock);
        if (response is string) {
            string value = response;
            io:println("The number of transactions send from this address: " + value);
        } else {
            io:println(response);
        }
    
        io:println("--------------Calling ethGetBlockTransactionCountByHash()-------------");
        response = ethereumClient->ethGetBlockTransactionCountByHash(testblockHash);
        if (response is string) {
            string value = response;
            io:println("The number of transactions in this block: " + value);
        } else {
            io:println(response);
        }
    
        io:println("------------Calling ethGetBlockTransactionCountByNumber()------------");
        response = ethereumClient->ethGetBlockTransactionCountByNumber(testblock);
        if (response is string) {
            string value = response;
            io:println("The number of transactions in this block: " + value);
        } else {
            io:println(response);
        }
    
        io:println("----------------Calling ethGetUncleCountByBlockHash()----------------");
        response = ethereumClient->ethGetUncleCountByBlockHash(testblockHash);
        if (response is string) {
            string value = response;
            io:println("The number of uncles in this block: " + value);
        } else {
            io:println(response);
        }
    
        io:println("---------------Calling ethGetUncleCountByBlockNumber()---------------");
        response = ethereumClient->ethGetUncleCountByBlockNumber(testblock);
        if (response is string) {
            string value = response;
            io:println("The number of uncles in this block: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethGetCode()-------------------------");
        response = ethereumClient->ethGetCode(address, testblock);
        if (response is string) {
            string value = response;
            io:println("The code from the given address: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethSign()---------------------------");
        response = ethereumClient->ethSign(address, testmessage);
        if (response is string) {
            string value = response;
            io:println("Signature: " + value);
        } else {
            io:println(response);
        }
    
        io:println("------------------Calling ethSendTransaction()---------------------");
        json testTransactionOptions = {"from": address , "data": testTransactionOptionsData };
        response = ethereumClient->ethSendTransaction(testTransactionOptions);
        if (response is string) {
            string value = response;
            io:println("The transaction hash: " + value);
        } else {
            io:println(response);
        }
    
        io:println("----------------Calling ethSendRawTransaction()-------------------");
        response = ethereumClient->ethSendRawTransaction(testTransactionOptionsData);
        if (response is string) {
            string value = response;
            io:println("The transaction hash: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethCall()---------------------------");
        json testTransactionCallObject = {"to": testTransactionCallObjectTovalue };
        response = ethereumClient->ethCall(testTransactionCallObject, testblock);
        if (response is string) {
            string value = response;
            io:println("The value of executed contract: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------------Calling ethEstimateGas()-------------------");
        response = ethereumClient->ethEstimateGas({});
        if (response is string) {
            string value = response;
            io:println("The amount of gas used: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------Calling ethGetBlockByHash()-------------------");
        response = ethereumClient->ethGetBlockByHash(testblockHash, testtransactionObjectStatus);
        if (response is string) {
            string value = response;
            io:println("The block object: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------Calling ethGetBlockByNumber()----------------");
        response = ethereumClient->ethGetBlockByNumber(testblock, testtransactionObjectStatus);
        if (response is string) {
            string value = response;
            io:println("The information about a block by hash: " + value);
        } else {
            io:println(response);
        }
    
        io:println("---------------Calling ethGetTransactionByHash()----------------");
        response = ethereumClient->ethGetTransactionByHash(testblockHash);
        if (response is string) {
            string value = response;
            io:println("The information about a transaction requested by transaction hash: " + value);
        } else {
            io:println(response);
        }
    
        io:println("--------Calling ethGetTransactionByBlockHashAndIndex()----------");
        response = ethereumClient->ethGetTransactionByBlockHashAndIndex(testblockHash, testposition);
        if (response is string) {
            string value = response;
            io:println("The information about a transaction by block hash and transaction index position: " + value);
        } else {
            io:println(response);
        }
    
        io:println("--------Calling ethGetTransactionByBlockNumberAndIndex()--------");
        response = ethereumClient->ethGetTransactionByBlockNumberAndIndex(testblock, testposition);
        if (response is string) {
            string value = response;
            io:println("The information about a transaction by block number and transaction index position: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-------------Calling ethGetTransactionReceipt()-----------------");
        response = ethereumClient->ethGetTransactionReceipt(testblockHash);
        if (response is string) {
            string value = response;
            io:println("The receipt of a transaction by transaction hash: " + value);
        } else {
            io:println(response);
        }
    
        io:println("----------Calling ethGetUncleByBlockHashAndIndex()--------------");
        response = ethereumClient->ethGetUncleByBlockHashAndIndex(testblockHash, testposition);
        if (response is string) {
            string value = response;
            io:println("The information about a uncle of a block by hash and uncle index position: " + value);
        } else {
            io:println(response);
        }
    
        io:println("----------Calling ethGetUncleByBlockNumberAndIndex()------------");
        response = ethereumClient->ethGetUncleByBlockNumberAndIndex(testblock, testposition);
        if (response is string) {
            string value = response;
            io:println("The information about a uncle of a block by number and uncle index position: " + value);
        } else {
            io:println(response);
        }
    
        io:println("--------------Calling ethNewFilter()---------------------------");
        response = ethereumClient->ethNewFilter({});
        if (response is string) {
            string value = response;
            testFilterID = untaint value;
            io:println("A filter id: " + value);
        } else {
            io:println(response);
        }
    
        io:println("------------------Calling ethNewBlockFilter()-----------------");
        response = ethereumClient->ethNewBlockFilter();
        if (response is string) {
            string value = response;
            io:println("A filter id:" + value);
        } else {
            io:println(response);
        }
    
        io:println("---------Calling ethNewPendingTransactionFilter()------------");
        response = ethereumClient->ethNewPendingTransactionFilter();
        if (response is string) {
            string value = response;
            io:println("A filter id: " + value);
        } else {
            io:println(response);
        }
    
        io:println("----------Calling ethGetFilterLogs()------------------------");
        response = ethereumClient->ethGetFilterLogs(testFilterID);
        if (response is string) {
            string value = response;
            io:println("An array of all logs matching filter with given id: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------Calling ethGetFilterChanges()--------------------");
        response = ethereumClient->ethGetFilterChanges(testFilterID);
        if (response is string) {
            string value = response;
            io:println("Array of log objects: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-------------Calling ethUninstallFilter()-------------------");
        response = ethereumClient->ethUninstallFilter(testFilterID);
        if (response is string) {
            string value = response;
            io:println("The status of uninstall the filter : " + value);
        } else {
            io:println(response);
        }
    
        io:println("--------------------Calling ethGetLogs()--------------------");
        response = ethereumClient->ethGetLogs({});
        if (response is string) {
            string value = response;
            io:println("An array of all logs matching a given filter object: " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------Calling ethGetWork()-----------------------");
        response = ethereumClient->ethGetWork();
        if (response is string) {
            string value = response;
            io:println("The hash of the current block, the seedHash, and the boundary condition to be met (\"target\"):
                " + value);
        } else {
            io:println(response);
        }
    
        io:println("-----------------Calling ethSubmitWork()--------------------");
        response = ethereumClient->ethSubmitWork(testnonce, testpowHash, testmixDigest);
        if (response is string) {
            string value = response;
            io:println("The valid status for provided solution: " + value);
        } else {
            io:println(response);
        }
 }
```
