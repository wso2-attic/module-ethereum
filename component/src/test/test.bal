package test;

import ballerina.test;
import ballerina.net.http;
import org.wso2.ballerina.connectors.ethereum;

const string URI = "http://localhost:8080";
const string JSONRPCVersion = "2.0";
const int NETWORKID = 1999;
const string ACCOUNT = "0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87";
const string HASH = "0xf6c17bf68c909565f2f1766da00a0f44e52ecb381ac6c8e088d28273d92e79ef";
const string BLOCK_NUMBER = "0xaf";
const string INDEX = "0x0";

function beforeTest(){
    println("Starting integration tests");
}

function testMain () {

    endpoint<ethereum:ClientConnector> ethereumConnector {
        create ethereum:ClientConnector(URI, {},JSONRPCVersion , NETWORKID);
    }

    json response = {};
    http:HttpConnectorError e;

    response, e = ethereumConnector.web3ClientVersion();
    test:assertTrue(checkResult(response, e), "web3ClientVersion test failed");

    response, e = ethereumConnector.web3Sha3("0x4521");
    test:assertTrue(checkResult(response, e), "web3Sha3 test failed");

    response, e = ethereumConnector.netVersion();
    test:assertTrue(checkResult(response, e), "netVersion test failed");

    response, e = ethereumConnector.netListening();
    test:assertTrue(checkResult(response, e), "netListening test failed");

    response, e = ethereumConnector.netPeerCount();
    test:assertTrue(checkResult(response, e), "netPeerCount test failed");

    response, e = ethereumConnector.ethProtocolVersion();
    test:assertTrue(checkResult(response, e), "ethProtocolVersion test failed");

    response, e = ethereumConnector.ethSyncing();
    test:assertTrue(checkResult(response, e), "ethSyncing test failed");

    response, e = ethereumConnector.ethCoinbase();
    test:assertTrue(checkResult(response, e), "ethCoinbase test failed");

    response, e = ethereumConnector.ethMining();
    test:assertTrue(checkResult(response, e), "ethMining test failed");

    response, e = ethereumConnector.ethHashrate();
    test:assertTrue(checkResult(response, e), "ethHashrate test failed");

    response, e = ethereumConnector.ethGasPrice();
    test:assertTrue(checkResult(response, e), "ethGasPrice test failed");

    response, e = ethereumConnector.ethAccounts();
    test:assertTrue(checkResult(response, e), "ethAccounts test failed");

    response, e = ethereumConnector.ethBlockNumber();
    test:assertTrue(checkResult(response, e), "ethBlockNumber test failed");

    response, e = ethereumConnector.ethGetBalance(ACCOUNT, "latest");
    test:assertTrue(checkResult(response, e), "ethGetBalance test failed");

    response, e = ethereumConnector.ethGetStorageAt(ACCOUNT, INDEX, "latest");
    test:assertTrue(checkResult(response, e), "ethGetStorageAt test failed");

    response, e = ethereumConnector.ethGetTransactionCount(ACCOUNT, INDEX);
    test:assertTrue(checkResult(response, e), "ethGetTransactionCount test failed");

    response, e = ethereumConnector.ethGetBlockTransactionCountByHash(HASH);
    test:assertTrue(checkResult(response, e), "ethGetBlockTransactionCountByHash test failed");

    response, e = ethereumConnector.ethGetBlockTransactionCountByNumber(INDEX);
    test:assertTrue(checkResult(response, e), "ethGetBlockTransactionCountByNumber test failed");

    response, e = ethereumConnector.ethGetUncleCountByBlockHash(HASH);
    test:assertTrue(checkResult(response, e), "ethGetUncleCountByBlockHash test failed");

    response, e = ethereumConnector.ethGetUncleCountByBlockNumber(INDEX);
    test:assertTrue(checkResult(response, e), "ethGetUncleCountByBlockNumber test failed");

    response, e = ethereumConnector.ethGetCode(ACCOUNT, "latest");
    test:assertTrue(checkResult(response, e), "ethGetCode test failed");

    response, e = ethereumConnector.ethSign(
                                   ACCOUNT, "0x170b651e078b2b0c073bffdb5dc53288ac0a62e1015f230e5ff5092c10eb56e4");
    test:assertTrue(checkResult(response, e), "ethSign test failed");

    response, e = ethereumConnector.ethSendTransaction("{\"from\" :\"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87\",
    \"to\": \"0xee76e1d9ad8859ac9340b07e6901a028a1101577\",
    \"data\": \"0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab
    080014866506b1e64281fc20690068a02f95298a09dd878e2272ca70b01c\",\"value\": \"0xa\"}");
    test:assertTrue(checkResult(response, e), "ethSendTransaction test failed");

    response, e = ethereumConnector.ethSendRawTransaction("0x877399ae278d0a969bad46d3d2e4b2403d091b5c3fdab13c254c8ee0
    9c6c591d17e058baaa8c5c4f2e3afc2fce30d1bce185e78307637d4cd67d0ad177b812e61c");
    test:assertTrue(checkResult(response, e), "ethSendRawTransaction test failed");

    response, e = ethereumConnector.ethCall("{\"to\":\"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87\"}", "latest");
    test:assertTrue(checkResult(response, e), "ethCall test failed");

    response, e = ethereumConnector.ethEstimateGas("{\"from\" :\"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87\",\"to\":
    \"0xee76e1d9ad8859ac9340b07e6901a028a1101577\",
    \"data\": \"0x725b107db88f11690dd6f2032f260a0a93d735bd15e503d71bdbc1d7e73141a44bbeab080014866506b1e64281fc20690068a
    02f95298a09dd878e2272ca70b01c\",\"value\": \"0xa\"}");
    test:assertTrue(checkResult(response, e), "ethEstimateGas test failed");

    response, e = ethereumConnector.ethGetBlockByHash(HASH, true);
    test:assertTrue(checkResult(response, e), "ethGetBlockByHash test failed");

    response, e = ethereumConnector.ethGetBlockByNumber(BLOCK_NUMBER, true);
    test:assertTrue(checkResult(response, e), "ethGetBlockByNumber test failed");

    response, e = ethereumConnector.ethGetTransactionByHash(HASH);
    test:assertTrue(checkResult(response, e), "ethGetTransactionByHash test failed");

    response, e = ethereumConnector.ethGetTransactionByBlockHashAndIndex(HASH, INDEX);
    test:assertTrue(checkResult(response, e), "ethGetTransactionByBlockHashAndIndex test failed");

    response, e = ethereumConnector.ethGetTransactionByBlockNumberAndIndex(BLOCK_NUMBER, INDEX);
    test:assertTrue(checkResult(response, e), "ethGetTransactionByBlockNumberAndIndex test failed");

    response, e = ethereumConnector.ethGetTransactionReceipt(HASH);
    test:assertTrue(checkResult(response, e), "ethGetTransactionReceipt test failed");

    response, e = ethereumConnector.ethGetUncleByBlockHashAndIndex(HASH, INDEX);
    test:assertTrue(checkResult(response, e), "ethGetUncleByBlockHashAndIndex test failed");

    response, e = ethereumConnector.ethGetUncleByBlockNumberAndIndex("0xf6", INDEX);
    test:assertTrue(checkResult(response, e), "ethGetUncleByBlockNumberAndIndex test failed");

    response, e = ethereumConnector.ethNewFilter
                                   ("{\"fromBlock\": \"0x1\",\"toBlock\": \"0x2\",
                                   \"address\": \"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87\",
                                   \"topics\":[\"0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b\",
                                   null,[\"0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b\",
                                   \"0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc\"]]}");
    test:assertTrue(checkResult(response, e), "ethNewFilter test failed");

    response, e = ethereumConnector.ethNewBlockFilter();
    test:assertTrue(checkResult(response, e), "ethNewBlockFilter test failed");

    response, e = ethereumConnector.ethNewPendingTransactionFilter();
    test:assertTrue(checkResult(response, e), "ethNewPendingTransactionFilter test failed");

    response, e = ethereumConnector.ethUninstallFilter("0x15842a94627e19e5571559236b5b1700");
    test:assertTrue(checkResult(response, e), "ethUninstallFilter test failed");

    response, e = ethereumConnector.ethGetFilterChanges("0x15842a94627e19e5571559236b5b1700");
    test:assertTrue(checkResult(response, e), "ethGetFilterChanges test failed");

    response, e = ethereumConnector.ethGetFilterLogs("0x15842a94627e19e5571559236b5b1700");
    test:assertTrue(checkResult(response, e), "ethGetFilterLogs test failed");

    response, e = ethereumConnector.ethGetLogs
                                   ("{\"fromBlock\": \"0x1\",\"toBlock\": \"0x2\",
                                   \"address\": \"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87\",
                                   \"topics\":[\"0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b\",
                                    null,[\"0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b\",
                                     \"0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc\"]]}");
    test:assertTrue(checkResult(response, e), "ethGetLogs test failed");

    response, e = ethereumConnector.ethGetWork();
    test:assertTrue(checkResult(response, e), "ethGetWork test failed");

    response, e = ethereumConnector.ethSubmitWork("0x0000000000000001",
                                                  "0xa234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef",
                                                  "0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef");
    test:assertTrue(checkResult(response, e), "ethSubmitWork test failed");

    response, e = ethereumConnector.ethSubmitHashrate
                                   ("0x500000", "0x59daa26581d0acd1fce254fb7e85952f4c09d0915afd33d3886cd914bc7d283c");
    test:assertTrue(checkResult(response, e), "ethSubmitHashrate test failed");
}

function afterTest(){
    println("Finishing integration tests");
}

function checkResult (json response, http:HttpConnectorError e) (boolean) {
    if (e == null || response.id == null || response.jsonrpc == null) {
        println(response);
        return true;
    }
    return false;
}


