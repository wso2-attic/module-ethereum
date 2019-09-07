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

final string WEB3_CLIENT_VERSION = "web3_clientVersion";
final string WEB3_SHA3 = "web3_sha3";
final string NET_VERSION = "net_version";
final string NET_LISTENING = "net_listening";
final string NET_PEER_COUNT = "net_peerCount";
final string ETH_PROTOCOL_VERSION = "eth_protocolVersion";
final string ETH_SYNCING = "eth_syncing";
final string ETH_COINBASE = "eth_coinbase";
final string ETH_MINING = "eth_mining";
final string ETH_HASHRATE = "eth_hashrate";
final string ETH_GAS_PRICE = "eth_gasPrice";
final string ETH_ACCOUNTS = "eth_accounts";
final string ETH_BLOCK_NUMBER = "eth_blockNumber";
final string ETH_GET_BALANCE = "eth_getBalance";
final string ETH_GET_STORAGEAT = "eth_getStorageAt";
final string ETH_GET_TRANSACTION_COUNT = "eth_getTransactionCount";
final string ETH_GET_BLOCK_TRANSACTION_COUNT_BY_HASH = "eth_getBlockTransactionCountByHash";
final string ETH_GET_BLOCK_TRANSACTION_COUNT_BY_NUMBER = "eth_getBlockTransactionCountByNumber";
final string ETH_GET_UNCLE_COUNT_BY_BLOCK_HASH = "eth_getUncleCountByBlockHash";
final string ETH_GET_UNCLE_COUNT_BY_BLOCK_NUMBER = "eth_getUncleCountByBlockNumber";
final string ETH_GET_CODE = "eth_getCode";
final string ETH_SIGN = "eth_sign";
final string ETH_SEND_TRANSACTION = "eth_sendTransaction";
final string ETH_SEND_RAW_TRANSACTION = "eth_sendRawTransaction";
final string ETH_CALL = "eth_call";
final string ETH_ESTIMATE_GAS = "eth_estimateGas";
final string ETH_GET_BLOCK_BY_HASH = "eth_getBlockByHash";
final string ETH_GET_BLOCK_BY_NUMBER = "eth_getBlockByNumber";
final string ETH_GET_TRANSACTION_BY_HASH = "eth_getTransactionByHash";
final string ETH_GET_TRANSACTION_BY_BLOCK_HASH_AND_INDEX = "eth_getTransactionByBlockHashAndIndex";
final string ETH_GET_TRANSACTION_BY_BLOCK_NUMBER_AND_INDEX = "eth_getTransactionByBlockNumberAndIndex";
final string ETH_GET_TRANSACTION_RECEIPT = "eth_getTransactionReceipt";
final string ETH_GET_UNCLE_BY_BLOCK_HASH_AND_INDEX = "eth_getUncleByBlockHashAndIndex";
final string ETH_GET_UNCLE_BY_BLOCK_NUMBER_AND_INDEX = "eth_getUncleByBlockNumberAndIndex";
final string ETH_GET_COMPILERS = "eth_getCompilers";
final string ETH_NEW_FILTER = "eth_newFilter";
final string ETH_NEW_BLOCK_FILTER = "eth_newBlockFilter";
final string ETH_NEW__PENDING_TRANSACTION_FILTER = "eth_newPendingTransactionFilter";
final string ETH_UNINSTALL_FILTER = "eth_uninstallFilter";
final string ETH_GET_FILTER_CHANGES = "eth_getFilterChanges";
final string ETH_GET_FILTER_LOGS = "eth_getFilterLogs";
final string ETH_GET_LOGS = "eth_getLogs";
final string ETH_GET_WORK = "eth_getWork";
final string ETH_SUBMIT_WORK = "eth_submitWork";
final string ETH_SUBMIT_HASHRATE = "eth_submitHashrate";
final string EMPTY_PARAMS = "[]";

// Error Codes
final string ETHEREUM_ERROR_CODE = "[wso2/ethereum]EthereumError";
const HTTP_RESPONSE_HANDLING_ERROR = "[wso2/ethereum]HttpResponseHandlingError";
const HTTP_ERROR = "[wso2/ethereum]HTTPError";
final string JSON_ACCESSING_ERROR_MSG = "Error occurred while accessing the JSON payload of the response.";
const string HTTP_ERROR_MSG = "Error occurred while getting the HTTP response.";
