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

const string LATEST = "latest";

// This is a simple dashboard for an Ethereum wallet
public function main (string[] args) {

    endpoint<ethereum:ClientConnector> ethereumConnector {
        create ethereum:ClientConnector(args[0], {}, args[1], toInt(args[2]));
    }

    http:HttpConnectorError e;

    println("Sample Ethereum Client");
    println("------------------------------------------------------");

    //get client version
    var response, e = ethereumConnector.web3ClientVersion();
    if (e != null) {
        println(e);
        return;
    }
    println("Web3 Client Version: " + response.result.toString());

    //get available account addresses
    response, e = ethereumConnector.ethAccounts();
    if (e != null) {
        println(e);
        return;
    }
    json accounts = response.result;
    println("Number of accounts: " + lengthof response.result);
    println("\nAccount Balances");

    int i = 0;
    while (i < lengthof accounts) {
        //get the account balance for each account
        response, e = ethereumConnector.ethGetBalance(accounts[i].toString(), LATEST);
        if (e != null) {
            println(e);
            return;
        }
        println(accounts[i].toString() + "\t" + response.result.toString());
        i = i + 1;
    }

    //get the number of the latest block
    response, e = ethereumConnector.ethBlockNumber();
    if (e != null) {
        println(e);
        return;
    }
    println("\nNumber of blocks: " + response.result.toString());

    //get the details of the latest block
    println("\nlatest block details: ");
    response, e = ethereumConnector.ethGetBlockByNumber(LATEST, false);
    if (e != null) {
        println(e);
        return;
    }
    println(response.result);

    //get the transactions of the latest block
    println("\nlatest block transactions:");
    response, e = ethereumConnector.ethGetBlockTransactionCountByNumber(LATEST);
    if (e != null) {
        println(e);
        return;
    }
    println(response.result);
}

function toInt (string networkID) (int) {
    var id, idError = <int>networkID;
    if (idError != null) {
        println(idError);
        return -1;
    }
    return id;
}