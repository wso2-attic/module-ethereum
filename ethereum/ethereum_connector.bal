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

import ballerina/io;

function EthereumConnector::getWeb3ClientVersion() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int>self.networkId,
            WEB3_CLIENT_VERSION , EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getWeb3Sha3(string data) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            WEB3_SHA3 , [data]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getNetVersion() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            NET_VERSION, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getNetPeerCount() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
             NET_PEER_COUNT, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getNetListening() returns boolean|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            NET_LISTENING, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        boolean result = jsonToBoolean(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthProtocolVersion() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_PROTOCOL_VERSION, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthSyncing() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_SYNCING, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthCoinbase() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_COINBASE, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthMining() returns boolean|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_MINING, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        boolean result = jsonToBoolean(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthHashrate() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_HASHRATE, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthGasPrice() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GAS_PRICE, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthAccounts() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_ACCOUNTS, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = arrayConvertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthBlockNumber() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_BLOCK_NUMBER, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthBalance(string address, string block) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_BALANCE, [address, block]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthStorageAt( string address, string position, string block)
                                returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_STORAGEAT, [address, position, block]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthTransactionCount(string address, string block) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_TRANSACTION_COUNT, [address, block]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthBlockTransactionCountByHash(string blockHash) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_BLOCK_TRANSACTION_COUNT_BY_HASH, [blockHash]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthBlockTransactionCountByNumber(string block) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_BLOCK_TRANSACTION_COUNT_BY_NUMBER, [block]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthUncleCountByBlockHash(string blockHash) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_UNCLE_COUNT_BY_BLOCK_HASH, [blockHash]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthUncleCountByBlockNumber(string block) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_UNCLE_COUNT_BY_BLOCK_NUMBER, [block]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthCode(string address, string block) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_CODE, [address, block]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthSign(string address, string message) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_SIGN, [address, message]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::sendEthTransaction(json transactionObject) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_SEND_TRANSACTION, [transactionObject]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::sendEthRawTransaction(string signedTransactionData) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_SEND_RAW_TRANSACTION, [signedTransactionData]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthCall(json transactionCallObject, string block) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_CALL, [transactionCallObject, block]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthEstimateGas(json transactionCallObject) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_ESTIMATE_GAS, [transactionCallObject]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthBlockByHash(string blockHash, boolean transactionObjectStatus)
                                returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_BLOCK_BY_HASH, [blockHash, transactionObjectStatus]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthBlockByNumber(string block, boolean transactionObjectStatus)
                                returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_BLOCK_BY_NUMBER, [block, transactionObjectStatus]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthTransactionByHash(string transactionHash) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_TRANSACTION_BY_HASH, [transactionHash]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthTransactionByBlockHashAndIndex(string blockHash, string  position)
                                returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_TRANSACTION_BY_BLOCK_HASH_AND_INDEX, [blockHash, position]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthTransactionByBlockNumberAndIndex(string block, string  position)
                                returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_TRANSACTION_BY_BLOCK_NUMBER_AND_INDEX, [block, position]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthTransactionReceipt(string transactionHash) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_TRANSACTION_RECEIPT, [transactionHash]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthUncleByBlockHashAndIndex(string blockHash, string position)
                                returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_UNCLE_BY_BLOCK_HASH_AND_INDEX, [blockHash, position]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthUncleByBlockNumberAndIndex(string block, string position)
                                returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_UNCLE_BY_BLOCK_NUMBER_AND_INDEX, [block, position]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::ethNewFilter(json filterOptions) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_NEW_FILTER, [filterOptions]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::ethNewBlockFilter() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_NEW_BLOCK_FILTER, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::ethNewPendingTransactionFilter() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_NEW__PENDING_TRANSACTION_FILTER, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::uninstallEthFilter(string filterId) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_UNINSTALL_FILTER, [filterId]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthFilterChanges(string filterId) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_FILTER_CHANGES, [filterId]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthFilterLogs(string filterId) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_FILTER_LOGS, [filterId]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthLogs(json filterOptions) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_LOGS, [filterOptions]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::getEthWork() returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_GET_WORK, EMPTY_PARAMS));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::submitEthWork(string nonce, string powHash, string mixDigest) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient -> post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            ETH_SUBMIT_WORK, [nonce, powHash, mixDigest]));
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function EthereumConnector::remoteProcedureCall(string method, json params) returns Result|EthereumError {
    endpoint http:Client httpClient = self.httpClient;
    var httpResponse = httpClient->post("/", constructRequest(self.jsonRpcVersion, check <int> self.networkId,
            method, params));
    io:println(httpResponse);
    match httpResponse {
        error err => {
            EthereumError ethereumError = {};
            ethereumError.message = err.message;
            ethereumError.cause = err.cause;
            return ethereumError;
        }
        http:Response response => {
            EthereumError ethereumError = {};
            int statusCode = response.statusCode;
            var ethereumJSONResponse = response.getJsonPayload();
            match ethereumJSONResponse {
                error err => {
                    ethereumError.message = "Error occured while extracting Json Payload";
                    ethereumError.cause = err.cause;
                    return ethereumError;
                }
                json jsonResponse => {
                    if (jsonResponse["error"] == null) {
                        Result result = convertToResult(jsonResponse);
                        return result;
                    } else {
                        ethereumError.message = jsonResponse.error.message.toString();
                        ethereumError.statusCode = check <int>jsonResponse.error.code;
                        return ethereumError;
                    }
                }
            }
        }
    }
}

function constructRequest (string jsonRPCVersion, int networkId, string method, json params) returns http:Request {
    http:Request request = new;
    request.setHeader("Content-Type", "application/json");
    request.setJsonPayload({"jsonrpc":jsonRPCVersion, "id":networkId, "method":method, "params":params});
    return request;
}
