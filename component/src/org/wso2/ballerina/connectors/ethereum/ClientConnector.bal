//
// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//

package org.wso2.ballerina.connectors.ethereum;

import ballerina.net.http;

const string WEB3_CLIENT_VERSION = "web3_clientVersion";
const string WEB3_SHA3 = "web3_sha3";
const string NET_VERSION = "net_version";
const string NET_LISTENING = "net_listening";
const string NET_PEER_COUNT = "net_peerCount";
const string ETH_PROTOCOL_VERSION = "eth_protocolVersion";
const string ETH_SYNCING = "eth_syncing";
const string ETH_COINBASE = "eth_coinbase";
const string ETH_MINING = "eth_mining";
const string ETH_HASHRATE = "eth_hashrate";
const string ETH_GAS_PRICE = "eth_gasPrice";
const string ETH_ACCOUNTS = "eth_accounts";
const string ETH_BLOCK_NUMBER = "eth_blockNumber";
const string ETH_GET_BALANCE = "eth_getBalance";
const string ETH_GET_STORAGEAT = "eth_getStorageAt";
const string ETH_GET_TRANSACTION_COUNT = "eth_getTransactionCount";
const string ETH_GET_BLOCK_TRANSACTION_COUNT_BY_HASH = "eth_getBlockTransactionCountByHash";
const string ETH_GET_BLOCK_TRANSACTION_COUNT_BY_NUMBER = "eth_getBlockTransactionCountByNumber";
const string ETH_GET_UNCLE_COUNT_BY_BLOCK_HASH = "eth_getUncleCountByBlockHash";
const string ETH_GET_UNCLE_COUNT_BY_BLOCK_NUMBER = "eth_getUncleCountByBlockNumber";
const string ETH_GET_CODE = "eth_getCode";
const string ETH_SIGN = "eth_sign";
const string ETH_SEND_TRANSACTION = "eth_sendTransaction";
const string ETH_SEND_RAW_TRANSACTION = "eth_sendRawTransaction";
const string ETH_CALL = "eth_call";
const string ETH_ESTIMATE_GAS = "eth_estimateGas";
const string ETH_GET_BLOCK_BY_HASH = "eth_getBlockByHash";
const string ETH_GET_BLOCK_BY_NUMBER = "eth_getBlockByNumber";
const string ETH_GET_TRANSACTION_BY_HASH = "eth_getTransactionByHash";
const string ETH_GET_TRANSACTION_BY_BLOCK_HASH_AND_INDEX = "eth_getTransactionByBlockHashAndIndex";
const string ETH_GET_TRANSACTION_BY_BLOCK_NUMBER_AND_INDEX = "eth_getTransactionByBlockNumberAndIndex";
const string ETH_GET_TRANSACTION_RECEIPT = "eth_getTransactionReceipt";
const string ETH_GET_UNCLE_BY_BLOCK_HASH_AND_INDEX = "eth_getUncleByBlockHashAndIndex";
const string ETH_GET_UNCLE_BY_BLOCK_NUMBER_AND_INDEX = "eth_getUncleByBlockNumberAndIndex";
const string ETH_GET_COMPILERS = "eth_getCompilers";
const string ETH_COMPILELLL = "eth_compileLLL";
const string ETH_COMPILE_SOLIDITY = "eth_compileSolidity";
const string ETH_COMPILE_SERPENT = "eth_compileSerpent";
const string ETH_NEW_FILTER = "eth_newFilter";
const string ETH_NEW_BLOCK_FILTER = "eth_newBlockFilter";
const string ETH_NEW__PENDING_TRANSACTION_FILTER = "eth_newPendingTransactionFilter";
const string ETH_UNINSTALL_FILTER = "eth_uninstallFilter";
const string ETH_GET_FILTER_CHANGES = "eth_getFilterChanges";
const string ETH_GET_FILTER_LOGS = "eth_getFilterLogs";
const string ETH_GET_LOGS = "eth_getLogs";
const string ETH_GET_WORK = "eth_getWork";
const string ETH_SUBMIT_WORK = "eth_submitWork";
const string ETH_SUBMIT_HASHRATE = "eth_submitHashrate";
const string EMPTY_PARAMS = "[]";

@Description {value:"Ethereum client connector"}
@Param {value:"URI: URI of the Ethereum JSON - RPC server"}
public connector ClientConnector (string URI, http:Options options, string jsonRPCVersion, int id) {

    endpoint<http:HttpClient> ethereumEP {
        create http:HttpClient(URI, options);
    }

    @Description {value:"Returns the current client version"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action web3ClientVersion () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, WEB3_CLIENT_VERSION, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns Keccak-256 (not the standardized SHA3-256) of the given data"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"data: the data to convert into a SHA3 hash"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action web3Sha3 (string data) (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, WEB3_SHA3, [data]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the current network id.String - The current network id.
        1: Ethereum Mainnet,
        2: Morden Testnet (deprecated),
        3: Ropsten Testnet,
        4: Rinkeby Testnet,
        42: Kovan Testnet"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action netVersion () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, NET_VERSION, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns true if client is actively listening for network connections, otherwise false"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action netListening () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, NET_LISTENING, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns number of peers currently connected to the client"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action netPeerCount () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, NET_PEER_COUNT, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the current ethereum protocol version"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethProtocolVersion () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_PROTOCOL_VERSION, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns an object with data about the sync status or false"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethSyncing () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_SYNCING, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the client coinbase address"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethCoinbase () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_COINBASE, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns true if client is actively mining new blocks"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethMining () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_MINING, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the number of hashes per second that the node is mining with"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethHashrate () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_HASHRATE, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the current price per gas in wei"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGasPrice () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GAS_PRICE, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns a list of addresses owned by client"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethAccounts () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_ACCOUNTS, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the number of most recent block"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethBlockNumber () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_BLOCK_NUMBER, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the balance of the account of given address"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"accountAddress: 20 Bytes - address to check for balance"}
    @Param {value:"block: Hex value block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetBalance (string address, string block)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_BALANCE, [address, block]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the value from a storage position at a given address"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"address: 20 Bytes - address to check for balance"}
    @Param {value:"position: Hex value of the position in the storage"}
    @Param {value:"block:  Hex value block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetStorageAt (string address, string position, string block)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_STORAGEAT,
                                                                [address, position, block]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the number of transactions sent from an address"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"address: 20 Bytes - address to check for balance"}
    @Param {value:"block: Hex value block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetTransactionCount (string address, string block)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_TRANSACTION_COUNT,
                                                                [address, block]));
        return response.getJsonPayload(), e;
    }


    @Description {value:"Returns the number of transactions in a block from a block matching the given block hash"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"hash: 32 Bytes - hash of a block"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetBlockTransactionCountByHash (string hash)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                                ETH_GET_BLOCK_TRANSACTION_COUNT_BY_HASH,
                                                                [hash]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the number of transactions in a block matching the given block number"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"block: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetBlockTransactionCountByNumber (string block)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                                ETH_GET_BLOCK_TRANSACTION_COUNT_BY_NUMBER, [block]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the number of uncles in a block from a block matching the given block hash"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"hash: 32 Bytes - hash of a block"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetUncleCountByBlockHash (string hash)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_UNCLE_COUNT_BY_BLOCK_HASH,
                                                                [hash]));
        return response.getJsonPayload(), e;
    }

    @Description {value:""}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"block: Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetUncleCountByBlockNumber (string block)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_UNCLE_COUNT_BY_BLOCK_NUMBER,
                                                                [block]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns code at a given address"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"address: 20 Bytes - address"}
    @Param {value:"block: Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetCode (string address, string block)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_CODE, [address, block]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"The sign method calculates an Ethereum specific signature with"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"address: 20 Bytes - address"}
    @Param {value:"message: message to sign"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethSign (string address, string message)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_SIGN, [address, message]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Creates a message call transaction or a contract creation, if the data field contains code"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"transactionObject: The transaction object
        from: DATA, 20 Bytes - The address the transaction is send from.
        to: DATA, 20 Bytes - (optional when creating new contract) The address the transaction is directed to.
        gas: QUANTITY - (optional, default: 90000) Hex value of the gas provided for the transaction execution.
        gasPrice: QUANTITY - (optional, default: To-Be-Determined) Hex value of the gasPrice used for each paid gas
        value: QUANTITY - (optional) Hex value of the value send with this transaction
        data: DATA - The compiled code of a contract OR the hash of the invoked method signature and encoded parameters.
        nonce: QUANTITY - (optional) Hex value of a nonce"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethSendTransaction (json transactionObject)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_SEND_TRANSACTION,
                                                                [transactionObject]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Creates new message call transaction or a contract creation for signed transactions"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"signedTransactionData:  The signed transaction data"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethSendRawTransaction (string signedTransactionData)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_SEND_RAW_TRANSACTION,
                                                                [signedTransactionData]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Executes a new message call immediately without creating a transaction on the block chain"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"transactionCallObject: The transaction call object
        from: DATA, 20 Bytes - (optional) The address the transaction is sent from.
        to: DATA, 20 Bytes - The address the transaction is directed to.
        gas: QUANTITY - (optional) Hex value of the gas provided for the transaction execution.
            eth_call consumes zero gas, but this parameter may be needed by some executions.
        gasPrice: QUANTITY - (optional) Hex value of the gasPrice used for each paid gas
        value: QUANTITY - (optional) Hex value of the value send with this transaction
        data: DATA - (optional) Hash of the method signature and encoded parameters"}
    @Param {value:"block: Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethCall (json transactionCallObject, string block)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_CALL,
                                                                [transactionCallObject, block]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Makes a call or transaction, which won't be added to the blockchain and returns the used gas,
        which can be used for estimating the used gas"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"transactionCallObject: The transaction call object
        from: DATA, 20 Bytes - The address the transaction is sent from.
        to: DATA, 20 Bytes - The address the transaction is directed to.
        gas: QUANTITY -  Hex value of the gas provided for the transaction execution.
        gasPrice: QUANTITY -  Hex value of the gasPrice used for each paid gas
        value: QUANTITY -  Hex value of the value send with this transaction
        data: DATA - (optional) Hash of the method signature and encoded parameters"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethEstimateGas (json transactionCallObject)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_ESTIMATE_GAS,
                                                                [transactionCallObject]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns information about a block by hash"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"hash: 32 Bytes - Hash of a block"}
    @Param {value:"fullTransaction: If true it returns the full transaction objects,
        if false only the hashes of the transactions"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetBlockByHash (string hash, boolean fullTransaction)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_BLOCK_BY_HASH,
                                                                [hash, fullTransaction]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns information about a block by block number"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"block: Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Param {value:"fullTransaction: If true it returns the full transaction objects,
        if false only the hashes of the transactions"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetBlockByNumber (string block, boolean fullTransaction)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_BLOCK_BY_NUMBER,
                                                                [block, fullTransaction]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the information about a transaction requested by transaction hash"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"hash: 32 Bytes - hash of a transaction"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetTransactionByHash (string hash)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_TRANSACTION_BY_HASH,
                                                                [hash]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns information about a transaction by block hash and transaction index position"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"hash: 32 Bytes - hash of a transaction"}
    @Param {value:"position: Hex value of the transaction index position"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetTransactionByBlockHashAndIndex (string hash, string position)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                                ETH_GET_TRANSACTION_BY_BLOCK_HASH_AND_INDEX,
                                                                [hash, position]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns information about a transaction by block number and transaction index position"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"block: Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Param {value:"position: Hex value of the transaction index position"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetTransactionByBlockNumberAndIndex (string block, string position)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                                ETH_GET_TRANSACTION_BY_BLOCK_NUMBER_AND_INDEX,
                                                                [block, position]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the receipt of a transaction by transaction hash"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"hash: 32 Bytes - hash of a transaction"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetTransactionReceipt (string hash)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                                ETH_GET_TRANSACTION_RECEIPT, [hash]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns information about a uncle of a block by hash and uncle index position"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"hash: 32 Bytes - hash of a transaction"}
    @Param {value:"position:  The uncle's index position"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetUncleByBlockHashAndIndex (string hash, string position)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_UNCLE_BY_BLOCK_HASH_AND_INDEX,
                                                                [hash, position]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns information about a uncle of a block by number and uncle index position"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"block: Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Param {value:"position:  The uncle's index position"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetUncleByBlockNumberAndIndex (string block, string position)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_UNCLE_BY_BLOCK_NUMBER_AND_INDEX,
                                                                [block, position]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns a list of available compilers in the client"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetCompilers () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_COMPILERS, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns compiled solidity code"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"source: The source code"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethCompileSolidity (string source) (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_COMPILE_SOLIDITY, [source]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns compiled LLL code"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"source: The source code"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethCompileLLL (string source) (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_COMPILELLL, [source]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns compiled serpent code"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"source: The source code"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethCompileSerpent (string source) (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_COMPILE_SERPENT, [source]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Creates a filter object, based on filter options, to notify when the state changes (logs)"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"filterOptions:  The filter options"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethNewFilter (json filterOptions) (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_NEW_FILTER, [filterOptions]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Creates a filter in the node, to notify when a new block arrives"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethNewBlockFilter () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_NEW_BLOCK_FILTER, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Creates a filter in the node, to notify when new pending transactions arrive"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethNewPendingTransactionFilter () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_NEW__PENDING_TRANSACTION_FILTER,
                                                                EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Uninstalls a filter with given id"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"filterId: The filter id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethUninstallFilter (string filterId) (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_UNINSTALL_FILTER, [filterId]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Polling method for a filter, which returns an array of logs which occurred since last poll"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"filterId: The filter id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetFilterChanges (string filterId)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_FILTER_CHANGES, [filterId]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns an array of all logs matching filter with given id"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"filterId: The filter id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetFilterLogs (string filterId) (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_FILTER_LOGS, [filterId]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns an array of all logs matching a given filter object"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"filterObject: The filter object"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetLogs (json filterObject) (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_LOGS, [filterObject]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Returns the hash of the current block, the seedHash, and the boundary condition to be met
        ('target')"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethGetWork () (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_GET_WORK, EMPTY_PARAMS));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Used for submitting a proof-of-work solution"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"nonce: 8 Bytes - The nonce found"}
    @Param {value:"powHash: 32 Bytes - The header's pow-hash"}
    @Param {value:"mixDigest: 32 Bytes - The mix digest"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethSubmitWork (string nonce, string powHash, string mixDigest)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_SUBMIT_WORK,
                                                                [nonce, powHash, mixDigest]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Used for submitting mining hashrate"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"hashrate: Hexadecimal string representation (32 bytes) of the hash rate"}
    @Param {value:"clientId: Random hexadecimal(32 bytes) ID identifying the client"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action ethSubmitHashrate (string hashrate, string clientId)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ETH_SUBMIT_HASHRATE,
                                                                [hashrate, clientId]));
        return response.getJsonPayload(), e;
    }

    @Description {value:"Generic method for Ethereum RPC"}
    @Param {value:"jsonRPCVersion: JSON RPC version"}
    @Param {value:"id: Network id"}
    @Param {value:"method: Method name"}
    @Param {value:"params: parameter array"}
    @Return {value:"InResponse object"}
    @Return {value:"Error occured during HTTP client invocation"}
    action remoteProcedureCall (string method, json params)
    (json, http:HttpConnectorError) {
        var response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, method, params));
        return response.getJsonPayload(), e;
    }
}

function constructRequest (string jsonRPCVersion, int id, string method, json params) (http:OutRequest) {
    http:OutRequest request = {};
    request.setHeader("Content-Type", "application/json");
    request.setJsonPayload({"jsonrpc":jsonRPCVersion, "id":id, "method":method, "params":params});
    return request;
}
