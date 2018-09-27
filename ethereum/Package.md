Connects to Ethereum from Ballerina.

# Ballerina Ethereum Connector

The Ethereum connector allows you to access the Ethereum JSON RPC API through Ballerina. The Ethereum connector actions are invoked using a Ballerina main function. The following diagram illustrates how Ballerina connects to the JSON RPC-enabled server, which in turn integrates with the Ethereum network.

![Ballerina -Ethereum Connector Overview](../BallerinaEthereumJSONRPC.png)

### Compatibility

|                                 |       Version                  |
|  :---------------------------:  |  :---------------------------: |
|  Ballerina Language             |   0.982.0                      |
|  JSON-RPC API Version           |   v2.0                        |

### Starting Geth Client

1. Download the Geth client from [https://geth.ethereum.org/downloads/](https://geth.ethereum.org/downloads/).

2. Install the Geth Client. [https://ethereum.github.io/go-ethereum/install/](https://ethereum.github.io/go-ethereum/install/).

3. Check whether the installation is complete or not from start the HTTP JSON-RPC by run the `geth` command in your command line .

### Enabling JSON RPC Server

1. Create a folder for chain data. Let's call that folder `<chaindata>`.

2. Run the following command and open the Geth JavaScript console. Here, change the `<chaindata>` value with your actual folder path.
    ````
    geth --identity "testServer" --rpc --rpcport "8080" --rpccorsdomain "*" --datadir "<chaindata>/TestChain" --port "30304" --nodiscover --rpcapi "db,eth,net,web3,admin,shh" --networkid 1999 console --shh`
    ````
3. To create the new account, use the following command in the Geth JavaScript console.
    ```
    personal.newAccount()
    ```

4. To start the miner, use the following command in the Geth JavaScript console.
    ```
    miner.start()
    ```

### Sample

import the `wso2/ethereum` package into the Ballerina project.
 ```ballerina
 import wso2/ethereum;
 ```       
 
**Run the Sample**

You can now enter the JSON-RPC server url, version and networkId in the HTTP client config:

```ballerina
endpoint ethereum:Client ethereumClient {
    jsonRpcEndpoint: "<JSON_RPC_url>",
    jsonRpcVersion: "<JSON_RPC_version>",
    networkId: "<network_id>"
};
```

The `getWeb3ClientVersion` function gets the current client version.

if the request was successful, the response from `getWeb3ClientVersion` is a current client version. if the request was unsuccessful, the response is an Error. 
The match operation can be used to handle the response if an error occurs.

```ballerina
//getWeb3ClientVersion.
var response = ethereumClient -> getWeb3ClientVersion();
match response {
    ethereum:Result result => {
        string value = result.result;
        io:println("The web3 client version: " + value);
    }
    ethereum:EthereumError e => io:println(e);
}
```

The `getWeb3Sha3` function converts data into a SHA3 hash.

The `data` represents the data to convert into a SHA3 hash. if the request was successful, the response from `getWeb3Sha3` is a SHA3 hash data . if the request was unsuccessful, the response is an Error. 
The match operation can be used to handle the response if an error occurs.

```ballerina
//getWeb3Sha3.
var response = ethereumClient -> getWeb3Sha3(data);
match response {
    ethereum:Result result => {
        string value = result.result;
        io:println("The data in the SHA3-256: " + value);
    }
    ethereum:EthereumError e => io:println(e);
}
```

The `getNetVersion` function gets current network id.

if the request was successful, the response from `getNetVersion` is a current network id. if the request was unsuccessful, the response is an Error. 
The match operation can be used to handle the response if an error occurs.

```ballerina
//getNetVersion.
var response = ethereumClient -> getNetVersion();
match response {
ethereum:Result result => {
    string value = result.result;
    io:println("The data in the SHA3-256: " + value);
    }
    ethereum:EthereumError e => io:println(e);
}
```

**Example**

```ballerina
import ballerina/io;
import wso2/ethereum;
import ballerina/config;

function main(string... args) {
    endpoint ethereum:Client ethereumClient {
        jsonRpcVersion: "<json_rpc_version>",
        networkId: "<network_id>",
        jsonRpcEndpoint: "<json_rpc_url>"
    };

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

    io:println("---------------------Calling getWeb3ClientVersion()----------------------");
    var response = ethereumClient -> getWeb3ClientVersion();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The web3 client version: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("------------------------Calling getWeb3Sha3()----------------------------");
    response = ethereumClient -> getWeb3Sha3(testData);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The data in the SHA3-256: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getNetVersion()----------------------------");
    response = ethereumClient -> getNetVersion();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The current network id: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getNetPeerCount()--------------------------");
    response = ethereumClient -> getNetPeerCount();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The number of peers currently connected to the client: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("--------------------Calling getNetListening()--------------------------");
    var ethResponse = ethereumClient -> getNetListening();
    match ethResponse {
        boolean result => {
            io:println("The status for client is actively listening for network connections: " + result);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("--------------------Calling getEthProtocolVersion()----------------------");
    response = ethereumClient -> getEthProtocolVersion();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The current ethereum protocol version: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-------------------------Calling getEthSyncing()------------------------");
    response = ethereumClient -> getEthSyncing();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The sync status of an object with data: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("----------------------Calling getEthCoinbase()--------------------------");
    response = ethereumClient -> getEthCoinbase();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The client coinbase address: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthMining()------------------------");
    ethResponse = ethereumClient -> getEthMining();
    match ethResponse {
        boolean result => {
            io:println("The status for client is actively mining new blocks: " + result);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthHashrate()------------------------");
    response = ethereumClient -> getEthHashrate();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The number of hashes per second that the node is mining with: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthGasPrice()-------------------------");
    response = ethereumClient -> getEthGasPrice();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The current price per gas in wei: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthAccounts()-------------------------");
    response = ethereumClient -> getEthAccounts();
    match response {
        ethereum:Result result => {
            string value = result.result;
            address = untaint value;
            io:println(address);
            io:println("Addresse owned by client: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthBlockNumber()---------------------");
    response = ethereumClient -> getEthBlockNumber();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The number of most recent block: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthBalance()-----------------------");
    response = ethereumClient -> getEthBalance(address, block);
    match response {
        ethereum:Result result => {
            string value = result.result;
            address = untaint address;
            io:println("The balance of the account of given address: " + value);
       }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthStorageAt()---------------------");
    response = ethereumClient -> getEthStorageAt(address, position, block);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The value from a storage position at a given address: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("--------------------Calling getEthTransactionCount()-----------------");
    response = ethereumClient -> getEthTransactionCount(address, block);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The number of transactions send from this address: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("--------------Calling getEthBlockTransactionCountByHash()-------------");
    response = ethereumClient -> getEthBlockTransactionCountByHash(blockHash);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The number of transactions in this block: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("------------Calling getEthBlockTransactionCountByNumber()------------");
    response = ethereumClient -> getEthBlockTransactionCountByNumber(block);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The number of transactions in this block: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("----------------Calling getEthUncleCountByBlockHash()----------------");
    response = ethereumClient -> getEthUncleCountByBlockHash(blockHash);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The number of uncles in this block: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("---------------Calling getEthUncleCountByBlockNumber()---------------");
    response = ethereumClient -> getEthUncleCountByBlockNumber(block);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The number of uncles in this block: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthCode()-------------------------");
    response = ethereumClient -> getEthCode(address, block);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The code from the given address: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthSign()---------------------------");
    response = ethereumClient -> getEthSign(address, message);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("Signature: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("------------------Calling ethTransaction()---------------------");
    json testTransactionOptions = {"from": address , "data": transactionOptionsData };
    response = ethereumClient -> sendEthTransaction(testTransactionOptions);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The transaction hash: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("----------------Calling sendEthRawTransaction()-------------------");
    response = ethereumClient -> sendEthRawTransaction(transactionOptionsData);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The transaction hash: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthCall()---------------------------");
    json testTransactionCallObject = {"to": transactionCallObjectTovalue };
    response = ethereumClient -> getEthCall(testTransactionCallObject, block);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The value of executed contract: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------------Calling getEthEstimateGas()-------------------");
    response = ethereumClient -> getEthEstimateGas({});
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The amount of gas used: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------Calling getEthBlockByHash()-------------------");
    response = ethereumClient -> getEthBlockByHash(blockHash, <boolean> transactionObjectStatus);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The block object: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------Calling getEthBlockByNumber()----------------");
    response = ethereumClient -> getEthBlockByNumber(block, <boolean> transactionObjectStatus);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The information about a block by hash: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("---------------Calling getEthTransactionByHash()----------------");
    response = ethereumClient -> getEthTransactionByHash(blockHash);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The information about a transaction requested by transaction hash: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("--------Calling getEthTransactionByBlockHashAndIndex()----------");
    response = ethereumClient -> getEthTransactionByBlockHashAndIndex(blockHash, position);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The information about a transaction by block hash and transaction index position: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("--------Calling getEthTransactionByBlockNumberAndIndex()--------");
    response = ethereumClient -> getEthTransactionByBlockNumberAndIndex(block, position);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The information about a transaction by block number and transaction index position: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-------------Calling getEthTransactionReceipt()-----------------");
    response = ethereumClient -> getEthTransactionReceipt(blockHash);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The receipt of a transaction by transaction hash: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("----------Calling getEthUncleByBlockHashAndIndex()--------------");
    response = ethereumClient -> getEthUncleByBlockHashAndIndex(blockHash, position);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The information about a uncle of a block by hash and uncle index position: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("----------Calling getEthUncleByBlockNumberAndIndex()------------");
    response = ethereumClient -> getEthUncleByBlockNumberAndIndex(block, position);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The information about a uncle of a block by number and uncle index position: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("--------------Calling ethNewFilter()---------------------------");
    response = ethereumClient -> ethNewFilter({});
    match response {
        ethereum:Result result => {
            string value = result.result;
            filterId = untaint value;
            io:println("A filter id: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("------------------Calling ethNewBlockFilter()-----------------");
    response = ethereumClient -> ethNewBlockFilter();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("A filter id:" + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("---------Calling ethNewPendingTransactionFilter()------------");
    response = ethereumClient -> ethNewPendingTransactionFilter();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("A filter id: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("----------Calling getEthFilterLogs()------------------------");
    response = ethereumClient -> getEthFilterLogs(filterId);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("An array of all logs matching filter with given id: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------Calling getEthFilterChanges()--------------------");
    response = ethereumClient -> getEthFilterChanges(filterId);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("Array of log objects: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-------------Calling uninstallEthFilter()-------------------");
    response = ethereumClient -> uninstallEthFilter(filterId);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The status of uninstall the filter: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("--------------------Calling getEthLogs()--------------------");
    response = ethereumClient -> getEthLogs({});
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("An array of all logs matching a given filter object: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------Calling getEthWork()-----------------------");
    response = ethereumClient -> getEthWork();
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The hash of the current block, the seedHash, and the boundary condition to be met (\"target\"):
            " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

    io:println("-----------------Calling submitEthWork()--------------------");
    response = ethereumClient -> submitEthWork(nonce, powHash, mixDigest);
    match response {
        ethereum:Result result => {
            string value = result.result;
            io:println("The valid status for provided solution: " + value);
        }
        ethereum:EthereumError e => io:println(e);
    }

```
