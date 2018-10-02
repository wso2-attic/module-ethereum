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
import ballerina/io;
import ballerina/test;
import ballerina/http;

string testJsonRpcVersion = config:getAsString("JSON_RPC_VERSION");
string testNetworkId = config:getAsString("NETWORK_ID");
string testJsonRpcEndpoint = config:getAsString("JSON_RPC_ENDPOINT");
string dataForSHA3 = config:getAsString("DATA");
string testBlock = config:getAsString("BLOCK");
string testposition = config:getAsString("POSITION");
string testBlockHash = config:getAsString("BLOCK_HASH");
string testMessage = config:getAsString("MESSAGE");
string testTransactionOptionsData = config:getAsString("TRANSACTION_OPTION_DATA");
string testTransactionObjectStatus = config:getAsString("TRANSACTION_OBJECT_STATUS");
string testTransactionCallObjectTovalue = config:getAsString("TRANSACTION_CALL_OBJECT_TO_VALUE");
string testNonce = config:getAsString("NONCE");
string testHeaderPowHash = config:getAsString("HEADER_POW_HASH");
string testMixDigest = config:getAsString("MIX_DIGEST");
string testAddress;
string testFilterID;

endpoint Client client {
    jsonRpcVersion: testJsonRpcVersion,
    networkId: testNetworkId,
    jsonRpcEndpoint : testJsonRpcEndpoint
};

@test:Config
function testGetWeb3ClientVersion() {
    io:println("--------------------------Test case for get version of Web3Client.-----------------------------------");
    string result;
    var ethereumRes = client->getWeb3ClientVersion();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get version of Web3Client.");
}

@test:Config
function testGetWeb3Sha3() {
    io:println("-----------Test case for get Keccak-256 (not the standardized SHA3-256) of the given data------------");
    string result;
    var ethereumRes = client->getWeb3Sha3(dataForSHA3);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to convert data into a SHA3 hash.");
}

@test:Config
function testGetNetVersion() {
    io:println("-----------------------------Test case for get current network id.-----------------------------------");
    string result;
    var ethereumRes = client->getNetVersion();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get current network id.");
}

@test:Config
function testGetNetListening() {
    io:println("------Test case for check whether the client is actively listening for network connections/not.------");
    boolean result;
    var ethereumRes = client->getNetListening();
    match ethereumRes {
        boolean data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to check whether the client is actively listening for
     network connections/not.");
}

@test:Config
function testGeNetPeerCount() {
    io:println("------------------Test case for get the number of peers currently connected to the client.-----------");
    string result;
    var ethereumRes = client->getNetPeerCount();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the number of peers currently
    connected to the client.");
}

@test:Config
function testGetEthProtocolVersion() {
    io:println("-----------------------Test case for get current ethereum protocol version.--------------------------");
    string result;
    var ethereumRes = client->getEthProtocolVersion();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get current ethereum protocol version.");
}

@test:Config
function testGetEthSyncing() {
    io:println("----------------Test case for get an object with data about the sync status.-------------------------");
    string result;
    var ethereumRes = client->getEthSyncing();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get an object with data about the sync status");
}

@test:Config
function testGetEthCoinbase() {
    io:println("-----------------------Test case for get the current coinbase address.-------------------------------");
    string result;
    var ethereumRes = client->getEthCoinbase();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the current coinbase address.");
}

@test:Config
function testGetEthMining() {
    io:println("-----------------Test case for check whether client is actively mining new blocks/not.---------------");
    boolean result;
    var ethereumRes = client->getEthMining();
    match ethereumRes {
        boolean data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to check whether client is actively mining new blocks/not.");
}

@test:Config
function testGetEthHashrate() {
    io:println("----------Test case for get the number of hashes per second that the node is mining with.------------");
    string result;
    var ethereumRes = client->getEthHashrate();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the number of hashes per second
    that the node is mining with.");
}

@test:Config
function testGetEthGasPrice() {
    io:println("----------------------Test case for get the current price per gas in wei.----------------------------");
    string result;
    var ethereumRes = client->getEthGasPrice();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the current price per gas in wei.");
}

@test:Config
function testGetEthAccounts() {
    io:println("---------------------Test case for get a list of addresses owned by client.--------------------------");
    string result;
    var ethereumRes = client->getEthAccounts();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    testAddress = result;
    test:assertNotEquals(result, " ", msg = "Failed to get a list of addresses owned by client.");
}

@test:Config
function testGetEthBlockNumber() {
    io:println("--------------------------Test case for get the number of most recent block.-------------------------");
    string result;
    var ethereumRes = client->getEthBlockNumber();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the number of most recent block.");
}

@test:Config {
    dependsOn: ["testGetEthAccounts"]
}
function testGetEthBalance() {
    io:println("---------------------Test case for get the balance of the account of given address.------------------");
    string result;
    var ethereumRes = client->getEthBalance(testAddress, testBlock);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the balance of the account of given address.");
}

@test:Config {
    dependsOn: ["testGetEthAccounts"]
}
function testGetEthStorageAt() {
    io:println("-----------------Test case for get the value from a storage position at a given address.-------------");
    string result;
    var ethereumRes = client->getEthStorageAt(testAddress, testposition, testBlock);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the value from a storage
    position at a given address.");
}

@test:Config {
    dependsOn: ["testGetEthAccounts"]
}
function testGetEthTransactionCount() {
    io:println("------------------Test case for get the number of transactions sent from an address.-----------------");
    string result;
    var ethereumRes = client->getEthTransactionCount(testAddress, testBlock);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the number of transactions sent from an address.");
}

@test:Config
function testGetEthBlockTransactionCountByHash() {
    io:println("-Test case for get the number of transactions in a block from a block matching the given block hash.-");
    string result;
    var ethereumRes = client->getEthBlockTransactionCountByHash(testBlockHash);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the number of transactions in a block
    from a block matching the given block hash.");
}

@test:Config
function testGetEthBlockTransactionCountByNumber() {
    io:println("------Test case for get the number of transactions in a block matching the given block number.-------");
    string result;
    var ethereumRes = client->getEthBlockTransactionCountByNumber(testBlock);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the number of transactions in a block
    matching the given block number.");
}

@test:Config
function testGetEthUncleCountByBlockHash() {
    io:println("----Test case for get the number of uncles in a block from a block matching the given block hash.----");
    string result;
    var ethereumRes = client->getEthUncleCountByBlockHash(testBlockHash);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the number of uncles in a block from a block
    matching the given block hash.");
}

@test:Config
function testGetEthUncleCountByBlockNumber() {
    io:println("---Test case for get the number of uncles in a block from a block matching the given block number.---");
    string result;
    var ethereumRes = client->getEthUncleCountByBlockNumber(testBlock);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the number of uncles in a block from
    a block matching the given block number.");
}

@test:Config {
    dependsOn: ["testGetEthAccounts"]
}
function testGetEthCode() {
    io:println("---------------------------Test case for get code at a given address.--------------------------------");
    string result;
    var ethereumRes = client->getEthCode(testAddress, testBlock);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get code at a given address.");
}

@test:Config {
    dependsOn: ["testGetEthAccounts"]
}
function testGetEthSign() {
    io:println("----------------------Test case for calculates an Ethereum specific signature.-----------------------");
    string result;
    var ethereumRes = client->getEthSign(testAddress, testMessage);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to calculate an Ethereum specific signature");
}

@test:Config {
    dependsOn: ["testGetEthAccounts"]
}
function testSendEthTransaction() {
    io:println("Test case for creates new message call transaction or a contract creation, if the data field contains
    code.");
    string result;
    json testTransactionOptions = { "from": testAddress , "data": dataForSHA3 };
    var ethereumRes = client->sendEthTransaction(testTransactionOptions);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to create new message call transaction or
     a contract creation, if the data field contains code.");
}

@test:Config
function testSendEthRawTransaction() {
    io:println("-Test case for creates new message call transaction or a contract creation for signed transactions.--");
    string result;
    var ethereumRes = client->sendEthRawTransaction(testTransactionOptionsData);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to creates new message call transaction or
    a contract creation for signed transactions.");
}

@test:Config
function testGetEthCall() {
    io:println("Test case for executes a new message call immediately without creating a transaction on the block
    chain.");
    string result;
    json testTransactionCallObject = { "to": testTransactionCallObjectTovalue };
    var ethereumRes = client->getEthCall(testTransactionCallObject, testBlock);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to executes a new message call immediately without creating
            a transaction on the block chain.");
}

@test:Config
function testGetEthEstimateGas() {
    io:println("Test case for generates and get an estimate of how much gas is necessary to allow the transaction
    to complete.");
    string result;
    var ethereumRes = client->getEthEstimateGas({});
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to generates and get an estimate of how much gas
    is necessary to allow the transaction to complete.");
}

@test:Config
function testGetEthBlockByHash() {
    io:println("----------------------Test case for get information about a block by hash.---------------------------");
    string result;
    var ethereumRes = client->getEthBlockByHash(testBlockHash, <boolean>(testTransactionObjectStatus));
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get information about a block by hash.");
}

@test:Config
function testGetEthBlockByNumber() {
    io:println("---------------------Test case for get information about a block by block number.--------------------");
    string result;
    var ethereumRes = client->getEthBlockByNumber(testBlock, <boolean>(testTransactionObjectStatus));
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get information about a block by block number");
}

@test:Config
function testGetEthTransactionByHash() {
    io:println("--------Test case for get the information about a transaction requested by transaction hash.---------");
    string result;
    var ethereumRes = client->getEthTransactionByHash(testBlockHash);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to the information about a transaction requested by
    transaction hash.");
}

@test:Config
function testGetEthTransactionByBlockHashAndIndex() {
    io:println("---Test case for get information about a transaction by block hash and transaction index position.---");
    string result;
    var ethereumRes = client->getEthTransactionByBlockHashAndIndex(testBlockHash, testposition);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the information about a transaction by block hash and
    transaction index position.");
}

@test:Config
function testGetEthTransactionByBlockNumberAndIndex() {
    io:println("--Test case for get information about a transaction by block number and transaction index position.--");
    string result;
    var ethereumRes = client->getEthTransactionByBlockNumberAndIndex(testBlock, testposition);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get information about a transaction by block number
    and transaction index position.");
}

@test:Config
function testGetEthTransactionReceipt() {
    io:println("-----------------Test case for the receipt of a transaction by transaction hash----------------------");
    string result;
    var ethereumRes = client->getEthTransactionReceipt(testBlockHash);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get the receipt of a transaction by transaction hash.");
}

@test:Config
function testGetEthUncleByBlockHashAndIndex() {
    io:println("------Test case for get information about a uncle of a block by hash and uncle index position.-------");
    string result;
    var ethereumRes = client->getEthUncleByBlockHashAndIndex(testBlockHash, testposition);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get information about a uncle of a block by
    hash and uncle index position.");
}

@test:Config
function testGetEthUncleByBlockNumberAndIndex() {
    io:println("------Test case for get information about a uncle of a block by number and uncle index position.-----");
    string result;
    var ethereumRes = client->getEthUncleByBlockNumberAndIndex(testBlock, testposition);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get information about a uncle of a block by number
    and uncle index position.");
}

@test:Config
function testEthNewFilter() {
    io:println("--Test case for creates a filter object, based on filter options, to notify when the state changes.--");
    string result;
    var ethereumRes = client->ethNewFilter({});
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    testFilterID = result;
    test:assertNotEquals(result, " ", msg = "Failed to creates a filter object, based on filter options,
    to notify when the state changes (logs). ");
}

@test:Config
function testEthNewBlockFilter() {
    io:println("-----------Test case for creates a filter in the node, to notify when a new block arrives.-----------");
    string result;
    var ethereumRes = client->ethNewBlockFilter();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to creates a filter in the node,
    to notify when a new block arrives.");
}

@test:Config
function testEthNewPendingTransactionFilter() {
    io:println("-----Test case for creates a filter in the node, to notify when new pending transactions arrive.-----");
    string result;
    var ethereumRes = client->ethNewPendingTransactionFilter();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to creates a filter in the node,
    to notify when new pending transactions arrive.");
}

@test:Config {
    dependsOn: ["testEthNewFilter"]
}
function testUninstallEthFilter() {
    io:println("-------------------------Test case for uninstalls a filter with given id.----------------------------");
    string result;
    var ethereumRes = client->uninstallEthFilter(testFilterID);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to uninstalls a filter with given id.");
}

@test:Config {
    dependsOn: ["testEthNewFilter"]
}
function testGetEthFilterLogs() {
    io:println("-----------------Test case for get an array of all logs matching filter with given id.---------------");
    string result;
    var ethereumRes = client->getEthFilterLogs(testFilterID);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get an array of all logs matching filter with given id.");
}

@test:Config
function testGetEthFilterChanges() {
    io:println("-----------------Test case for get an array of logs which occurred since last poll.------------------");
    string result;
    var ethereumRes = client->getEthFilterChanges(testFilterID);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to returns an array of logs which occurred
    since last poll.");
}

@test:Config
function testGetEthLogs() {
    io:println("-----------------Test case for get an array of all logs matching a given filter object.--------------");
    string result;
    var ethereumRes = client->getEthLogs({});
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to get an array of all logs matching
    a given filter object.");
}

@test:Config
function testGetEthWork() {
    io:println("Test case for get the hash of the current block, the seedHash, and the boundary condition
    to be met (\"target\").");
    string result;
    var ethereumRes = client -> getEthWork();
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to the hash of the current block, the seedHash,
    and the boundary condition to be met (\"target\")");
}

@test:Config
function testSubmitEthWork() {
    io:println("------------------------Test case for submitting a proof-of-work solution.---------------------------");
    string result;
    var ethereumRes = client->submitEthWork(testNonce, testHeaderPowHash, testMixDigest);
    match ethereumRes {
        string data => result = data;
        error e => test:assertFail(msg = e.message);
    }
    test:assertNotEquals(result, " ", msg = "Failed to submitting a proof-of-work solution.");
}

