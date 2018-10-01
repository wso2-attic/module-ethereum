// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/http;

# EthereumConfiguration is used to set up the Ethereum configuration. In order to use this connector, you need
# to provide the valid JSON-RPC endpoint , version and network id.
#
# + jsonRpcVersion - JSON RPC version
# + networkId - The network ID
# + jsonRpcEndpoint - The URI of the Ethereum JSON - RPC server
# + clientConfig - The HTTP client congiguration
public type EthereumConfiguration record {
    string jsonRpcVersion;
    string networkId;
    string jsonRpcEndpoint;
    http:ClientEndpointConfig clientConfig = {};
};

# Ethereum Endpoint object.
#
# + ethereumConfig - Ethereum client endpoint configuration object
# + ethereumConnector - Ethereum connector object
public type Client object {

    public EthereumConfiguration ethereumConfig = {};
    public EthereumConnector ethereumConnector = new;

    # Ethereum endpoint initialization function.
    # + config - Ethereum client endpoint configuration object
    public function init(EthereumConfiguration config);

    # Get Ethereum connector client.
    # + return - Facebook connector client
    public function getCallerActions() returns EthereumConnector;
};

# Ethereum client connector.
#
# + jsonRpcVersion - JSON RPC version
# + networkId - The network ID
# + jsonRpcEndpoint - The URI of the Ethereum JSON - RPC server
# + httpClient - The HTTP Client
public type EthereumConnector object {
    string jsonRpcVersion;
    string networkId;
    string jsonRpcEndpoint;
    public http:Client httpClient = new;

    # Get the current client version.
    #
    # + return - If success, return string, else returns Error
    public function getWeb3ClientVersion() returns string|Error;

    # Get SHA3 string of the given string.
    #
    # data - The data to convert into a SHA3 hash
    # + return - If success, return string, else returns Error
    public function getWeb3Sha3(string data) returns string|Error;

    # Get the current network id.String.
    #   1: Ethereum Mainnet,
    #   2: Morden Testnet (deprecated),
    #   3: Ropsten Testnet,
    #   4: Rinkeby Testnet,
    #   42: Kovan Testnet
    #
    # + return - If success, return string, else returns Error
    public function getNetVersion() returns string|Error;

    # Get the stauts for client is actively listening for network connections.
    #
    # + return - If success, return string, else returns Error
    public function getNetListening() returns boolean|Error;

    # Get the number of peers currently connected to the client.
    #
    # + return- If success, return string, else returns Error
    public function getNetPeerCount() returns string|Error;

    # Get the current ethereum protocol version.
    #
    # + return - If success, return string, else returns Error
    public function getEthProtocolVersion() returns string|Error;

    # Get an object with data about the sync status or false.
    #
    # + return - If success, return string, else returns Error
    public function getEthSyncing() returns string|Error;

    # Get the client coinbase address.
    #
    # + return - If success, return string, else returns Error
    public function getEthCoinbase() returns string|Error;

    # Get the status for client is actively mining new blocks.
    #
    # + return - If success, return string, else returns Error
    public function getEthMining() returns boolean|Error;

    # Get the number of hashes per second that the node is mining with.
    #
    # + return - If success, return string, else returns Error
    public function getEthHashrate() returns string|Error;

    # Get the current price per gas in wei.
    #
    # + return - If success, return string, else returns Error
    public function getEthGasPrice() returns string|Error;

    # Get a list of addresses owned by client.
    #
    # + return - If success, return string, else returns Error
    public function getEthAccounts() returns string|Error;

    # Get the number of most recent block.
    #
    # + return - If success, return string, else returns Error
    public function getEthBlockNumber() returns string|Error;

    # Get the balance of the account of given address.
    #
    # + address - Address to check for balance
    # +block - integer block number(HEX String), or the string "latest", "earliest" or "pending"
    # + return - If success, return string, else returns Error
    public function getEthBalance(string address, string block) returns string|Error;

    # Get the value from a storage position at a given address.
    #
    # + address - Address of the storage
    # + position - Integer of the position in the storage
    # block - Integer block number, or the string "latest", "earliest" or "pending"
    # + return - If success, return string, else returns Error
    public function getEthStorageAt(string address, string position, string block) returns string|Error;

    # Get the number of transactions sent from an address.
    #
    # + address - The address
    # +block - Integer block number, or the string "latest", "earliest" or "pending"
    # + return - If success, return string, else returns Error
    public function getEthTransactionCount( string address, string block) returns string|Error;

    # Get the number of transactions in a block from a block matching the given block hash.
    #
    # + blockHash - The hash of a block
    # + return - If success, return string, else returns Error
    public function getEthBlockTransactionCountByHash(string blockHash) returns string|Error;

    # Gets the number of transactions in a block matching the given block number.
    #
    # + block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return string, else returns Error
    public function getEthBlockTransactionCountByNumber(string block) returns string|Error;

    # Get the number of uncles in a block from a block matching the given block hash.
    #
    # + blockHash - The hash of a block
    # + return - If success, return string, else returns Error
    public function getEthUncleCountByBlockHash(string blockHash) returns string|Error;

    # Get the number of uncles in a block from a block matching the given block number.
    #
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return string, else returns Error
    public function getEthUncleCountByBlockNumber(string block) returns string|Error;

    # Executes a new message call immediately without creating a transaction on the block chain.
    #
    # + address - The address
    # + block  - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return string, else returns Error
    public function getEthCode(string address, string block) returns string|Error;

    # Get the code at a given address.
    #
    # + address - The address
    # + message - The message to sign
    # + return - If success, return string, else returns Error
    public function getEthSign(string address, string message) returns string|Error;

    # Creates new message call transaction or a contract creation, if the data field contains code.
    #
    # + transactionObject - The transaction hash, or the zero hash if the transaction is not yet available
    # + return - If success, return string, else returns Error
    public function sendEthTransaction(json transactionObject) returns string|Error;

    # Creates new message call transaction or a contract creation for signed transactions.
    # + signedTransactionData - the transaction hash, or the zero hash if the transaction is not yet available
    # + return - If success, return string, else returns Error
    public function sendEthRawTransaction(string signedTransactionData) returns string|Error;

    # Executes a new message call immediately without creating a transaction on the block chain.
    #
    # + transactionCallObject - The transaction call object
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return string, else returns Error
    public function getEthCall(json transactionCallObject, string block) returns string|Error;

    # Generates and returns an estimate of how much gas is necessary to allow the transaction to complete.
    #
    # + transactionCallObject - The transaction call object
    # + return - If success, return string, else returns Error
    public function getEthEstimateGas(json transactionCallObject) returns string|Error;

    # Get information about a block by hash.
    #
    # + blockHash - The hash of a block
    # + transactionObjectStatus - If true it returns the full transaction objects,
    #                             if false only the hashes of the transactions
    # + return - If success, return string, else returns Error
    public function getEthBlockByHash(string blockHash, boolean transactionObjectStatus) returns string|Error;

    # Get information about a block by block number.
    #
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # transactionObjectStatus - If true it returns the full transaction objects, if false only the hashes
    #                           of the transactions
    # + return - If success, return string, else returns Error
    public function getEthBlockByNumber(string block, boolean transactionObjectStatus) returns string|Error;

    # Get the information about a transaction requested by transaction hash.
    #
    # + transactionHash - The hash of a transaction
    # + return - If success, return string, else returns Error
    public function getEthTransactionByHash(string transactionHash) returns string|Error;

    # Get the information about a transaction by block hash and transaction index position.
    #
    # + blockHash - The hash of a block
    # + position - Integer of the transaction index position
    # + return - If success, return string, else returns Error
    public function getEthTransactionByBlockHashAndIndex(string blockHash, string position) returns string|Error;

    # Get the information about a transaction by block number and transaction index position.
    #
    # + block - A block number, or the string "earliest", "latest" or "pending"
    # + position - The transaction index position
    # + return - If success, return string, else returns Error
    public function getEthTransactionByBlockNumberAndIndex(string block, string position) returns string|Error;

    # Get the receipt of a transaction by transaction hash.
    #
    # + transactionHash - The hash of a transaction
    # + return - If success, return string, else returns Error
    public function getEthTransactionReceipt(string transactionHash) returns string|Error;

    # Get the information about a uncle of a block by hash and uncle index position.
    #
    # + blockHash - The hash a block
    # + position - The uncle's index position
    # + return - If success, return string, else returns Error
    public function getEthUncleByBlockHashAndIndex(string blockHash, string position) returns string|Error;

    # Get the information about a uncle of a block by number and uncle index position.
    #
    # + block - A block number, or the string "earliest", "latest" or "pending"
    # + position - The uncle's index position
    # + return - If success, return string, else returns Error
    public function getEthUncleByBlockNumberAndIndex(string block, string position) returns string|Error;

    # Creates a filter object, based on filter options, to notify when the state changes (logs).
    #
    # + filterOptions - The filter options
    # + return - If success, return string, else returns Error
    public function ethNewFilter(json filterOptions) returns string|Error;

    # Creates a filter in the node, to notify when a new block arrives.
    #
    # + return - If success, return string, else returns Error
    public function ethNewBlockFilter() returns string|Error;

    # Creates a filter in the node, to notify when new pending transactions arrive.
    #
    # + return - If success, return string, else returns Error
    public function ethNewPendingTransactionFilter() returns string|Error;

    # Uninstalls a filter with given id.
    #
    # + filterId - The filter id
    # + return - If success, return string, else returns Error
    public function uninstallEthFilter(string filterId) returns string|Error;

    # Get an array of logs which occurred since last poll.
    #
    # + filterId - The filter id
    # + return - If success, return string, else returns Error
    public function getEthFilterChanges(string filterId) returns string|Error;

    # Get an array of all logs matching filter with given id.
    #
    # + filterId - The filter id
    # + return - If success, return string, else returns Error
    public function getEthFilterLogs(string filterId) returns string|Error;

    # Get an array of all logs matching a given filter object.
    #
    # + filterOptions - The filter options
    # + return - If success, return string, else returns Error
    public function getEthLogs(json filterOptions) returns string|Error;

    # Get the hash of the current block, the seedHash, and the boundary condition to be met ("target").
    #
    # + return - If success, return string, else returns Error
    public function getEthWork() returns string|Error;

    # Used for submitting a proof-of-work solution.
    #
    # + nonce - The nonce found (64 bits)
    # + powHash - The header's pow-hash (256 bits)
    # + mixDigest - The mix digest (256 bits)
    # + return - If success, return string, else returns Error
    public function submitEthWork(string nonce, string powHash, string mixDigest) returns string|Error;

    # Generic method for Ethereum RPC.
    #
    # + method - The method name
    # + params - The parameter array
    # + return - If success, return string, else returns Error.
    public function remoteProcedureCall(string method, json params) returns string|Error;
};

# Ethereum error.
#
# + message - Error message.
# + cause - The error which caused the Ethereum error.
# + statusCode - The status code.
public type Error record {
    string message;
    error? cause;
    int statusCode;
};

# Define the string type.
#
# + string - The string of the ethererum operation.
public type string record {
    string string;
};
