# Testing Ballerina Ethereum Connector

The Ethereum connector allows you to access the Ethereum JSON RPC API through Ballerina. The Ethereum connector actions are invoked using a Ballerina main function. The following diagram illustrates how Ballerina connects to the JSON RPC-enabled server, which in turn integrates with the Ethereum network.

![Ballerina -Ethereum Connector Overview](../../BallerinaEthereumJSONRPC.png)

## Compatibility

| Ballerina Language Version             | JSON-RPC API Version           |
| ---------------------------------------| -------------------------------|
|  0.990.0                               |   v2.0                        |

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

### Running Samples

You can use the `tests.bal` file to test all the connector actions by following the below steps:

1. Navigate to module-ethereum and initialize the ballerina project.
    ```
    ballerina init
    ```

2. Obtain the following variable's value and add these value in the module-ethereum/ballerina.conf file.
    ```
    JSON_RPC_ENDPOINT = "The JSON RPC server URL"
    JSON_RPC_VERSION = "The JSON RPC version"
    NETWORK_ID = "The network id"
    POSITION = "The storage position"
    BLOCK_HASH = "The block hash"
    BLOCK = "The block parameter" 
    TO_VALUE_FOR_TRANSACTION_CALL_OBJECT_ = "The address the transaction is directed to"
    TRANSACTION_OBJECT_STATUS = "The transaction objects status"
    MESSAGE = "The message to sign"
    TRANSACTION_OPTION_DATA = "The signed transaction data"
    NONCE = "The nonce found"
    HEADER_POW_HASH = "The header's pow-hash"
    MIX_DIGEST = "The mix digest"
    ```

4. Run the following command to execute the tests.
    ```
    ballerina test ethereum --config ballerina.conf
    ```
