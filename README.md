# connector-ethereum

The Ethereum connector allows you to access the Ethereum JSON RPC API through ballerina. And the Ethereum connector actions are being invoked with a ballerina main function. The following section provide you the details on how to use Ballerina Ethereum connector.

## Getting started

1. Download the Ballerina tool distribution by navigating https://ballerinalang.org/downloads/
2. Extract ballerina-ethereum-0.95.0.zip and copy ballerina-ethereum-0.95.0.jar into the `<ballerina-tools>/bre/lib` folder.

##### Prerequisites
1. Enable JSON RPC API in your Ethereum network by visiting [https://github.com/ethereum/wiki/wiki/JSON-RPC/](https://github.com/ethereum/wiki/wiki/JSON-RPC#javascript-api).
2. Identify the URI for the JSON RPC server. 
Default JSON-RPC endpoints:

| Client | URL |
|-------|:------------:|
| C++ |  http://localhost:8545 | 
| Go |http://localhost:8545 | 
| Py | http://localhost:4000 | 
| Parity | http://localhost:8545 | 

## Working with Ethereum connector actions

### JSON-RPC methods

* [web3_clientVersion](https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_clientversion)
* [web3_sha3](https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_sha3)
* [net_version](https://github.com/ethereum/wiki/wiki/JSON-RPC#net_version)
* [net_peerCount](https://github.com/ethereum/wiki/wiki/JSON-RPC#net_peercount)
* [net_listening](https://github.com/ethereum/wiki/wiki/JSON-RPC#net_listening)
* [eth_protocolVersion](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_protocolversion)
* [eth_syncing](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_syncing)
* [eth_coinbase](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_coinbase)
* [eth_mining](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_mining)
* [eth_hashrate](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_hashrate)
* [eth_gasPrice](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gasprice)
* [eth_accounts](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_accounts)
* [eth_blockNumber](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_blocknumber)
* [eth_getBalance](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getbalance)
* [eth_getStorageAt](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getstorageat)
* [eth_getTransactionCount](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactioncount)
* [eth_getBlockTransactionCountByHash](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbyhash)
* [eth_getBlockTransactionCountByNumber](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbynumber)
* [eth_getUncleCountByBlockHash](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblockhash)
* [eth_getUncleCountByBlockNumber](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblocknumber)
* [eth_getCode](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcode)
* [eth_sign](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sign)
* [eth_sendTransaction](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendtransaction)
* [eth_sendRawTransaction](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendrawtransaction)
* [eth_call](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_call)
* [eth_estimateGas](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_estimategas)
* [eth_getBlockByHash](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbyhash)
* [eth_getBlockByNumber](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbynumber)
* [eth_getTransactionByHash](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyhash)
* [eth_getTransactionByBlockHashAndIndex](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblockhashandindex)
* [eth_getTransactionByBlockNumberAndIndex](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblocknumberandindex)
* [eth_getTransactionReceipt](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionreceipt)
* [eth_getUncleByBlockHashAndIndex](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblockhashandindex)
* [eth_getUncleByBlockNumberAndIndex](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblocknumberandindex)
* [eth_getCompilers](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcompilers)
* [eth_compileLLL](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilelll)
* [eth_compileSolidity](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilesolidity)
* [eth_compileSerpent](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compileserpent)
* [eth_newFilter](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newfilter)
* [eth_newBlockFilter](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newblockfilter)
* [eth_newPendingTransactionFilter](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newpendingtransactionfilter)
* [eth_uninstallFilter](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_uninstallfilter)
* [eth_getFilterChanges](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterchanges)
* [eth_getFilterLogs](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterlogs)
* [eth_getLogs](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getlogs)
* [eth_getWork](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getwork)
* [eth_submitWork](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submitwork)
* [eth_submitHashrate](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submithashrate)
* [shh_post](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_post)
* [shh_version](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_version)
* [shh_newIdentity](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newidentity)
* [shh_hasIdentity](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_hasidentity)
* [shh_newGroup](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newgroup)
* [shh_addToGroup](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_addtogroup)
* [shh_newFilter](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newfilter)
* [shh_uninstallFilter](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_uninstallfilter)
* [shh_getFilterChanges](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_getfilterchanges)
* [shh_getMessages](https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_getmessages)

***

### Generic Function

The Ethereum connector supports unimplemented RPC API functions via `remoteProcedureCall()`. 
```java
  response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, "method_name", [params]);
  if (e == null) {
    JSONResponse = response.getJsonPayload();
    println(JSONResponse.result.toString());
  } else {
    println(e);
  }
  ```
## Running samples

- Copy `connector-ethereum/component/samples/ethereum/samples.bal` file and paste it into `<ballerina-tools>/bin` folder.
- Run the following commands to execute the sample.

`bin$ ./ballerina run samples.bal <URI> <JSONRPCVersion> <NetworkID>`
- eg:
`bin$ ./ballerina run samples.bal http://localhost:8080 2.0 1999`

        



