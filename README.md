# Ballerina Ethereum Connector

The Ethereum connector allows you to access the Ethereum JSON RPC API through ballerina. And the Ethereum connector actions are being invoked with a ballerina main function. The following section provide you the details on how to use Ballerina Ethereum connector.

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

## Working with Ethereum connector actions

### Example

All the actions return a `http:Response` and a `http:HttpConnectorError`. The `http:Response` consists a `json` payload. In the following section, provide you the details about the result of the `json` payload for each action under **Returns** sub heading.

```java
http:Response response = {};
http:HttpConnectorError e;
response, e = ethereumConnector.web3ClientVersion("2.0", 1999);
if (e == null) {
    json JSONResponse = response.getJsonPayload();
    println(JSONResponse.toString());
    println(JSONResponse.result.toString());
} else {
    println(e);
}
```
```json
{"jsonrpc":"2.0","id":1999,"result":"Geth/hostname/v1.7.3-stable-4bb3c89d/linux-amd64/go1.9"}
```
`Geth/hostname/v1.7.3-stable-4bb3c89d/linux-amd64/go1.9`

***
#### web3_clientVersion

Returns the current client version.

##### Parameters
none

##### Returns

- The current client version

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_clientversion

***

#### web3_sha3

Returns Keccak-256 (*not* the standardized SHA3-256) of the given data.

##### Parameters

1. `string` - the data to convert into a SHA3 hash

##### Returns

 - The SHA3 result of the given string.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_sha3

***

#### net_version

Returns the current network id.

##### Parameters
none

##### Returns

- The current network id.
- `"1"`: Ethereum Mainnet
- `"2"`: Morden Testnet  (deprecated)
- `"3"`: Ropsten Testnet
- `"4"`: Rinkeby Testnet
- `"42"`: Kovan Testnet

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#net_version#net_version

***

#### net_listening

Returns `true` if client is actively listening for network connections.

##### Parameters
none

##### Returns

- `true` when listening, otherwise `false`.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#net_listening

***

#### net_peerCount

Returns number of peers currently connected to the client.

##### Parameters
none

##### Returns

- integer of the number of connected peers.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#net_peercount

***

#### eth_protocolVersion

Returns the current ethereum protocol version.

##### Parameters
none

##### Returns

- The current ethereum protocol version

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_protocolversion

***

#### eth_syncing

Returns an object with data about the sync status or `false`.


##### Parameters
none

##### Returns

- An object with sync status data or `FALSE`, when not syncing:
  - `startingBlock`: The block at which the import started (will only be reset, after the sync reached his head)
  - `currentBlock`: The current block, same as eth_blockNumber
  - `highestBlock`: The estimated highest block

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_syncing

***

#### eth_coinbase

Returns the client coinbase address.


##### Parameters
none

##### Returns

- 20 bytes - the current coinbase address.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_coinbase

***

#### eth_mining

Returns `true` if client is actively mining new blocks.

##### Parameters
none

##### Returns

- returns `true` of the client is mining, otherwise `false`.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_mining

***

#### eth_hashrate

Returns the number of hashes per second that the node is mining with.

##### Parameters
none

##### Returns

- number of hashes per second.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_hashrate

***

#### eth_gasPrice

Returns the current price per gas in wei.

##### Parameters
none

##### Returns

- integer of the current gas price in wei.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gasprice

***

#### eth_accounts

Returns a list of addresses owned by client.


##### Parameters
none

##### Returns

- 20 Bytes - addresses owned by the client.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_accounts

***

#### eth_blockNumber

Returns the number of most recent block.

##### Parameters
none

##### Returns

- integer of the current block number the client is on.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_blocknumber

***

#### eth_getBalance

Returns the balance of the account of given address.

##### Parameters

1. `string`, 20 Bytes - address to check for balance.
2. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.


##### Returns

- integer of the current balance in wei.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getbalance

***

#### eth_getStorageAt

Returns the value from a storage position at a given address. 

##### Parameters

1. `string`, 20 Bytes - address of the storage.
2. `string` - integer of the position in the storage.
3. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.

##### Returns

- the value at this storage position.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getstorageat

***

#### eth_getTransactionCount

Returns the number of transactions *sent* from an address.


##### Parameters

1. `string`, 20 Bytes - address.
2. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.

##### Returns

- integer of the number of transactions send from this address.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactioncount

***

#### eth_getBlockTransactionCountByHash

Returns the number of transactions in a block from a block matching the given block hash.


##### Parameters

1. `string`, 32 Bytes - hash of a block

##### Returns

- integer of the number of transactions in this block.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbyhash

***

#### eth_getBlockTransactionCountByNumber

Returns the number of transactions in a block matching the given block number.


##### Parameters

1. `string` - integer of a block number, or the string `"earliest"`, `"latest"` or `"pending"`.


##### Returns

- integer of the number of transactions in this block.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getBlockTransactionCountByNumber

***

#### eth_getUncleCountByBlockHash

Returns the number of uncles in a block from a block matching the given block hash.


##### Parameters

1. `string`, 32 Bytes - hash of a block

##### Returns

- integer of the number of uncles in this block.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblockhash

***

#### eth_getUncleCountByBlockNumber

Returns the number of uncles in a block from a block matching the given block number.


##### Parameters

1. `string` - integer of a block number, or the string "latest", "earliest" or "pending".


##### Returns

- integer of the number of uncles in this block.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblocknumber

***

#### eth_getCode

Returns code at a given address.


##### Parameters

1. `string`, 20 Bytes - address
2. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.


##### Returns

- the code from the given address.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcode

***

#### eth_sign

The sign method calculates an Ethereum specific signature with.

##### Parameters
account, message

1. `string`, 20 Bytes - address
2. `string`, N Bytes - message to sign

##### Returns

`string`: Signature

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sign

***

#### eth_sendTransaction

Creates new message call transaction or a contract creation, if the data field contains code.

##### Parameters

1. `json` - The transaction object
  - `from`: 20 Bytes - The address the transaction is send from.
  - `to`: 20 Bytes - (optional when creating new contract) The address the transaction is directed to.
  - `gas`: - (optional, default: 90000) Integer of the gas provided for the transaction execution. It will return unused gas.
  - `gasPrice`: (optional, default: To-Be-Determined) Integer of the gasPrice used for each paid gas
  - `value`: (optional) Integer of the value send with this transaction
  - `data`: The compiled code of a contract OR the hash of the invoked method signature and encoded parameters.
  - `nonce`: (optional) Integer of a nonce. This allows to overwrite your own pending transactions that use the same nonce.


##### Returns

- 32 Bytes - the transaction hash, or the zero hash if the transaction is not yet available.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendtransaction

***

#### eth_sendRawTransaction

Creates new message call transaction or a contract creation for signed transactions.

##### Parameters

1. `string`, The signed transaction data.


##### Returns

- 32 Bytes - the transaction hash, or the zero hash if the transaction is not yet available.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendrawtransaction

***

#### eth_call

Executes a new message call immediately without creating a transaction on the block chain.


##### Parameters

1. `json` - The transaction call object
  - `from`: 20 Bytes - (optional) The address the transaction is sent from.
  - `to`: 20 Bytes  - The address the transaction is directed to.
  - `gas`: (optional) Integer of the gas provided for the transaction execution. eth_call consumes zero gas, but this parameter may be needed by some executions.
  - `gasPrice`: (optional) Integer of the gasPrice used for each paid gas.
  - `value`: (optional) Integer of the value send with this transaction.
  - `data`: (optional) Hash of the method signature and encoded parameters.
2. `string` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`.

##### Returns

- the return value of executed contract.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_call

***

#### eth_estimateGas

Makes a call or transaction, which won't be added to the blockchain and returns the used gas, which can be used for estimating the used gas.

##### Parameters

In [eth_call](#eth_call), all the optional parameters are expected.

##### Returns

- the amount of gas used.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_estimategas

***

#### eth_getBlockByHash

Returns information about a block by hash.


##### Parameters

1. `string`, 32 Bytes - Hash of a block.
2. `boolean` - If `true` it returns the full transaction objects, if `false` only the hashes of the transactions.


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


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbyhash

***

#### eth_getBlockByNumber

Returns information about a block by block number.

##### Parameters

1. `string` - integer of a block number, or the string `"earliest"`, `"latest"` or `"pending"`.
2. `string` - If `true` it returns the full transaction objects, if `false` only the hashes of the transactions.


##### Returns

See [eth_getBlockByHash](#eth_getblockbyhash)

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbynumber

***

#### eth_getTransactionByHash

Returns the information about a transaction requested by transaction hash.


##### Parameters

1. `string`, 32 Bytes - hash of a transaction


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

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyhash

***

#### eth_getTransactionByBlockHashAndIndex

Returns information about a transaction by block hash and transaction index position.


##### Parameters

1. `string`, 32 Bytes - hash of a block.
2. `string` - integer of the transaction index position.

##### Returns

See [eth_getBlockByHash](#eth_gettransactionbyhash)

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblockhashandindex

***

#### eth_getTransactionByBlockNumberAndIndex

Returns information about a transaction by block number and transaction index position.


##### Parameters

1. `string` - a block number, or the string `"earliest"`, `"latest"` or `"pending"`.
2. `string` - the transaction index position.


##### Returns

See [eth_gettransactionbyhash](#eth_gettransactionbyhash)

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblocknumberandindex

***

#### eth_getTransactionReceipt

Returns the receipt of a transaction by transaction hash.

**Note** That the receipt is not available for pending transactions.


##### Parameters

1. `string`, 32 Bytes - hash of a transaction

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


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionreceipt

***

#### eth_getUncleByBlockHashAndIndex

Returns information about a uncle of a block by hash and uncle index position.


##### Parameters


1. `string`, 32 Bytes - hash a block.
2. `string` - the uncle's index position.


##### Returns

See [eth_getBlockByHash](#eth_getblockbyhash)

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblockhashandindex

***

#### eth_getUncleByBlockNumberAndIndex

Returns information about a uncle of a block by number and uncle index position.


##### Parameters

1. `string` - a block number, or the string `"earliest"`, `"latest"` or `"pending"`.
2. `string` - the uncle's index position.

##### Returns

See [eth_getBlockByHash](#eth_getblockbyhash)

**Note**: An uncle doesn't contain individual transactions.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblocknumberandindex

***

#### eth_getCompilers

Returns a list of available compilers in the client.

##### Parameters
none

##### Returns

- Array of available compilers.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcompilers

***

#### eth_compileSolidity

Returns compiled solidity code.

##### Parameters

1. `string` - The source code.

##### Returns

- The compiled source code.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compileSolidity

***

#### eth_compileLLL

Returns compiled LLL code.

##### Parameters

1. `string` - The source code.

##### Returns

- The compiled source code.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compileLLL

***

#### eth_compileSerpent

Returns compiled serpent code.

##### Parameters

1. `string` - The source code.

##### Returns

- The compiled source code.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compileserpent

***

#### eth_newFilter

Creates a filter object, based on filter options, to notify when the state changes (logs).

##### Parameters

1. `json` - The filter options:
  - `fromBlock`: (optional, default: `"latest"`) Integer block number, or `"latest"` for the last mined block or `"pending"`, `"earliest"` for not yet mined transactions.
  - `toBlock`: (optional, default: `"latest"`) Integer block number, or `"latest"` for the last mined block or `"pending"`, `"earliest"` for not yet mined transactions.
  - `address`: 20 Bytes - (optional) Contract address or a list of addresses from which logs should originate.
  - `topics`: (optional) Array of 32 Bytes `DATA` topics. Topics are order-dependent. Each topic can also be an array of DATA with "or" options.

##### Returns

- A filter id.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newfilter

***

#### eth_newBlockFilter

Creates a filter in the node, to notify when a new block arrives.
To check if the state has changed, call [eth_getFilterChanges](#eth_getfilterchanges).

##### Parameters
None

##### Returns

- A filter id.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newblockfilter

***

#### eth_newPendingTransactionFilter

Creates a filter in the node, to notify when new pending transactions arrive.

##### Parameters
None

##### Returns

- A filter id.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newpendingtransactionfilter
***

#### eth_uninstallFilter

Uninstalls a filter with given id.


##### Parameters

1. `string` - The filter id.

##### Returns

- `true` if the filter was successfully uninstalled, otherwise `false`.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_uninstallfilter

***

#### eth_getFilterChanges

Polling method for a filter, which returns an array of logs which occurred since last poll.


##### Parameters

1. `string` - the filter id.

##### Returns

`json` - Array of log objects, or an empty array if nothing has changed since last poll.

- For filters created with `eth_newBlockFilter` the return are block hashes (`string`, 32 Bytes), e.g. `["0x3454645634534..."]`.
- For filters created with `eth_newPendingTransactionFilter ` the return are transaction hashes (`string`, 32 Bytes), e.g. `["0x6345343454645..."]`.
- For filters created with `eth_newFilter` logs are objects with following params:

  - `removed`: `true` when the log was removed, due to a chain reorganization. `false` if its a valid log.
  - `logIndex`: integer of the log index position in the block. `null` when its pending log.
  - `transactionIndex`: integer of the transactions index position log was created from. `null` when its pending log.
  - `transactionHash`: 32 Bytes - hash of the transactions this log was created from. `null` when its pending log.
  - `blockHash`: 32 Bytes - hash of the block where this log was in. `null` when its pending. `null` when its pending log.
  - `blockNumber`: the block number where this log was in. `null` when its pending. `null` when its pending log.
  - `address`: 20 Bytes - address from which this log originated.
  - `data`: contains one or more 32 Bytes non-indexed arguments of the log.
  - `topics`: `Array of string` - Array of 0 to 4, 32 Bytes `string` of indexed log arguments.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getFilterchanges

***

#### eth_getFilterLogs

Returns an array of all logs matching filter with given id.


##### Parameters

1. `string` - The filter id.

##### Returns

See [eth_getFilterChanges](#eth_getfilterchanges)

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterlogs

***

#### eth_getLogs

Returns an array of all logs matching a given filter object.

##### Parameters

1. `json` - the filter object, see [eth_newFilter parameters](#eth_newfilter).

##### Returns

See [eth_getFilterChanges](#eth_getfilterchanges)

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getLogs#eth_getlogs

***

#### eth_getWork

Returns the hash of the current block, the seedHash, and the boundary condition to be met ("target").

##### Parameters
none

##### Returns

`json` - Array with the following properties:
  1. `string`, 32 Bytes - current block header pow-hash
  2. `string`, 32 Bytes - the seed hash used for the DAG.
  3. `string`, 32 Bytes - the boundary condition ("target"), 2^256 / difficulty.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getwork

***

#### eth_submitWork

Used for submitting a proof-of-work solution.


##### Parameters

1. `string`, 8 Bytes - The nonce found (64 bits)
2. `string`, 32 Bytes - The header's pow-hash (256 bits)
3. `string`, 32 Bytes - The mix digest (256 bits)

##### Returns

- returns `true` if the provided solution is valid, otherwise `false`.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submitwork

***

#### eth_submitHashrate

Used for submitting mining hashrate.


##### Parameters

1. `string` - a hexadecimal string representation (32 bytes) of the hash rate 
2. `string` - A random hexadecimal(32 bytes) ID identifying the client

##### Returns

- returns `true` if submitting went through succesfully and `false` otherwise.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submithashrate


***

#### shh_version

Returns the current whisper protocol version.

##### Parameters
none

##### Returns

`string` - The current whisper protocol version

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_version

***

#### shh_post

Sends a whisper message.

##### Parameters

1. `json` - The whisper post object:
  - `from`: 60 Bytes - (optional) The identity of the sender.
  - `to`: 60 Bytes - (optional) The identity of the receiver. When present whisper will encrypt the message so that only the receiver can decrypt it.
  - `topics`: Array of `string` topics, for the receiver to identify messages.
  - `payload`: The payload of the message.
  - `priority`: The integer of the priority in a rang from ... .
  - `ttl`: integer of the time to live in seconds.


##### Returns

- returns `true` if the message was send, otherwise `false`.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_post

***

#### shh_newIdentity

Creates new whisper identity in the client.

##### Parameters
none

##### Returns

- 60 Bytes - the address of the new identiy.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newidentity

***

#### shh_hasIdentity

Checks if the client hold the private keys for a given identity.


##### Parameters

1. `string`, 60 Bytes - The identity address to check.

##### Returns

- returns `true` if the client holds the privatekey for that identity, otherwise `false`.


##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_hasidentity

***

#### shh_newGroup

Creates a new group

##### Parameters
none

##### Returns

- 60 Bytes - the address of the new group.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newgroup

***

#### shh_addToGroup

Adds identities to a group

##### Parameters

1. `string`, 60 Bytes - The identity address to add to a group.

##### Returns

- returns `true` if the identity was successfully added to the group, otherwise `false`.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_addtogroup

***

#### shh_newFilter

Creates filter to notify, when client receives whisper message matching the filter options.


##### Parameters

1. `json` - The filter options:
  - `to`: 60 Bytes - (optional) Identity of the receiver. 
  - `topics`: Array of `string` topics which the incoming message's topics should match.  You can use the following combinations:
    - `[A, B] = A && B`
    - `[A, [B, C]] = A && (B || C)`
    - `[null, A, B] = ANYTHING && A && B` `null` works as a wildcard

##### Returns

- The newly created filter.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newfilter

***

#### shh_uninstallFilter

Uninstalls a filter with given id.


##### Parameters

1. `string` - The filter id.


##### Returns

- `true` if the filter was successfully uninstalled, otherwise `false`.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_uninstallfilter

***

#### shh_getFilterChanges

Polling method for whisper filters. Returns new messages since the last call of this method.


##### Parameters

1. `string` - The filter id.


##### Returns

`json` - Array of messages received since last poll:

  - `hash`: 32 Bytes - The hash of the message.
  - `from`: 60 Bytes - The sender of the message, if a sender was specified.
  - `to`: 60 Bytes - The receiver of the message, if a receiver was specified.
  - `expiry`: Integer of the time in seconds when this message should expire.
  - `ttl`: Integer of the time the message should float in the system in seconds.
  - `sent`: Integer of the unix timestamp when the message was sent.
  - `topics`: Array of `string` topics the message contained.
  - `payload`: The payload of the message.
  - `workProved`: Integer of the work this message required before it was send.

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_getfilterchanges

***

#### shh_getMessages

Get all messages matching a filter. Unlike `shh_getFilterChanges` this returns all messages.

##### Parameters

1. `string` - The filter id.

##### Returns

See [shh_getFilterChanges](#shh_getfilterchanges)

##### Related Ethereum Documentation

https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_getmessages

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

- Copy `connector-ethereum/component/samples/ethereum/sample.bal` file and paste it into `<ballerina-tools>/bin` folder.
- Run the following commands to execute the sample.

`bin$ ./ballerina run sample.bal <URI> <JSONRPCVersion> <NetworkID>`
- eg:
`bin$ ./ballerina run sample.bal http://localhost:8080 2.0 1999`

        



