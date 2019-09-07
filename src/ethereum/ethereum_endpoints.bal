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
import ballerina/ 'lang\.int as ints;
import ballerina/log;

# Ethereum Client object.
# + jsonRpcVersion - JSON RPC version
# + networkId - The network ID
# + jsonRpcEndpoint - The URI of the Ethereum JSON - RPC server
# + ethereumClient - HTTP Client endpoint
public type Client client object {

    http:Client ethereumClient;
    public string jsonRpcVersion;
    public int networkId = 0;
    public string jsonRpcEndpoint;

    public function __init(EthereumConfiguration ethereumConfig) {
        string jsonRpcEndpoint = ethereumConfig.jsonRpcEndpoint;
        http:ClientSecureSocket? result = ethereumConfig?.secureSocketConfig;
        
        // Create spreadsheet ethereum client.
        if (result is http:ClientSecureSocket) {
            self.ethereumClient = new (jsonRpcEndpoint, {
                secureSocket: result
            });
        } else {
            self.ethereumClient = new (jsonRpcEndpoint, {});
        }
        
        self.jsonRpcVersion = ethereumConfig.jsonRpcVersion;
        self.jsonRpcEndpoint = ethereumConfig.jsonRpcEndpoint;
        int | error value = ints:fromString(ethereumConfig.networkId);
        if (value is int) {
            self.networkId = value;
        }
    }

    # Get the current client version.
    #
    # + return - If success, return the output, else returns error
    public remote function getWeb3ClientVersion() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        WEB3_CLIENT_VERSION, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get SHA3 string of the given string.
    #
    # + data - The data to convert into a SHA3 hash
    # + return - If success, return the output, else returns error
    public remote function getWeb3Sha3(string data) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId, WEB3_SHA3,
        [data]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the current network id.String.
    #   1: Ethereum Mainnet,
    #   2: Morden Testnet (deprecated),
    #   3: Ropsten Testnet,
    #   4: Rinkeby Testnet,
    #   42: Kovan Testnet
    #
    # + return - If success, return the output, else returns error
    public remote function getNetVersion() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        NET_VERSION, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the number of peers currently connected to the 
    #
    # + return- If success, return the output, else returns error
    public remote function getNetPeerCount() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        NET_PEER_COUNT, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the stauts for client is actively listening for network connections.
    #
    # + return - If success, return the output, else returns error
    public remote function getNetListening() returns @tainted boolean | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        NET_LISTENING, EMPTY_PARAMS));
        return check jsonToBoolean(<@untainted>checkAndSetErrors(httpResponse));
    }

    # Get the current ethereum protocol version.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthProtocolVersion() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_PROTOCOL_VERSION, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get an object with data about the sync status or false.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthSyncing() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_SYNCING, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the client coinbase address.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthCoinbase() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_COINBASE, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the status for client is actively mining new blocks.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthMining() returns @tainted boolean | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_MINING, EMPTY_PARAMS));
        return check jsonToBoolean(<@untainted>checkAndSetErrors(httpResponse));
    }

    # Get the number of hashes per second that the node is mining with.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthHashrate() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_HASHRATE, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the current price per gas in wei.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthGasPrice() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion,
        self.networkId, ETH_GAS_PRICE, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get a list of addresses owned by client.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthAccounts() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_ACCOUNTS, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the number of most recent block.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthBlockNumber() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_BLOCK_NUMBER, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the balance of the account of given address.
    #
    # + address - Address to check for balance
    # +block - integer block number(HEX String), or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthBalance(string address, string block) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_BALANCE, [address, block]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the value from a storage position at a given address.
    #
    # + address - Address of the storage
    # + position - Integer of the position in the storage
    # + block - Integer block number, or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthStorageAt(string address, string position, string block)
    returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_STORAGEAT, [address, position, block]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the number of transactions sent from an address.
    #
    # + address - The address
    # +block - Integer block number, or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionCount(string address, string block) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_TRANSACTION_COUNT, [address, block]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the number of transactions in a block from a block matching the given block hash.
    #
    # + blockHash - The hash of a block
    # + return - If success, return the output, else returns error
    public remote function getEthBlockTransactionCountByHash(string blockHash) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_BLOCK_TRANSACTION_COUNT_BY_HASH, [blockHash]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Gets the number of transactions in a block matching the given block number.
    #
    # + block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthBlockTransactionCountByNumber(string block) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_BLOCK_TRANSACTION_COUNT_BY_NUMBER, [block]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the number of uncles in a block from a block matching the given block hash.
    #
    # + blockHash - The hash of a block
    # + return - If success, return the output, else returns error
    public remote function getEthUncleCountByBlockHash(string blockHash) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_UNCLE_COUNT_BY_BLOCK_HASH, [blockHash]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the number of uncles in a block from a block matching the given block number.
    #
    # + block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthUncleCountByBlockNumber(string block) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_UNCLE_COUNT_BY_BLOCK_NUMBER, [block]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Executes a new message call immediately without creating a transaction on the block chain.
    #
    # + address - The address
    # + block  - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthCode(string address, string block) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_CODE, [address, block]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the code at a given address.
    #
    # + address - The address
    # + message - The message to sign
    # + return - If success, return the output, else returns error
    public remote function getEthSign(string address, string message) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_SIGN, [address, message]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Creates new message call transaction or a contract creation, if the data field contains code.
    #
    # + transactionObject - The transaction hash, or the zero hash if the transaction is not yet available
    # + return - If success, return the output, else returns error
    public remote function sendEthTransaction(json transactionObject) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_SEND_TRANSACTION, [transactionObject]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Creates new message call transaction or a contract creation for signed transactions.
    # + signedTransactionData - the transaction hash, or the zero hash if the transaction is not yet available
    # + return - If success, return the output, else returns error
    public remote function sendEthRawTransaction(string signedTransactionData) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_SEND_RAW_TRANSACTION, [signedTransactionData]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Executes a new message call immediately without creating a transaction on the block chain.
    #
    # + transactionCallObject - The transaction call object
    # + block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthCall(json transactionCallObject, string block) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion,
        self.networkId, ETH_CALL, [transactionCallObject, block]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Generates and returns an estimate of how much gas is necessary to allow the transaction to complete.
    #
    # + transactionCallObject - The transaction call object
    # + return - If success, return the output, else returns error
    public remote function getEthEstimateGas(json transactionCallObject) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_ESTIMATE_GAS, [transactionCallObject]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get information about a block by hash.
    #
    # + blockHash - The hash of a block
    # + transactionObjectStatus - If true it returns the full transaction objects,
    #                             if false only the hashes of the transactions
    # + return - If success, return the output, else returns error
    public remote function getEthBlockByHash(string blockHash, boolean transactionObjectStatus)
    returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_BLOCK_BY_HASH, [blockHash, transactionObjectStatus]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get information about a block by block number.
    #
    # + block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + transactionObjectStatus - If true it returns the full transaction objects, if false only the hashes
    #                           of the transactions
    # + return - If success, return the output, else returns error
    public remote function getEthBlockByNumber(string block, boolean transactionObjectStatus)
    returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_BLOCK_BY_NUMBER, [block, transactionObjectStatus]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the information about a transaction requested by transaction hash.
    #
    # + transactionHash - The hash of a transaction
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionByHash(string transactionHash) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion,
        self.networkId, ETH_GET_TRANSACTION_BY_HASH, [transactionHash]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the information about a transaction by block hash and transaction index position.
    #
    # + blockHash - The hash of a block
    # + position - Integer of the transaction index position
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionByBlockHashAndIndex(string blockHash, string position)
    returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_TRANSACTION_BY_BLOCK_HASH_AND_INDEX, [blockHash, position]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the information about a transaction by block number and transaction index position.
    #
    # + block - A block number, or the string "earliest", "latest" or "pending"
    # + position - The transaction index position
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionByBlockNumberAndIndex(string block, string position)
    returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_TRANSACTION_BY_BLOCK_NUMBER_AND_INDEX, [block, position]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the receipt of a transaction by transaction hash.
    #
    # + transactionHash - The hash of a transaction
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionReceipt(string transactionHash) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_TRANSACTION_RECEIPT, [transactionHash]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the information about a uncle of a block by hash and uncle index position.
    #
    # + blockHash - The hash a block
    # + position - The uncle's index position
    # + return - If success, return the output, else returns error
    public remote function getEthUncleByBlockHashAndIndex(string blockHash, string position)
    returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_UNCLE_BY_BLOCK_HASH_AND_INDEX, [blockHash, position]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the information about a uncle of a block by number and uncle index position.
    #
    # + block - A block number, or the string "earliest", "latest" or "pending"
    # + position - The uncle's index position
    # + return - If success, return the output, else returns error
    public remote function getEthUncleByBlockNumberAndIndex(string block, string position) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_UNCLE_BY_BLOCK_NUMBER_AND_INDEX, [block, position]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Creates a filter object, based on filter options, to notify when the state changes (logs).
    #
    # + filterOptions - The filter options
    # + return - If success, return the output, else returns error
    public remote function ethNewFilter(json filterOptions) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_NEW_FILTER, [filterOptions]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Creates a filter in the node, to notify when a new block arrives.
    #
    # + return - If success, return the output, else returns error
    public remote function ethNewBlockFilter() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_NEW_BLOCK_FILTER, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Creates a filter in the node, to notify when new pending transactions arrive.
    #
    # + return - If success, return the output, else returns error
    public remote function ethNewPendingTransactionFilter() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_NEW__PENDING_TRANSACTION_FILTER, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Uninstalls a filter with given id.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    public remote function uninstallEthFilter(string filterId) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_UNINSTALL_FILTER, [filterId]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get an array of logs which occurred since last poll.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    public remote function getEthFilterChanges(string filterId) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion,
        self.networkId, ETH_GET_FILTER_CHANGES, [filterId]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get an array of all logs matching filter with given id.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    public remote function getEthFilterLogs(string filterId) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_FILTER_LOGS, [filterId]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get an array of all logs matching a given filter object.
    #
    # + filterOptions - The filter options
    # + return - If success, return the output, else returns error
    public remote function getEthLogs(json filterOptions) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_LOGS, [filterOptions]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Get the hash of the current block, the seedHash, and the boundary condition to be met ("target").
    #
    # + return - If success, return the output, else returns error
    public remote function getEthWork() returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_GET_WORK, EMPTY_PARAMS));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Used for submitting a proof-of-work solution.
    #
    # + nonce - The nonce found (64 bits)
    # + powHash - The header's pow-hash (256 bits)
    # + mixDigest - The mix digest (256 bits)
    # + return - If success, return the output, else returns error
    public remote function submitEthWork(string nonce, string powHash, string mixDigest) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        ETH_SUBMIT_WORK, [nonce, powHash, mixDigest]));
        return check resultToString(checkAndSetErrors(httpResponse));
    }

    # Generic method for Ethereum RPC.
    #
    # + method - The method name
    # + params - The parameter array
    # + return - If success, return the output, else returns error.
    public remote function remoteProcedureCall(string method, json params) returns @tainted string | error {
        var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
        method, params));
        return check resultToString(checkAndSetErrors(httpResponse));
    }
};

function constructRequest(string jsonRPCVersion, int networkId, string method, json params) returns http:Request {
    http:Request request = new;
    request.setHeader("Content-Type", "application/json");
    json payload = {};
    if (params == EMPTY_PARAMS) {
        payload = {
            jsonrpc: jsonRPCVersion, 
            method: method, 
            params: [], 
            id: networkId
        };
    } else {
        payload = {
            jsonrpc: jsonRPCVersion, 
            method: method, 
            params: params, 
            id: networkId
        };
    }
    request.setJsonPayload(payload);
    return request;
}

function setResponseError(json jsonResponse) returns error {
    error err = error(ETHEREUM_ERROR_CODE, message = jsonResponse.'error.message.toString());
    return err;
}

# Check HTTP response and return JSON payload if succesful, else set errors and return ConnectorError.
# + httpResponse - HTTP respone or HttpConnectorError
# + return - JSON result if successful, else ConnectorError occured
function checkAndSetErrors(http:Response | error httpResponse) returns @tainted json | error {
    if (httpResponse is http:Response) {
        if (httpResponse.statusCode == http:STATUS_OK || httpResponse.statusCode == http:STATUS_CREATED
        || httpResponse.statusCode == http:STATUS_NO_CONTENT) {

            json | error jsonResponse = httpResponse.getJsonPayload();

            if (jsonResponse is json) {
                return jsonResponse;
            } else {
                log:printError(JSON_ACCESSING_ERROR_MSG, err = jsonResponse);
                error err = error(HTTP_RESPONSE_HANDLING_ERROR,
                message = JSON_ACCESSING_ERROR_MSG, errorCode = HTTP_RESPONSE_HANDLING_ERROR);
                return err;
            }

        } else {

            json | error jsonResponse = httpResponse.getJsonPayload();
            if (jsonResponse is json) {
                return setResponseError(jsonResponse);
            } else {
                log:printError(JSON_ACCESSING_ERROR_MSG, err = jsonResponse);
                error err = error(HTTP_RESPONSE_HANDLING_ERROR,
                message = JSON_ACCESSING_ERROR_MSG, errorCode = HTTP_RESPONSE_HANDLING_ERROR);
                return err;
            }

        }
    } else {
        log:printError(HTTP_ERROR_MSG, err = httpResponse);
        error httpError = error(HTTP_ERROR, message = HTTP_ERROR_MSG, errorCode = HTTP_ERROR);
        return httpError;
    }
}
