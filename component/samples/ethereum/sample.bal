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

import ballerina.net.http;
import org.wso2.ballerina.connectors.ethereum;

public function main (string[] args) {

    endpoint<ethereum:ClientConnector> ethereumConnector {
        create ethereum:ClientConnector(args[0], {}, args[1], toInt(args[2]));
    }

    json response = {};
    http:HttpConnectorError e;

    string methodName = args[3];

    if (methodName == "web3_clientVersion") {
        response, e = ethereumConnector.web3ClientVersion();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "web3_sha3") {
        response, e = ethereumConnector.web3Sha3(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "net_version") {
        response, e = ethereumConnector.netVersion();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "net_listening") {
        response, e = ethereumConnector.netListening();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "net_peerCount") {
        response, e = ethereumConnector.netPeerCount();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_protocolVersion") {
        response, e = ethereumConnector.ethProtocolVersion();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_syncing") {
        response, e = ethereumConnector.ethSyncing();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_coinbase") {
        response, e = ethereumConnector.ethCoinbase();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_mining") {
        response, e = ethereumConnector.ethMining();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_hashrate") {
        response, e = ethereumConnector.ethHashrate();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_gasPrice") {
        response, e = ethereumConnector.ethGasPrice();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_accounts") {
        response, e = ethereumConnector.ethAccounts();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_blockNumber") {
        response, e = ethereumConnector.ethBlockNumber();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getBalance") {
        response, e = ethereumConnector.ethGetBalance(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getStorageAt") {
        response, e = ethereumConnector.ethGetStorageAt(args[4], args[5], args[6]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getTransactionCount") {
        response, e = ethereumConnector.ethGetTransactionCount(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getBlockTransactionCountByHash") {
        response, e = ethereumConnector.ethGetBlockTransactionCountByHash(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getBlockTransactionCountByNumber") {
        response, e = ethereumConnector.ethGetBlockTransactionCountByNumber(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getUncleCountByBlockHash") {
        response, e = ethereumConnector.ethGetUncleCountByBlockHash(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getUncleCountByBlockNumber") {
        response, e = ethereumConnector.ethGetUncleCountByBlockNumber(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getCode") {
        response, e = ethereumConnector.ethGetCode(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_sign") {
        response, e = ethereumConnector.ethSign(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_sendTransaction") {
        var params, paramsError = <json> args[4];
        if (paramsError != null) {
            println(e);
            return;
        }
        response, e = ethereumConnector.ethSendTransaction(params);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_sendRawTransaction") {
        response, e = ethereumConnector.ethSendRawTransaction(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_call") {
        var params, paramsError = <json> args[4];
        if (paramsError != null) {
            println(e);
            return;
        }
        response, e = ethereumConnector.ethCall(params, "latest");
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_estimateGas") {
        var params, paramsError = <json> args[4];
        if (paramsError != null) {
            println(e);
            return;
        }
        response, e = ethereumConnector.ethEstimateGas(params);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getBlockByHash") {
        boolean isFull;
        if (args[5] == "true") {
            isFull = true;
        } else if (args[5] == "false") {
            isFull = false;
        }
        response, e = ethereumConnector.ethGetBlockByHash(args[4], isFull);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getBlockByNumber") {
        boolean isFull;
        if (args[5] == "true") {
            isFull = true;
        } else if (args[5] == "false") {
            isFull = false;
        }
        response, e = ethereumConnector.ethGetBlockByNumber(args[4], isFull);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getTransactionByHash") {
        response, e = ethereumConnector.ethGetTransactionByHash(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getTransactionByBlockHashAndIndex") {
        response, e = ethereumConnector.ethGetTransactionByBlockHashAndIndex(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getTransactionByBlockNumberAndIndex") {
        response, e = ethereumConnector.ethGetTransactionByBlockNumberAndIndex(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getTransactionReceipt") {
        response, e = ethereumConnector.ethGetTransactionReceipt(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getUncleByBlockHashAndIndex") {
        response, e = ethereumConnector.ethGetUncleByBlockHashAndIndex(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getUncleByBlockNumberAndIndex") {
        response, e = ethereumConnector.ethGetUncleByBlockNumberAndIndex(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth.getCompilers") {
        response, e = ethereumConnector.ethGetCompilers();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_newFilter") {
        var params, paramsError = <json> args[4];
        if (paramsError != null) {
            println(e);
            return;
        }
        response, e = ethereumConnector.ethNewFilter(params);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_newBlockFilter") {
        response, e = ethereumConnector.ethNewBlockFilter();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_newPendingTransactionFilter") {
        response, e = ethereumConnector.ethNewPendingTransactionFilter();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_uninstallFilter") {
        response, e = ethereumConnector.ethUninstallFilter(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getFilterChanges") {
        response, e = ethereumConnector.ethGetFilterChanges(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getFilterLogs") {
        response, e = ethereumConnector.ethGetFilterLogs(args[4]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getLogs") {
        var params, paramsError = <json> args[4];
        if (paramsError != null) {
            println(e);
            return;
        }
        response, e = ethereumConnector.ethGetLogs(params);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_getWork") {
        response, e = ethereumConnector.ethGetWork();
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_submitWork") {
        response, e = ethereumConnector.ethSubmitWork(args[4], args[5], args[6]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else if (methodName == "eth_submitHashrate") {
        response, e = ethereumConnector.ethSubmitHashrate(args[4], args[5]);
        if (e != null) {
            println(e);
            return;
        }
        println(response);
    } else {
        println("Could not find the Method Name");
    }
}

function toInt (string networkID) (int) {
    var id, idError = <int> networkID;
    if (idError != null) {
        println(idError);
        return -1;
    }
    return id;
}
