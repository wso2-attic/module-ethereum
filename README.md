# Ballerina Ethereum Connector

*Ethereum is a decentralized platform for applications that run exactly as programmed without any chance of fraud, censorship or third-party interference* (https://www.ethereum.org/).

The Ethereum connector allows you to access the Ethereum JSON RPC API through ballerina. And the Ethereum connector actions are being invoked with a ballerina main function. The following section provide you the details on how to use Ballerina Ethereum connector.

## Outline
1) [Getting started](#getting-started)
2) [Running Samples](#running-samples)
3) [Quick Testing](#quick-testing)
4) [Working with Ethereum connector actions](#working-with-ethereum-connector-actions)

## Getting started

1. Download the Ballerina tool distribution by navigating https://ballerinalang.org/downloads/
2. Extract ballerina-ethereum-0.95.0.zip and copy ballerina-ethereum-0.95.0.jar into the `<ballerina-tools>/bre/lib` folder.

##### Prerequisites
1. Enable JSON RPC API in your Ethereum client node by visiting [https://github.com/ethereum/wiki/wiki/JSON-RPC/](https://github.com/ethereum/wiki/wiki/JSON-RPC#javascript-api).
2. Identify the URI for the JSON RPC server.
Default JSON-RPC endpoints:

| Client | URL |
|-------|:------------:|
| C++ |  http://localhost:8545 |
| Go |http://localhost:8545 |
| Py | http://localhost:4000 |
| Parity | http://localhost:8545 |

## Running Samples

- Copy `connector-ethereum/component/samples/ethereum/sampleDashBoard.bal` file and paste it into `<ballerina-tools>/bin` folder.
- Run the following commands to execute the sample.

    `bin$ ballerina run sampleDashBoard.bal <URI> <JSONRPCVersion> <NetworkID>`
- eg:
    `bin$ ballerina run sampleDashBoard.bal "http://localhost:8080" "2.0" 1999`
    
## Quick Testing

You can easily test the following actions using the `sample.bal`.

- Copy `connector-ethereum/component/samples/ethereum/sample.bal` file and paste it into `<ballerina-tools>/bin` folder.
- Run the following commands to execute the sample.

`bin$ ballerina run sample.bal <URI> <JSONRPCVersion> <NetworkID> <MethodName> <Param1> .. <ParamN>`

***

## Working with Ethereum connector actions

### Example

All the actions return a `json payload` and a `http:HttpConnectorError`. The `json payload` consists either a result or an error. In the following section, provide you the details about the result of the `json` payload for each action under **Returns** sub heading.


```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.web3ClientVersion("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
//result

{"jsonrpc":"2.0","id":1999,"result":"Geth/hostname/v1.7.3-stable-4bb3c89d/linux-amd64/go1.9"}

Geth/hostname/v1.7.3-stable-4bb3c89d/linux-amd64/go1.9
```

### Generic Action

The Ethereum connector supports unimplemented RPC API functions via `remoteProcedureCall()`.
```java
  response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, "method_name", [params]);
  if (e == null) {
    println(response);
  } else {
    println(e);
  }
  ```

***

#### web3ClientVersion

Returns the current client version.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- The current client version

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.web3ClientVersion("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "Geth/hostname/v1.7.3-stable-4bb3c89d/linux-amd64/go1.9"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 web3_clientVersion`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_clientversion

***

#### web3Sha3

Returns Keccak-256 (*not* the standardized SHA3-256) of the given data.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - the data to convert into a SHA3 hash

##### Returns

 - The SHA3 result of the given string.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.web3Sha3("2.0", 1999, "0x88656c6c6f20776f726c64");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0xdf52f504725deca82f038d245711867631f97c819931abe097301d9340c729ea"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 web3_sha3 "0x4521"`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_sha3

***

#### netVersion

Returns the current network id.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- The current network id.
- `"1"`: Ethereum Mainnet
- `"2"`: Morden Testnet  (deprecated)
- `"3"`: Ropsten Testnet
- `"4"`: Rinkeby Testnet
- `"42"`: Kovan Testnet

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.netVersion("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "1999"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 net_version`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#net_version

***

#### netListening

Returns `true` if client is actively listening for network connections.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- `true` when listening, otherwise `false`.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.netListening("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": true
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 net_listening`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#net_listening

***

#### netPeerCount

Returns number of peers currently connected to the client.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- integer of the number of connected peers.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.netPeerCount("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x3"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 net_peerCount`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#net_peercount

***

#### ethProtocolVersion

Returns the current ethereum protocol version.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- The current ethereum protocol version

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethProtocolVersion("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x3f"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_protocolVersion`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_protocolversion

***

#### ethSyncing

Returns an object with data about the sync status or `false`.


##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- An object with sync status data or `FALSE`, when not syncing:
  - `startingBlock`: The block at which the import started (will only be reset, after the sync reached his head)
  - `currentBlock`: The current block, same as ethBlockNumber
  - `highestBlock`: The estimated highest block

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethSyncing("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc": "2.0",
  "result": {
    "startingBlock": "0x384",
    "currentBlock": "0x386",
    "highestBlock": "0x454"
  }
}
```
```json
{
  "id":1999,
  "jsonrpc": "2.0",
  "result": false
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_syncing`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_syncing

***

#### ethCoinbase

Returns the client coinbase address.


##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- 20 bytes - the current coinbase address.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethCoinbase("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_coinbase`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_coinbase

***

#### ethMining

Returns `true` if client is actively mining new blocks.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- returns `true` of the client is mining, otherwise `false`.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethMining("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": false 
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_mining`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_mining

***

#### ethHashrate

Returns the number of hashes per second that the node is mining with.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- number of hashes per second.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethHashrate("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x5c84"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_hashrate`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_hashrate

***

#### ethGasPrice

Returns the current price per gas in wei.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- integer of the current gas price in wei.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGasPrice("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x430e23400"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_gasPrice`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gasprice

***

#### ethAccounts

Returns a list of addresses owned by client.


##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- 20 Bytes - addresses owned by the client.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethAccounts("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": ["0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87","0xee76e1d9ad8859ac9340b07e6901a028a1101577"]
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_accounts`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_accounts

***

#### ethBlockNumber

Returns the number of most recent block.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- integer of the current block number the client is on.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethBlockNumber("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x58a"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_blockNumber`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_blocknumber

***

#### ethGetBalance

Returns the balance of the account of given address.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 20 Bytes - address to check for balance.
4. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.


##### Returns

- integer of the current balance in wei.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetBalance("2.0", 1999, "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87", "latest");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x1085561b6057e826000"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getBalance 0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87 latest`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getbalance

***

#### ethGetStorageAt

Returns the value from a storage position at a given address.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 20 Bytes - address of the storage.
4. `string` - integer of the position in the storage.
5. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.

##### Returns

- the value at this storage position.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetStorageAt("2.0", 1999, "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87", "0x0", "latest");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x00000000000000000000000000000000000000000000000000000000000005d3"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getStorageAt 0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87 0x0 latest`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getstorageat

***

#### ethGetTransactionCount

Returns the number of transactions *sent* from an address.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 20 Bytes - address.
4. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.

##### Returns

- integer of the number of transactions send from this address.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetTransactionCount("2.0", 1999, "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87", "latest");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x19"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getTransactionCount 0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87 0x0`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactioncount

***

#### ethGetBlockTransactionCountByHash

Returns the number of transactions in a block from a block matching the given block hash.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 32 Bytes - hash of a block

##### Returns

- integer of the number of transactions in this block.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetBlockTransactionCountByHash("2.0", 1999, "0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x1"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getBlockTransactionCountByHash 0xf6c17bf68c909565f2f1766da00a0f44e52ecb381ac6c8e088d28273d92e79ef`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbyhash

***

#### ethGetBlockTransactionCountByNumber

Returns the number of transactions in a block matching the given block number.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - integer of a block number, or the string `"earliest"`, `"latest"` or `"pending"`.


##### Returns

- integer of the number of transactions in this block.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetBlockTransactionCountByNumber("2.0", 1999, "latest");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x0"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getBlockTransactionCountByNumber 0x0`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbynumber

***

#### ethGetUncleCountByBlockHash

Returns the number of uncles in a block from a block matching the given block hash.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 32 Bytes - hash of a block

##### Returns

- integer of the number of uncles in this block.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetUncleCountByBlockHash("2.0", 1999, "0xe841dbd4630fde75a70dc221911aa289756827cd8dd909510215609adaf58655");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0xc3"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getUncleCountByBlockHash 0xf6c17bf68c909565f2f1766da00a0f44e52ecb381ac6c8e088d28273d92e79ef`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblockhash

***

#### ethGetUncleCountByBlockNumber

Returns the number of uncles in a block from a block matching the given block number.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - integer of a block number, or the string "latest", "earliest" or "pending".


##### Returns

- integer of the number of uncles in this block.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetUncleCountByBlockNumber("2.0", 1999, "latest");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0xa2"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getUncleCountByBlockNumber 0x0`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblocknumber

***

#### ethGetCode

Returns code at a given address.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 20 Bytes - address
4. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.


##### Returns

- the code from the given address.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetCode("2.0", 1999, "0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b", "0x2");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x600160008035811a818181146012578301005b601b6001356025565b8060005260206000f25b600060078202905091905056"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getCode 0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87 latest`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcode

***

#### ethSign

The sign method calculates an Ethereum specific signature with.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 20 Bytes - account address
4. `string`, N Bytes - message to sign

##### Returns

- `string`: Signature

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethSign("2.0", 1999, "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87", "0xdeadbeaf");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x725b107db88f11690dd6f2031f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_sign 0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87 0x170b651e078b2b0c073bffdb5dc53288ac0a62e1015f230e5ff5092c10eb56e4`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sign

***

#### ethSendTransaction

Creates new message call transaction or a contract creation, if the data field contains code.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `json` - The transaction object
  - `from`: 20 Bytes - The address the transaction is send from.
  - `to`: 20 Bytes - (optional when creating new contract) The address the transaction is directed to.
  - `gas`: - (optional, default: 90000) Integer of the gas provided for the transaction execution. It will return unused gas.
  - `gasPrice`: (optional, default: To-Be-Determined) Integer of the gasPrice used for each paid gas
  - `value`: (optional) Integer of the value send with this transaction
  - `data`: The compiled code of a contract OR the hash of the invoked method signature and encoded parameters.
  - `nonce`: (optional) Integer of a nonce. This allows to overwrite your own pending transactions that use the same nonce.


##### Returns

- 32 Bytes - the transaction hash, or the zero hash if the transaction is not yet available.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethSendTransaction("2.0", 1999,
        {
         from :"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87",
         to: "0xee76e1d9ad8859ac9340b07e6901a028a1101577",
         data: "0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c",
         value: "0xa"
         });
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x1c80b47e4a28c7c4892460c84a1f7b10aa2a33f0059f881abbcf77ef7ae2914a"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_sendTransaction '{"from" :"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87","to": "0xee76e1d9ad8859ac9340b07e6901a028a1101577","data": "0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c","value": "0xa"}'`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendtransaction

***

#### ethSendRawTransaction

Creates new message call transaction or a contract creation for signed transactions.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, The signed transaction data.


##### Returns

- 32 Bytes - the transaction hash, or the zero hash if the transaction is not yet available.

##### Example
```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethSendRawTransaction("2.0", 1999, "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331"
}
```

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_sendRawTransaction 0x877399ae278d0a969bad46d3d2e4b2403d091b5c3fdab13c254c8ee09c6c591d17e058baaa8c5c4f2e3afc2fce30d1bce185e78307637d4cd67d0ad177b812e61c`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendrawtransaction

***

#### ethCall

Executes a new message call immediately without creating a transaction on the block chain.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `json` - The transaction call object
  - `from`: 20 Bytes - (optional) The address the transaction is sent from.
  - `to`: 20 Bytes  - The address the transaction is directed to.
  - `gas`: (optional) Integer of the gas provided for the transaction execution. eth_call consumes zero gas, but this parameter may be needed by some executions.
  - `gasPrice`: (optional) Integer of the gasPrice used for each paid gas.
  - `value`: (optional) Integer of the value send with this transaction.
  - `data`: (optional) Hash of the method signature and encoded parameters.
4. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.

##### Returns

- the return value of executed contract.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethCall("2.0", 1999, {
              from :"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87",
              to: "0xee76e1d9ad8859ac9340b07e6901a028a1101577",
              data: "0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c",
              value: "0xa"
              }, "latest");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_call '{"to":"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87"}' latest`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_call

***

#### ethEstimateGas

Makes a call or transaction, which won't be added to the blockchain and returns the used gas, which can be used for estimating the used gas.

##### Parameters

In [eth_call](#eth_call), all the optional parameters are expected.

##### Returns

- the amount of gas used.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethEstimateGas("2.0", 1999, {see above ethCall parameters});
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
//result

{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x5208"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_estimateGas '{"from" :"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87","to": "0xee76e1d9ad8859ac9340b07e6901a028a1101577", "data": "0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c","value": "0xa"}'`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_estimategas

***

#### ethGetBlockByHash

Returns information about a block by hash.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 32 Bytes - Hash of a block.
4. `boolean` - If `true` it returns the full transaction objects, if `false` only the hashes of the transactions.


##### Returns

`json` - A block object, or `null` when no block was found:

  - `number`: the block number. `null` when its pending block.
  - `hash`: 32 Bytes - hash of the block. `null` when its pending block.
  - `parentHash`: 32 Bytes - hash of the parent block.
  - `nonce`: 8 Bytes - hash of the generated proof-of-work. `null` when its pending block.
  - `sha3Uncles`: 32 Bytes - SHA3 of the uncles data in the block.
  - `logsBloom`: 256 Bytes - the bloom filter for the logs of the block. `null` when its pending block.
  - `transactionsRoot`: 32 Bytes - the root of the transaction trie of the block.
  - `stateRoot`: 32 Bytes - the root of the final state trie of the block.
  - `receiptsRoot`: 32 Bytes - the root of the receipts trie of the block.
  - `miner`: 20 Bytes - the address of the beneficiary to whom the mining rewards were given.
  - `difficulty`: integer of the difficulty for this block.
  - `totalDifficulty`: integer of the total difficulty of the chain until this block.
  - `extraData`: the "extra data" field of this block.
  - `size`: integer the size of this block in bytes.
  - `gasLimit`: the maximum gas allowed in this block.
  - `gasUsed`: the total used gas by all transactions in this block.
  - `timestamp`: the unix timestamp for when the block was collated.
  - `transactions`: Array of transaction objects, or 32 Bytes transaction hashes depending on the last given parameter.
  - `uncles`: Array of uncle hashes.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetBlockByHash("2.0", 1999, "0x8655b1b7949f45a95a77c8ff3942116db22ce268b5f63d2c25f09b5625b02607", true);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
//result

{
  "id":1999,
  "jsonrpc":"2.0",
  "result": {
    "difficulty":"0x20000",
    "extraData":"0xd583010703846765746885676f312e39856c696e7578",
    "gasLimit":"0x1ffffac",
    "gasUsed":"0xc598",
    "hash":"0x8655b1b7949f45a95a77c8ff3942116db22ce268b5f63d2c25f09b5625b02607",
    "logsBloom":"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    "miner":"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87",
    "mixHash":"0x18ac3092c321f767a4274e242dc96fead605557323990e2550e72354caa26762",
    "nonce":"0x2d2181ff742a9379",
    "number":"0x58b",
    "parentHash":"0xe841dbd4630fde75a70dc221911aa289756827cd8dd909510215609adaf58655",
    "receiptsRoot":"0x67263eed0bbdb4aa419fa2f0673ce7c33f9b1c1dee3fa4618c25d7653d6341c1",
    "sha3Uncles":"0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
    "size":"0x36e",
    "stateRoot":"0x79f41be89d58f5e8544e348442c3565222fa854c5c0b5cca7fdc62badd4dc3bf",
    "timestamp":"0x5a684e62",
    "totalDifficulty":"0xbeb62a4",
    "transactions":[
        {"blockHash":"0x8655b1b7949f45a95a77c8ff3942116db22ce268b5f63d2c25f09b5625b02607",
        "blockNumber":"0x58b","from":"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87",
        "gas":"0x15f90",
        "gasPrice":"0x430e23400",
        "hash":"0x1c80b47e4a28c7c4892460c84a1f7b10aa2a33f0059f881abbcf77ef7ae2914a",
        "input":"0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c",
        "nonce":"0x19","to":"0xee76e1d9ad8859ac9340b07e6901a028a1101577",
        "transactionIndex":"0x0",
        "value":"0xa",
        "v":"0x42",
        "r":"0x7439005bf1616c79a13ccb98b9020d791a801436e16b69ae3bdf04954760e1e3",
        "s":"0x7b400bc21ca9649511f681bc46be18d7cd0ddc74d03b1095ef78bb4231fbcded"},
        {"blockHash":"0x8655b1b7949f45a95a77c8ff3942116db22ce268b5f63d2c25f09b5625b02607",
        "blockNumber":"0x58b","from":"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87",
        "gas":"0x15f90",
        "gasPrice":"0x430e23400",
        "hash":"0x718a5076ef9f9937a2671e8767b37805692295533d2072b7c89f8d2f2999d844",
        "input":"0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c",
        "nonce":"0x1a",
        "to":"0xee76e1d9ad8859ac9340b07e6901a028a1101577",
        "transactionIndex":"0x1",
        "value":"0xa",
        "v":"0x42",
        "r":"0xe60bea606b55ee3991c924fac76135a7acaeac5f0df5d0308c42679e003c952e",
        "s":"0x71f1e1cefa266d0a8485a746ab05a257306d7d928523f10d617c698b3064b850"}],
    "transactionsRoot":"0x6e7538c2e6c2747b9c6ff0932931bad93574cab5ea702a8d9064818eb17d278e",
    "uncles":[]
    }
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getBlockByHash 0xf6c17bf68c909565f2f1766da00a0f44e52ecb381ac6c8e088d28273d92e79ef true`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbyhash

***

#### ethGetBlockByNumber

Returns information about a block by block number.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - integer of a block number, or the string `"earliest"`, `"latest"` or `"pending"`.
4. `string` - If `true` it returns the full transaction objects, if `false` only the hashes of the transactions.


##### Returns

See [eth_getBlockByHash](#eth_getblockbyhash)

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getBlockByNumber  0xaf true`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbynumber

***

#### ethGetTransactionByHash

Returns the information about a transaction requested by transaction hash.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 32 Bytes - hash of a transaction


##### Returns

`json` - A transaction object, or `null` when no transaction was found:

  - `hash`: 32 Bytes - hash of the transaction.
  - `nonce`: the number of transactions made by the sender prior to this one.
  - `blockHash`: 32 Bytes - hash of the block where this transaction was in. `null` when its pending.
  - `blockNumber`: block number where this transaction was in. `null` when its pending.
  - `transactionIndex`: integer of the transactions index position in the block. `null` when its pending.
  - `from`: 20 Bytes - address of the sender.
  - `to`: 20 Bytes - address of the receiver. `null` when its a contract creation transaction.
  - `value`: value transferred in Wei.
  - `gasPrice`: gas price provided by the sender in Wei.
  - `gas`: gas provided by the sender.
  - `input`: the data send along with the transaction.


##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetTransactionByHash("2.0", 1999, "0x1c80b47e4a28c7c4892460c84a1f7b10aa2a33f0059f881abbcf77ef7ae2914a");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": {
    "blockHash":"0x8655b1b7949f45a95a77c8ff3942116db22ce268b5f63d2c25f09b5625b02607",
    "blockNumber":"0x58b",
    "from":"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87",
    "gas":"0x15f90",
    "gasPrice":"0x430e23400",
    "hash":"0x1c80b47e4a28c7c4892460c84a1f7b10aa2a33f0059f881abbcf77ef7ae2914a",
    "input":"0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c",
    "nonce":"0x19",
    "to":"0xee76e1d9ad8859ac9340b07e6901a028a1101577",
    "transactionIndex":"0x0",
    "value":"0xa",
    "v":"0x42",
    "r":"0x7439005bf1616c79a13ccb98b9020d791a801436e16b69ae3bdf04954760e1e3",
    "s":"0x7b400bc21ca9649511f681bc46be18d7cd0ddc74d03b1095ef78bb4231fbcded"
    }
}
```

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getTransactionByHash  0xf6c17bf68c909565f2f1766da00a0f44e52ecb381ac6c8e088d28273d92e79ef`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyhash

***

#### ethGetTransactionByBlockHashAndIndex

Returns information about a transaction by block hash and transaction index position.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 32 Bytes - hash of a block.
4. `string` - integer of the transaction index position.

##### Returns

See [ethGetBlockByHash](#ethgettransactionbyhash)

##### Quick Testing 
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getTransactionByBlockHashAndIndex  0xf6c17bf68c909565f2f1766da00a0f44e52ecb381ac6c8e088d28273d92e79ef 0x0`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblockhashandindex

***

#### ethGetTransactionByBlockNumberAndIndex

Returns information about a transaction by block number and transaction index position.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - a block number, or the string `"earliest"`, `"latest"` or `"pending"`.
4. `string` - the transaction index position.


##### Returns

See [ethGettransactionbyhash](#ethgettransactionbyhash)

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getTransactionByBlockNumberAndIndex  0xaf 0x0`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblocknumberandindex

***

#### ethGetTransactionReceipt

Returns the receipt of a transaction by transaction hash.

**Note** That the receipt is not available for pending transactions.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 32 Bytes - hash of a transaction

##### Returns

`json` - A transaction receipt object, or `null` when no receipt was found:

  - `transactionHash `: 32 Bytes - hash of the transaction.
  - `transactionIndex`: integer of the transactions index position in the block.
  - `blockHash`: 32 Bytes - hash of the block where this transaction was in.
  - `blockNumber`: block number where this transaction was in.
  - `cumulativeGasUsed `: The total amount of gas used when this transaction was executed in the block.
  - `gasUsed `: The amount of gas used by this specific transaction alone.
  - `contractAddress `: 20 Bytes - The contract address created, if the transaction was a contract creation, otherwise `null`.
  - `logs`: Array of log objects, which this transaction generated.
  - `logsBloom`: 256 Bytes - Bloom filter for light clients to quickly retrieve related logs.

It also returns _either_ :

  - `root` : 32 bytes of post-transaction stateroot (pre Byzantium)
  - `status`: either `1` (success) or `0` (failure)

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetTransactionReceipt("2.0", 1999, "0x1c80b47e4a28c7c4892460c84a1f7b10aa2a33f0059f881abbcf77ef7ae2914a");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
//result

{
  "id":1999,
  "jsonrpc":"2.0",
  "result": {
    "blockHash":"0x8655b1b7949f45a95a77c8ff3942116db22ce268b5f63d2c25f09b5625b02607",
    "blockNumber":"0x58b",
    "contractAddress":null,
    "cumulativeGasUsed":"0x62cc",
    "from":"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87",
    "gasUsed":"0x62cc",
    "logs":[],
    "logsBloom":"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    "root":"0x53a4e4f95ec028e158f8ac7d9f57993e0e13e4582cce0e0f072f58d41e6f9e22",
    "to":"0xee76e1d9ad8859ac9340b07e6901a028a1101577",
    "transactionHash":"0x1c80b47e4a28c7c4892460c84a1f7b10aa2a33f0059f881abbcf77ef7ae2914a",
    "transactionIndex":"0x0"
    }
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getTransactionReceipt 0xf6c17bf68c909565f2f1766da00a0f44e52ecb381ac6c8e088d28273d92e79ef`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionreceipt

***

#### ethGetUncleByBlockHashAndIndex

Returns information about a uncle of a block by hash and uncle index position.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 32 Bytes - hash a block.
4. `string` - the uncle's index position.


##### Returns

See [ethGetBlockByHash](#ethgetblockbyhash)

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getUncleByBlockHashAndIndex 0xf6c17bf68c909565f2f1766da00a0f44e52ecb381ac6c8e088d28273d92e79ef 0x0'`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblockhashandindex

***

#### ethGetUncleByBlockNumberAndIndex

Returns information about a uncle of a block by number and uncle index position.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - a block number, or the string `"earliest"`, `"latest"` or `"pending"`.
4. `string` - the uncle's index position.

##### Returns

See [ethGetBlockByHash](#ethgetblockbyhash)

**Note**: An uncle doesn't contain individual transactions.

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getUncleByBlockNumberAndIndex 0xf6 0x0`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblocknumberandindex

***

#### ethGetCompilers

Returns a list of available compilers in the client.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- Array of available compilers.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetCompilers("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": ["solidity", "lll", "serpent"]
}
```

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcompilers

***

#### ethCompileSolidity

Returns compiled solidity code.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - The source code.

##### Returns

- The compiled source code.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethCompileSolidity("2.0", 1999,
    "contract test { function multiply(uint a) returns(uint d) {   return a * 7;   } }");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc": "2.0",
  "result": {
      "code": "0x605880600c6000396000f3006000357c010000000000000000000000000000000000000000000000000000000090048063c6888fa114602e57005b603d6004803590602001506047565b8060005260206000f35b60006007820290506053565b91905056",
      "info": {
        "source": "contract test {\n   function multiply(uint a) constant returns(uint d) {\n       return a * 7;\n   }\n}\n",
        "language": "Solidity",
        "languageVersion": "0",
        "compilerVersion": "0.9.19",
        "abiDefinition": [
          {
            "constant": true,
            "inputs": [
              {
                "name": "a",
                "type": "uint256"
              }
            ],
            "name": "multiply",
            "outputs": [
              {
                "name": "d",
                "type": "uint256"
              }
            ],
            "type": "function"
          }
        ],
        "userDoc": {
          "methods": {}
        },
        "developerDoc": {
          "methods": {}
        }
      }

}
```
##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilesolidity

***

#### ethCompileLLL

Returns compiled LLL code.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - The source code.

##### Returns

- The compiled source code.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethCompileLLL("2.0", 1999, "(returnlll (suicide (caller)))");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x603880600c6000396000f3006001600060e060020a600035048063c6888fa114601857005b6021600435602b565b8060005260206000f35b600081600702905091905056"
}
```

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilelll

***

#### ethCompileSerpent

Returns compiled serpent code.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - The source code.

##### Returns

- The compiled source code.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethCompileSerpent("2.0", 1999, "Some code");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
//result

{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x603880600c6000396000f3006001600060e060020a600035048063c6888fa114601857005b6021600435602b565b8060005260206000f35b600081600702905091905056"
}
```

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compileserpent

***

#### ethNewFilter

Creates a filter object, based on filter options, to notify when the state changes (logs).

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `json` - The filter options:
  - `fromBlock`: (optional, default: `"latest"`) Integer block number, or `"latest"` for the last mined block or `"pending"`, `"earliest"` for not yet mined transactions.
  - `toBlock`: (optional, default: `"latest"`) Integer block number, or `"latest"` for the last mined block or `"pending"`, `"earliest"` for not yet mined transactions.
  - `address`: 20 Bytes - (optional) Contract address or a list of addresses from which logs should originate.
  - `topics`: (optional) Array of 32 Bytes `DATA` topics. Topics are order-dependent. Each topic can also be an array of DATA with "or" options.

##### Returns

- A filter id.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethNewFilter("2.0", 1999, {
        "fromBlock": "0x1",
        "toBlock": "0x2",
        "address": "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87",
        "topics": ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", null, ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", "0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc"]]
      });
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0xcce8842bc862eec936b6ca0c392c8633"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_newFilter '{"fromBlock": "0x1","toBlock": "0x2","address": "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87","topics":["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", null,["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", "0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc"]]}'`


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newfilter

***

#### ethNewBlockFilter

Creates a filter in the node, to notify when a new block arrives.
To check if the state has changed, call [ethGetFilterChanges](#ethgetfilterchanges).

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- A filter id.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethNewBlockFilter("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0xd1e74a0ecefd34817099171b8b9e8a82"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_newBlockFilter`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newblockfilter

***

#### ethNewPendingTransactionFilter

Creates a filter in the node, to notify when new pending transactions arrive.

##### Parameters
1. `string` - JSON RPC version
2. `int` - network id

##### Returns

- A filter id.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethNewPendingTransactionFilter("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": "0x1bad3335bdd994b7a4690f0a134fb340"
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_newPendingTransactionFilter`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newpendingtransactionfilter
***

#### ethUninstallFilter

Uninstalls a filter with given id.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - The filter id.

##### Returns

- `true` if the filter was successfully uninstalled, otherwise `false`.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethUninstallFilter("2.0", 1999, "0xd1e74a0ecefd34817099171b8b9e8a82");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": true
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_uninstallFilter 0x15842a94627e19e5571559236b5b1700`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_uninstallfilter

***

#### ethGetFilterChanges

Polling method for a filter, which returns an array of logs which occurred since last poll.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - the filter id.

##### Returns

`json` - Array of log objects, or an empty array if nothing has changed since last poll.

- For filters created with `ethNewBlockFilter` the return are block hashes (`string`, 32 Bytes), e.g. `["0x3454645634534..."]`.
- For filters created with `ethNewPendingTransactionFilter ` the return are transaction hashes (`string`, 32 Bytes), e.g. `["0x6345343454645..."]`.
- For filters created with `ethNewFilter` logs are objects with following params:

  - `removed`: `true` when the log was removed, due to a chain reorganization. `false` if its a valid log.
  - `logIndex`: integer of the log index position in the block. `null` when its pending log.
  - `transactionIndex`: integer of the transactions index position log was created from. `null` when its pending log.
  - `transactionHash`: 32 Bytes - hash of the transactions this log was created from. `null` when its pending log.
  - `blockHash`: 32 Bytes - hash of the block where this log was in. `null` when its pending. `null` when its pending log.
  - `blockNumber`: the block number where this log was in. `null` when its pending. `null` when its pending log.
  - `address`: 20 Bytes - address from which this log originated.
  - `data`: contains one or more 32 Bytes non-indexed arguments of the log.
  - `topics`: `Array of string` - Array of 0 to 4, 32 Bytes `string` of indexed log arguments.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetFilterChanges("2.0", 1999, "0x1bad3335bdd994b7a4690f0a134fb340");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": [{
    "logIndex": "0x1",
    "blockNumber":"0x5f9",
    "blockHash": "0x8216c5785ac562ff41e2dcfdf5785ac562ff41e2dcfdf829c5a142f1fccd7d",
    "transactionHash":  "0xdf829c5a142f1fccd7d8216c5785ac562ff41e2dcfdf5785ac562ff41e2dcf",
    "transactionIndex": "0x0",
    "address": "0x1bad3335bdd994b7a4690f0a134fb340f1fccd7d",
    "data":"0x0000000000000000000000000000000000000000000000000000000000000000",
    "topics": ["0x59ebeb90bc63057b6515673c3ecf9438e5058bca0f92585014eced636878c9a5"]
    },{
      
    }]
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getFilterChanges 0x15842a94627e19e5571559236b5b1700`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterchanges

***

#### ethGetFilterLogs

Returns an array of all logs matching filter with given id.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - The filter id.

##### Returns

See [ethGetFilterChanges](#ethgetfilterchanges)

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getFilterLogs 0x15842a94627e19e5571559236b5b1700`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterlogs

***

#### ethGetLogs

Returns an array of all logs matching a given filter object.

##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `json` - the filter object, see [eth_newFilter parameters](#eth_newfilter).

##### Returns

See [ethGetFilterChanges](#ethgetfilterchanges)

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getLogs '{"fromBlock": "0x1","toBlock": "0x2","address": "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87","topics":["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", null,["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", "0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc"]]}'`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getLogs

***

#### ethGetWork

Returns the hash of the current block, the seedHash, and the boundary condition to be met ("target").

##### Parameters
none

##### Returns

`json` - Array with the following properties:
  1. `string`, 32 Bytes - current block header pow-hash
  2. `string`, 32 Bytes - the seed hash used for the DAG.
  3. `string`, 32 Bytes - the boundary condition ("target"), 2^256 / difficulty.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethGetWork("2.0", 1999);
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": ["0xe77859f2a6cce904a1d7a2f84d4e18ba8ad877bc816c4544975be03be1fef938","0x0000000000000000000000000000000000000000000000000000000000000000","0x00007fb031e0d37bd29c5e4514d2fc226a7d7199005fc425689e9cddf546b3ce"]
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_getWork`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getwork

***

#### ethSubmitWork

Used for submitting a proof-of-work solution.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string`, 8 Bytes - The nonce found (64 bits)
4. `string`, 32 Bytes - The header's pow-hash (256 bits)
5. `string`, 32 Bytes - The mix digest (256 bits)

##### Returns

- returns `true` if the provided solution is valid, otherwise `false`.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethSubmitWork("2.0", 1999, "0x0000000000000001", "0xa234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef", "0xD1GE5700000000000000000000000000D1GE5700000000000000000000000000");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": true
}
```
##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_submitWork "0x0000000000000001" "0xa234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef" "0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef"`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submitwork

***

#### ethSubmitHashrate

Used for submitting mining hashrate.


##### Parameters

1. `string` - JSON RPC version
2. `int` - network id
3. `string` - a hexadecimal string representation (32 bytes) of the hash rate
4. `string` - A random hexadecimal(32 bytes) ID identifying the client

##### Returns

- returns `true` if submitting went through succesfully and `false` otherwise.

##### Example

```java
//code
json response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.ethSubmitHashrate("2.0", 1999, "0x0000000000000000000000000000000000000000000000000000000000500000", "0x59daa26581d0acd1fce254fb7e85952f4c09d0915afd33d3886cd914bc7d283c");
if (e == null) {
    println(response);
} else {
    println(e);
}
```

```json
{
  "id":1999,
  "jsonrpc":"2.0",
  "result": true
}
```

##### Quick Testing
`bin$ ballerina run sample.bal "http://localhost:8080" "2.0" 1999 eth_submitHashrate "0x500000" "0x59daa26581d0acd1fce254fb7e85952f4c09d0915afd33d3886cd914bc7d283c"`

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submithashrate

***


#### Related links
- https://github.com/ethereum/wiki/wiki/JSON-RPC
