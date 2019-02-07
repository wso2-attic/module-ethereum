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
        self.ethereumClient = new(jsonRpcEndpoint, config = ethereumConfig.clientConfig);
        self.jsonRpcVersion = ethereumConfig.jsonRpcVersion;
        self.jsonRpcEndpoint = ethereumConfig.jsonRpcEndpoint;
        var value = int.convert(ethereumConfig.networkId);
        if (value is int) {
            self.networkId = value;
        }
    }

    # Get the current client version.
    #
    # + return - If success, return the output, else returns error
    public remote function getWeb3ClientVersion() returns string|error;

    # Get SHA3 string of the given string.
    #
    # data - The data to convert into a SHA3 hash
    # + return - If success, return the output, else returns error
    public remote function getWeb3Sha3(string data) returns string|error;

    # Get the current network id.String.
    #   1: Ethereum Mainnet,
    #   2: Morden Testnet (deprecated),
    #   3: Ropsten Testnet,
    #   4: Rinkeby Testnet,
    #   42: Kovan Testnet
    #
    # + return - If success, return the output, else returns error
    public remote function getNetVersion() returns string|error;

    # Get the stauts for client is actively listening for network connections.
    #
    # + return - If success, return the output, else returns error
    public remote function getNetListening() returns boolean|error;

    # Get the number of peers currently connected to the client.
    #
    # + return- If success, return the output, else returns error
    public remote function getNetPeerCount() returns string|error;

    # Get the current ethereum protocol version.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthProtocolVersion() returns string|error;

    # Get an object with data about the sync status or false.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthSyncing() returns string|error;

    # Get the client coinbase address.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthCoinbase() returns string|error;

    # Get the status for client is actively mining new blocks.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthMining() returns boolean|error;

    # Get the number of hashes per second that the node is mining with.
    #
    # + return - If success, return the output, else returns error
    public  remote function getEthHashrate() returns string|error;

    # Get the current price per gas in wei.
    #
    # + return - If success, return the output, else returns error
    public  remote function getEthGasPrice() returns string|error;

    # Get a list of addresses owned by client.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthAccounts() returns string|error;

    # Get the number of most recent block.
    #
    # + return - If success, return the output, else returns error
    public remote function getEthBlockNumber() returns string|error;

    # Get the balance of the account of given address.
    #
    # + address - Address to check for balance
    # +block - integer block number(HEX String), or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthBalance(string address, string block) returns string|error;

    # Get the value from a storage position at a given address.
    #
    # + address - Address of the storage
    # + position - Integer of the position in the storage
    # block - Integer block number, or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthStorageAt(string address, string position, string block) returns string|error;

    # Get the number of transactions sent from an address.
    #
    # + address - The address
    # +block - Integer block number, or the string "latest", "earliest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionCount( string address, string block) returns string|error;

    # Get the number of transactions in a block from a block matching the given block hash.
    #
    # + blockHash - The hash of a block
    # + return - If success, return the output, else returns error
    public remote function getEthBlockTransactionCountByHash(string blockHash) returns string|error;

    # Gets the number of transactions in a block matching the given block number.
    #
    # + block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthBlockTransactionCountByNumber(string block) returns string|error;

    # Get the number of uncles in a block from a block matching the given block hash.
    #
    # + blockHash - The hash of a block
    # + return - If success, return the output, else returns error
    public remote function getEthUncleCountByBlockHash(string blockHash) returns string|error;

    # Get the number of uncles in a block from a block matching the given block number.
    #
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthUncleCountByBlockNumber(string block) returns string|error;

    # Executes a new message call immediately without creating a transaction on the block chain.
    #
    # + address - The address
    # + block  - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthCode(string address, string block) returns string|error;

    # Get the code at a given address.
    #
    # + address - The address
    # + message - The message to sign
    # + return - If success, return the output, else returns error
    public remote function getEthSign(string address, string message) returns string|error;

    # Creates new message call transaction or a contract creation, if the data field contains code.
    #
    # + transactionObject - The transaction hash, or the zero hash if the transaction is not yet available
    # + return - If success, return the output, else returns error
    public remote function sendEthTransaction(json transactionObject) returns string|error;

    # Creates new message call transaction or a contract creation for signed transactions.
    # + signedTransactionData - the transaction hash, or the zero hash if the transaction is not yet available
    # + return - If success, return the output, else returns error
    public remote function sendEthRawTransaction(string signedTransactionData) returns string|error;

    # Executes a new message call immediately without creating a transaction on the block chain.
    #
    # + transactionCallObject - The transaction call object
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # + return - If success, return the output, else returns error
    public remote function getEthCall(json transactionCallObject, string block) returns string|error;

    # Generates and returns an estimate of how much gas is necessary to allow the transaction to complete.
    #
    # + transactionCallObject - The transaction call object
    # + return - If success, return the output, else returns error
    public remote function getEthEstimateGas(json transactionCallObject) returns string|error;

    # Get information about a block by hash.
    #
    # + blockHash - The hash of a block
    # + transactionObjectStatus - If true it returns the full transaction objects,
    #                             if false only the hashes of the transactions
    # + return - If success, return the output, else returns error
    public remote function getEthBlockByHash(string blockHash, boolean transactionObjectStatus) returns string|error;

    # Get information about a block by block number.
    #
    # block - Integer of a block number, or the string "earliest", "latest" or "pending"
    # transactionObjectStatus - If true it returns the full transaction objects, if false only the hashes
    #                           of the transactions
    # + return - If success, return the output, else returns error
    public remote function getEthBlockByNumber(string block, boolean transactionObjectStatus) returns string|error;

    # Get the information about a transaction requested by transaction hash.
    #
    # + transactionHash - The hash of a transaction
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionByHash(string transactionHash) returns string|error;

    # Get the information about a transaction by block hash and transaction index position.
    #
    # + blockHash - The hash of a block
    # + position - Integer of the transaction index position
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionByBlockHashAndIndex(string blockHash, string position) returns string|error;

    # Get the information about a transaction by block number and transaction index position.
    #
    # + block - A block number, or the string "earliest", "latest" or "pending"
    # + position - The transaction index position
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionByBlockNumberAndIndex(string block, string position) returns string|error;

    # Get the receipt of a transaction by transaction hash.
    #
    # + transactionHash - The hash of a transaction
    # + return - If success, return the output, else returns error
    public remote function getEthTransactionReceipt(string transactionHash) returns string|error;

    # Get the information about a uncle of a block by hash and uncle index position.
    #
    # + blockHash - The hash a block
    # + position - The uncle's index position
    # + return - If success, return the output, else returns error
    public remote function getEthUncleByBlockHashAndIndex(string blockHash, string position) returns string|error;

    # Get the information about a uncle of a block by number and uncle index position.
    #
    # + block - A block number, or the string "earliest", "latest" or "pending"
    # + position - The uncle's index position
    # + return - If success, return the output, else returns error
    public remote function getEthUncleByBlockNumberAndIndex(string block, string position) returns string|error;

    # Creates a filter object, based on filter options, to notify when the state changes (logs).
    #
    # + filterOptions - The filter options
    # + return - If success, return the output, else returns error
    public remote function ethNewFilter(json filterOptions) returns string|error;

    # Creates a filter in the node, to notify when a new block arrives.
    #
    # + return - If success, return the output, else returns error
    public remote function ethNewBlockFilter() returns string|error;

    # Creates a filter in the node, to notify when new pending transactions arrive.
    #
    # + return - If success, return the output, else returns error
    public remote function ethNewPendingTransactionFilter() returns string|error;

    # Uninstalls a filter with given id.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    public remote function uninstallEthFilter(string filterId) returns string|error;

    # Get an array of logs which occurred since last poll.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    public remote function getEthFilterChanges(string filterId) returns string|error;

    # Get an array of all logs matching filter with given id.
    #
    # + filterId - The filter id
    # + return - If success, return the output, else returns error
    public remote function getEthFilterLogs(string filterId) returns string|error;

    # Get an array of all logs matching a given filter object.
    #
    # + filterOptions - The filter options
    # + return - If success, return the output, else returns error
    public remote function getEthLogs(json filterOptions) returns string|error;

    # Get the hash of the current block, the seedHash, and the boundary condition to be met ("target").
    #
    # + return - If success, return the output, else returns error
    public remote function getEthWork() returns string|error;

    # Used for submitting a proof-of-work solution.
    #
    # + nonce - The nonce found (64 bits)
    # + powHash - The header's pow-hash (256 bits)
    # + mixDigest - The mix digest (256 bits)
    # + return - If success, return the output, else returns error
    public remote function submitEthWork(string nonce, string powHash, string mixDigest) returns string|error;

    # Generic method for Ethereum RPC.
    #
    # + method - The method name
    # + params - The parameter array
    # + return - If success, return the output, else returns error.
    public remote function remoteProcedureCall(string method, json params) returns string|error;
};

public remote function Client.getWeb3ClientVersion() returns string|error {
    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    WEB3_CLIENT_VERSION , EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getWeb3Sha3(string data) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId, WEB3_SHA3
    , [data]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getNetVersion() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    NET_VERSION, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getNetPeerCount() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    NET_PEER_COUNT, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getNetListening() returns boolean|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    NET_LISTENING, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                boolean result = jsonToBoolean(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthProtocolVersion() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_PROTOCOL_VERSION, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthSyncing() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_SYNCING, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthCoinbase() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_COINBASE, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthMining() returns boolean|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_MINING, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                boolean result = jsonToBoolean(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthHashrate() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_HASHRATE, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthGasPrice() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion,
    self.networkId, ETH_GAS_PRICE, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthAccounts() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_ACCOUNTS, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
    int statusCode = httpResponse.statusCode;
    var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = convertToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthBlockNumber() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_BLOCK_NUMBER, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
    int statusCode = httpResponse.statusCode;
    var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthBalance(string address, string block) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_BALANCE, [address, block]));
    if (httpResponse is http:Response) {
    int statusCode = httpResponse.statusCode;
    var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthStorageAt( string address, string position, string block)
returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_STORAGEAT, [address, position, block]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthTransactionCount(string address, string block) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_TRANSACTION_COUNT, [address, block]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthBlockTransactionCountByHash(string blockHash) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_BLOCK_TRANSACTION_COUNT_BY_HASH, [blockHash]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthBlockTransactionCountByNumber(string block) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_BLOCK_TRANSACTION_COUNT_BY_NUMBER, [block]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthUncleCountByBlockHash(string blockHash) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_UNCLE_COUNT_BY_BLOCK_HASH, [blockHash]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthUncleCountByBlockNumber(string block) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_UNCLE_COUNT_BY_BLOCK_NUMBER, [block]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthCode(string address, string block) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_CODE, [address, block]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthSign(string address, string message) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_SIGN, [address, message]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.sendEthTransaction(json transactionObject) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_SEND_TRANSACTION, [transactionObject]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.sendEthRawTransaction(string signedTransactionData) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_SEND_RAW_TRANSACTION, [signedTransactionData]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthCall(json transactionCallObject, string block) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion,
    self.networkId, ETH_CALL, [transactionCallObject, block]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthEstimateGas(json transactionCallObject) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_ESTIMATE_GAS, [transactionCallObject]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthBlockByHash(string blockHash, boolean transactionObjectStatus)
returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_BLOCK_BY_HASH, [blockHash, transactionObjectStatus]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthBlockByNumber(string block, boolean transactionObjectStatus)
returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_BLOCK_BY_NUMBER, [block, transactionObjectStatus]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthTransactionByHash(string transactionHash) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion,
    self.networkId, ETH_GET_TRANSACTION_BY_HASH, [transactionHash]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthTransactionByBlockHashAndIndex(string blockHash, string  position)
returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_TRANSACTION_BY_BLOCK_HASH_AND_INDEX, [blockHash, position]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthTransactionByBlockNumberAndIndex(string block, string  position)
returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_TRANSACTION_BY_BLOCK_NUMBER_AND_INDEX, [block, position]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthTransactionReceipt(string transactionHash) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_TRANSACTION_RECEIPT, [transactionHash]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthUncleByBlockHashAndIndex(string blockHash, string position)
returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_UNCLE_BY_BLOCK_HASH_AND_INDEX, [blockHash, position]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
            }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthUncleByBlockNumberAndIndex(string block, string position) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_UNCLE_BY_BLOCK_NUMBER_AND_INDEX, [block, position]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.ethNewFilter(json filterOptions) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_NEW_FILTER, [filterOptions]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.ethNewBlockFilter() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_NEW_BLOCK_FILTER, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.ethNewPendingTransactionFilter() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_NEW__PENDING_TRANSACTION_FILTER, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.uninstallEthFilter(string filterId) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_UNINSTALL_FILTER, [filterId]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthFilterChanges(string filterId) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion,
    self.networkId, ETH_GET_FILTER_CHANGES, [filterId]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthFilterLogs(string filterId) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_FILTER_LOGS, [filterId]));
    if (httpResponse is http:Response) {
    int statusCode = httpResponse.statusCode;
    var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthLogs(json filterOptions) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_LOGS, [filterOptions]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.getEthWork() returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_GET_WORK, EMPTY_PARAMS));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.submitEthWork(string nonce, string powHash, string mixDigest) returns string|error {

    var httpResponse = self.ethereumClient -> post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    ETH_SUBMIT_WORK, [nonce, powHash, mixDigest]));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
        error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public remote function Client.remoteProcedureCall(string method, json params) returns string|error {

    var httpResponse = self.ethereumClient->post("/", constructRequest(self.jsonRpcVersion, self.networkId,
    method, params));
    if (httpResponse is http:Response) {
        int statusCode = httpResponse.statusCode;
        var jsonResponse = httpResponse.getJsonPayload();
        if (jsonResponse is json) {
            if (jsonResponse["error"] == null) {
                string result = resultToString(jsonResponse);
                return result;
            } else {
                return setResponseError(jsonResponse);
            }
        } else {
            error err = error(ETHEREUM_ERROR_CODE,
            { message: "Error occurred while accessing the JSON payload of the response" });
            return err;
        }
    } else {
        error err = error(ETHEREUM_ERROR_CODE, { message: "Error occurred while invoking the Ethererum API" });
        return err;
    }
}

public function constructRequest (string jsonRPCVersion, int networkId, string method, json params) returns http:Request {
    http:Request request = new;
    request.setHeader("Content-Type", "application/json");
    request.setJsonPayload({"jsonrpc":jsonRPCVersion, "id":networkId, "method":method, "params":params});
    return request;
}

public function setResponseError(json jsonResponse) returns error {
    map<string> details = { message: jsonResponse["error"].message.toString() };
    error err = error(ETHEREUM_ERROR_CODE, details);
    return err;
}
