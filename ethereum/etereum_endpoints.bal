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

import ballerina/config;

# Ethereum Client object.
# + ethereumConnector - EthereumConnector Connector object
public type Client client object {

    public EthereumConnector ethereumConnector;

    public function __init(EthereumConfiguration ethereumConfig) {
        string jsonRpcEndpoint = ethereumConfig.jsonRpcEndpoint;
        self.ethereumConnector = new(jsonRpcEndpoint, ethereumConfig);
    }

    # Get the current client version.
    #
    # + return - If success, return the output, else returns error
    remote function getWeb3ClientVersion() returns string|error {
        return self.ethereumConnector->getWeb3ClientVersion();
    }

    # Get SHA3 string of the given string.
    #
    # data - The data to convert into a SHA3 hash
    # + return - If success, return the output, else returns error
    remote function getWeb3Sha3(string data) returns string|error {
        return self.ethereumConnector->getWeb3Sha3(data);
    }

    # Get the current network id.String.
    #   1: Ethereum Mainnet,
    #   2: Morden Testnet (deprecated),
    #   3: Ropsten Testnet,
    #   4: Rinkeby Testnet,
    #   42: Kovan Testnet
    #
    # + return - If success, return the output, else returns error
    remote function getNetVersion() returns string|error {
        return self.ethereumConnector->getNetVersion();
    }

    # Get the stauts for client is actively listening for network connections.
    #
    # + return - If success, return the output, else returns error
    remote function getNetListening() returns boolean|error {
        return self.ethereumConnector->getNetListening();
    }

    # Get the number of peers currently connected to the client.
    #
    # + return- If success, return the output, else returns error
    remote function getNetPeerCount() returns string|error {
        return self.ethereumConnector->getNetPeerCount();
    }

    # Get the current ethereum protocol version.
    #
    # + return - If success, return the output, else returns error
    remote function getEthProtocolVersion() returns string|error {
        return self.ethereumConnector->getEthProtocolVersion();
    }

    # Get an object with data about the sync status or false.
    #
    # + return - If success, return the output, else returns error
    remote function getEthSyncing() returns string|error {
        return self.ethereumConnector->getEthSyncing();
    }

    # Get the client coinbase address.
    #
    # + return - If success, return the output, else returns error
    remote function getEthCoinbase() returns string|error {
        return self.ethereumConnector->getEthCoinbase();
    }

    # Get the status for client is actively mining new blocks.
    #
    # + return - If success, return the output, else returns error
    remote function getEthMining() returns boolean|error {
        return self.ethereumConnector->getEthMining();
    }

    # Get the number of hashes per second that the node is mining with.
    #
    # + return - If success, return the output, else returns error
    remote function getEthHashrate() returns string|error {
        return self.ethereumConnector->getEthHashrate();
    }

    # Get the current price per gas in wei.
    #
    # + return - If success, return the output, else returns error
    remote function getEthGasPrice() returns string|error {
        return self.ethereumConnector->getEthGasPrice();
    }

    # Get a list of addresses owned by client.
    #
    # + return - If success, return the output, else returns error
    remote function getEthAccounts() returns string|error {
        return self.ethereumConnector->getEthAccounts();
    }

    # Get the number of most recent block.
    #
    # + return - If success, return the output, else returns error
    remote function getEthBlockNumber() returns string|error {
        return self.ethereumConnector->getEthBlockNumber();
    }

    # Get the balance of the account of given address.
    #
    # + address - Address to check for balance
    # +block - integer block number(HEX String), or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    remote function getEthBalance(string address, string block) returns string|error {
        return self.ethereumConnector->getEthBalance(address, block);
    }

    # Get the value from a storage position at a given address.
    #
    # + address - Address of the storage
    # + position - Integer of the position in the storage
    # block - Integer block number, or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    remote function getEthStorageAt(string address, string position, string block) returns string|error {
        return self.ethereumConnector->getEthStorageAt(address, position, block);
    }

    # Get the number of transactions sent from an address.
    #
    # + address - The address
    # +block - Integer block number, or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    remote function getEthTransactionCount( string address, string block) returns string|error {
        return self.ethereumConnector->getEthTransactionCount(address, block);
    }

    # Get the number of transactions in a block from a block matching the given block hash.
    #
    # + blockHash - The hash of a block
    # + return - If success, return the output, else returns error
    remote function getEthBlockTransactionCountByHash(string blockHash) returns string|error {
        return self.ethereumConnector->getEthBlockTransactionCountByHash(blockHash);
    }

    # Gets the number of transactions in a block matching the given block number.
    #
    # + block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    remote function getEthBlockTransactionCountByNumber(string block) returns string|error {
        return self.ethereumConnector->getEthBlockTransactionCountByNumber(block);
    }

    # Get the number of uncles in a block from a block matching the given block hash.
    #
    # + blockHash - The hash of a block
    # + return - If success, return the output, else returns error
    remote function getEthUncleCountByBlockHash(string blockHash) returns string|error {
        return self.ethereumConnector->getEthUncleCountByBlockHash(blockHash);
    }

    # Get the number of uncles in a block from a block matching the given block number.
    #
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    remote function getEthUncleCountByBlockNumber(string block) returns string|error {
        return self.ethereumConnector->getEthUncleCountByBlockNumber(block);
    }

    # Executes a new message call immediately without creating a transaction on the block chain.
    #
    # + address - The address
    # + block  - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    remote function getEthCode(string address, string block) returns string|error {
        return self.ethereumConnector->getEthCode(address, block);
    }

    # Get the code at a given address.
    #
    # + address - The address
    # + message - The message to sign
    # + return - If success, return the output, else returns error
    remote function getEthSign(string address, string message) returns string|error {
        return self.ethereumConnector->getEthSign(address, message);
    }

    # Creates new message call transaction or a contract creation, if the data field contains code.
    #
    # + transactionObject - The transaction hash, or the zero hash if the transaction is not yet available
    # + return - If success, return the output, else returns error
    remote function sendEthTransaction(json transactionObject) returns string|error {
        return self.ethereumConnector->sendEthTransaction(transactionObject);
    }

    # Creates new message call transaction or a contract creation for signed transactions.
    # + signedTransactionData - the transaction hash, or the zero hash if the transaction is not yet available
    # + return - If success, return the output, else returns error
    remote function sendEthRawTransaction(string signedTransactionData) returns string|error {
        return self.ethereumConnector->sendEthRawTransaction(signedTransactionData);
    }

    # Executes a new message call immediately without creating a transaction on the block chain.
    #
    # + transactionCallObject - The transaction call object
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    remote function getEthCall(json transactionCallObject, string block) returns string|error {
        return self.ethereumConnector->getEthCall(transactionCallObject, block);
    }

    # Generates and returns an estimate of how much gas is necessary to allow the transaction to complete.
    #
    # + transactionCallObject - The transaction call object
    # + return - If success, return the output, else returns error
    remote function getEthEstimateGas(json transactionCallObject) returns string|error {
        return self.ethereumConnector->getEthEstimateGas(transactionCallObject);
    }

    # Get information about a block by hash.
    #
    # + blockHash - The hash of a block
    # + transactionObjectStatus - If true it returns the full transaction objects,
    #                             if false only the hashes of the transactions
    # + return - If success, return the output, else returns error
    remote function getEthBlockByHash(string blockHash, boolean transactionObjectStatus) returns string|error {
        return self.ethereumConnector->getEthBlockByHash(blockHash, transactionObjectStatus);
    }
    # Get information about a block by block number.
    #
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # transactionObjectStatus - If true it returns the full transaction objects, if false only the hashes
    #                           of the transactions
    # + return - If success, return the output, else returns error
    remote function getEthBlockByNumber(string block, boolean transactionObjectStatus) returns string|error {
        return self.ethereumConnector->getEthBlockByNumber(block, transactionObjectStatus);
    }

    # Get the information about a transaction requested by transaction hash.
    #
    # + transactionHash - The hash of a transaction
    # + return - If success, return the output, else returns error
    remote function getEthTransactionByHash(string transactionHash) returns string|error {
        return self.ethereumConnector->getEthTransactionByHash(transactionHash);
    }

    # Get the information about a transaction by block hash and transaction index position.
    #
    # + blockHash - The hash of a block
    # + position - Integer of the transaction index position
    # + return - If success, return the output, else returns error
    remote function getEthTransactionByBlockHashAndIndex(string blockHash, string position) returns string|error {
        return self.ethereumConnector->getEthTransactionByBlockHashAndIndex(blockHash, position);
    }

    # Get the information about a transaction by block number and transaction index position.
    #
    # + block - A block number, or the string "earliest", "latest" or "pending"
    # + position - The transaction index position
    # + return - If success, return the output, else returns error
    remote function getEthTransactionByBlockNumberAndIndex(string block, string position) returns string|error {
        return self.ethereumConnector->getEthTransactionByBlockNumberAndIndex(block, position);
    }

    # Get the receipt of a transaction by transaction hash.
    #
    # + transactionHash - The hash of a transaction
    # + return - If success, return the output, else returns error
    remote function getEthTransactionReceipt(string transactionHash) returns string|error {
        return self.ethereumConnector->getEthTransactionReceipt(transactionHash);
    }

    # Get the information about a uncle of a block by hash and uncle index position.
    #
    # + blockHash - The hash a block
    # + position - The uncle's index position
    # + return - If success, return the output, else returns error
    remote function getEthUncleByBlockHashAndIndex(string blockHash, string position) returns string|error {
        return self.ethereumConnector->getEthUncleByBlockHashAndIndex(blockHash, position);
    }

    # Get the information about a uncle of a block by number and uncle index position.
    #
    # + block - A block number, or the string "earliest", "latest" or "pending"
    # + position - The uncle's index position
    # + return - If success, return the output, else returns error
    remote function getEthUncleByBlockNumberAndIndex(string block, string position) returns string|error {
        return self.ethereumConnector->getEthUncleByBlockNumberAndIndex(block, position);
    }
    # Creates a filter object, based on filter options, to notify when the state changes (logs).
    #
    # + filterOptions - The filter options
    # + return - If success, return the output, else returns error
    remote function ethNewFilter(json filterOptions) returns string|error {
        return self.ethereumConnector->ethNewFilter(filterOptions);
    }

    # Creates a filter in the node, to notify when a new block arrives.
    #
    # + return - If success, return the output, else returns error
    remote function ethNewBlockFilter() returns string|error {
        return self.ethereumConnector->ethNewBlockFilter();
    }

    # Creates a filter in the node, to notify when new pending transactions arrive.
    #
    # + return - If success, return the output, else returns error
    remote function ethNewPendingTransactionFilter() returns string|error {
        return self.ethereumConnector->ethNewPendingTransactionFilter();
    }

    # Uninstalls a filter with given id.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    remote function uninstallEthFilter(string filterId) returns string|error {
        return self.ethereumConnector->uninstallEthFilter(filterId);
    }

    # Get an array of logs which occurred since last poll.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    remote function getEthFilterChanges(string filterId) returns string|error {
        return self.ethereumConnector->getEthFilterChanges(filterId);
    }

    # Get an array of all logs matching filter with given id.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    remote function getEthFilterLogs(string filterId) returns string|error {
        return self.ethereumConnector->getEthFilterLogs(filterId);
    }

    # Get an array of all logs matching a given filter object.
    #
    # + filterOptions - The filter options
    # + return - If success, return the output, else returns error
    remote function getEthLogs(json filterOptions) returns string|error {
        return self.ethereumConnector->getEthLogs(filterOptions);
    }

    # Get the hash of the current block, the seedHash, and the boundary condition to be met ("target").
    #
    # + return - If success, return the output, else returns error
    remote function getEthWork() returns string|error {
        return self.ethereumConnector->getEthWork();
    }

    # Used for submitting a proof-of-work solution.
    #
    # + nonce - The nonce found (64 bits)
    # + powHash - The header's pow-hash (256 bits)
    # + mixDigest - The mix digest (256 bits)
    # + return - If success, return the output, else returns error
    remote function submitEthWork(string nonce, string powHash, string mixDigest) returns string|error {
        return self.ethereumConnector->submitEthWork(nonce, powHash, mixDigest);
    }

    # Generic method for Ethereum RPC.
    #
    # + method - The method name
    # + params - The parameter array
    # + return - If success, return the output, else returns error.
    remote function remoteProcedureCall(string method, json params) returns string|error {
        return self.ethereumConnector->remoteProcedureCall(method, params);
    }
};
