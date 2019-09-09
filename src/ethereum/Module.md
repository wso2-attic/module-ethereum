Connects to Ethereum from Ballerina.

# Ballerina Ethereum Connector

The Ethereum connector allows you to access the Ethereum JSON RPC API through Ballerina. 

## Compatibility

|                          |    Version     |
|:------------------:      |:--------------:|
| Ballerina Language       |   1.0.0        |
| JSON-RPC API Version     |   v2.0         |

### Starting Geth Client

1. Download the Geth client from [https://geth.ethereum.org/downloads/](https://geth.ethereum.org/downloads/).

2. Install the Geth Client. For more information, see 
[https://ethereum.github.io/go-ethereum/install/](https://ethereum.github.io/go-ethereum/install/).

3. Check whether the installation is complete or not by starting the HTTP JSON-RPC. To do this, run the `geth` 
command in your command line.

### Enabling JSON RPC Server

1. Create a folder for chain data. Let's call that folder `<chaindata>`.

2. Let’s create a private network by running the following command. Here, change the `<chaindata>` value to your actual 
folder path.
    ````
    geth --identity "testServer" --rpc --rpcport "8080" --rpccorsdomain "*" --datadir "<chaindata>/TestChain" --port "30304" --nodiscover --rpcapi "db,eth,net,web3,admin,shh" --networkid 1999 console --shh
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

The `getWeb3ClientVersion()` remote function is used to get the current client version.

If the request was successful, the result from `getWeb3ClientVersion()` is the current client version. If the request was unsuccessful, the result is an `error`. 

```ballerina
var response = ethereumClient->getWeb3ClientVersion();
if (response is string) {
    io:println("Web3 Client Version: ", response);
} else {
    io:println("Error: ", response);
}
```

The `getWeb3Sha3()` remote function is used to convert data into an SHA3 hash.

The `data` variable represents the data to convert into an SHA3 hash. If the request was successful, the result from `getWeb3Sha3()` is SHA3 hash data. If the request was unsuccessful, the result will be an `error`. 

```ballerina
var response = ethereumClient->getWeb3Sha3(data);
if (response is string) {
    io:println("SHA3-256: ", response);
} else {
    io:println("Error: ", response);
}
```

The `getNetVersion()` remote function is used to get the current network ID.

If the request was successful, the result from `getNetVersion()` is the current network ID. If the request was unsuccessful, the result is an `error`. 

```ballerina
var response = ethereumClient->getNetVersion();
if (response is string) {
    io:println("The current network ID: ", response);
} else {
    io:println("Error: ", response);
}
```

## Example

```ballerina
import ballerina/io;
import wso2/ethereum;

ethereum:EthereumConfiguration ethereumConfig = {
    jsonRpcEndpoint: "<JSON_RPC_url>",
    jsonRpcVersion: "<JSON_RPC_version>",
    networkId: "<network_id>"
};

public function main() {
    ethereum:Client ethereumClient = new(ethereumConfig);

    io:println("---------------------Calling getWeb3ClientVersion()----------------------");
    var response = ethereumClient->getWeb3ClientVersion();
    if (response is string) {
        io:println("The Web3 Client Version: ", response);
    } else {
        io:println("Error: ", response);
    }

    string testData = "0x68656c6c6f20776f726c64";
    io:println("------------------------Calling getWeb3Sha3()----------------------------");
    response = ethereumClient->getWeb3Sha3(testData);
    if (response is string) {
        io:println("SHA3-256: ", response);
    } else {
        io:println("Error: ", response);
    }

    io:println("-----------------------Calling getNetVersion()----------------------------");
    response = ethereumClient->getNetVersion();
    if (response is string) {
        io:println("The current network ID: ", response);
    } else {
        io:println("Error: ", response);
    }
 }
```
