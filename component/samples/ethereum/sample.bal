import ballerina.net.http;
import org.wso2.ballerina.connectors.ethereum;

const string trueString = "true";
const string falseString = "false";

public function main (string[] args) {

    endpoint<ethereum:ClientConnector> ethereumConnector {
        create ethereum:ClientConnector(args[0]); //set args[0] as the URI of the JSON RPC server
    }

    string JSONRPCVersion = args[1]; //JSONRPC version of the ethereum node
    var networkId, networkIdError = <int> args[2]; //ntworkID: identity number in the ethereum network


    if (networkIdError == null) {

        http:Response response = {};
        http:HttpConnectorError e;

        string methodName = args[3];

        if (methodName == "web3_clientVersion"){
            response, e = ethereumConnector.web3ClientVersion(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println(JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "web3_sha3"){
            response, e = ethereumConnector.web3Sha3(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "net_version"){
            response, e = ethereumConnector.netVersion(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "net_listening"){
            response, e = ethereumConnector.netListening(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "net_peerCount"){
            response, e = ethereumConnector.netPeerCount(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_protocolVersion"){
            response, e = ethereumConnector.ethProtocolVersion(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_syncing"){
            response, e = ethereumConnector.ethSyncing(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_coinbase"){
            response, e = ethereumConnector.ethCoinbase(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_mining"){
            response, e = ethereumConnector.ethMining(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_hashrate"){
            response, e = ethereumConnector.ethHashrate(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_gasPrice"){
            response, e = ethereumConnector.ethGasPrice(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_accounts"){
            response, e = ethereumConnector.ethAccounts(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_blockNumber"){
            response, e = ethereumConnector.ethBlockNumber(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getBalance"){
            response, e = ethereumConnector.ethGetBalance(JSONRPCVersion, networkId, args[4], args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getStorageAt"){
            response, e = ethereumConnector.ethGetStorageAt(JSONRPCVersion, networkId, args[4], args[5], args[6]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getTransactionCount"){
            response, e = ethereumConnector.ethGetTransactionCount(JSONRPCVersion, networkId, args[4], args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getBlockTransactionCountByHash"){
            response, e = ethereumConnector.ethGetBlockTransactionCountByHash(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getBlockTransactionCountByNumber"){
            response, e = ethereumConnector.ethGetBlockTransactionCountByNumber(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getUncleCountByBlockHash"){
            response, e = ethereumConnector.ethGetUncleCountByBlockHash(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getUncleCountByBlockNumber"){
            response, e = ethereumConnector.ethGetUncleCountByBlockNumber(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getCode"){
            response, e = ethereumConnector.ethGetCode(JSONRPCVersion, networkId, args[4], args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_sign"){
            response, e = ethereumConnector.ethSign(JSONRPCVersion, networkId, args[4], args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_sendTransaction"){
            json params = {};
            TypeConversionError paramsError;
            params, paramsError = <json> args[4];
            if (paramsError == null) {
                response, e = ethereumConnector.ethSendTransaction(JSONRPCVersion, networkId, params);
                if (e == null) {
                    json JSONResponse = response.getJsonPayload();
                    println(JSONResponse.toString());
                } else {
                    println(e);
                }
            } else {
                println(paramsError);
            }
        } else if (methodName == "eth_sendRawTransaction"){
            response, e = ethereumConnector.ethSendRawTransaction(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_call"){
            response, e = ethereumConnector.ethCall(JSONRPCVersion, networkId,
                                                        {"to":"0x0eb8a07d29f5afdcbec1a9d087ece456139bfb87"}, "latest");
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_estimateGas"){
            println(args[4]);
            response, e = ethereumConnector.ethEstimateGas(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getBlockByHash"){
            boolean isFull;
            if(args[5] == "true") {
                isFull = true;
            } else if (args[5] == "false") {
                isFull = false;
            }
            response, e = ethereumConnector.ethGetBlockByHash(JSONRPCVersion, networkId, args[4], isFull);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getBlockByNumber"){
            boolean isFull;
            if(args[5] == "true") {
                isFull = true;
            } else if (args[5] == "false") {
                isFull = false;
            }
            response, e = ethereumConnector.ethGetBlockByNumber(JSONRPCVersion, networkId, args[4], isFull);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getTransactionByHash"){
            response, e = ethereumConnector.ethGetTransactionByHash(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getTransactionByBlockHashAndIndex"){
            response, e = ethereumConnector.ethGetTransactionByBlockHashAndIndex(JSONRPCVersion, networkId, args[4],
                                                                                 args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getTransactionByBlockNumberAndIndex"){
            response, e = ethereumConnector.ethGetTransactionByBlockNumberAndIndex(JSONRPCVersion, networkId, args[4],
                                                                                   args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getTransactionReceipt"){
            response, e = ethereumConnector.ethGetTransactionReceipt(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getUncleByBlockHashAndIndex"){
            response, e = ethereumConnector.ethGetUncleByBlockHashAndIndex(JSONRPCVersion, networkId, args[4], args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth_getUncleByBlockNumberAndIndex"){
            response, e = ethereumConnector.ethGetUncleByBlockNumberAndIndex(JSONRPCVersion, networkId, args[4],
                                                                             args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName == "eth.getCompilers"){
            response, e = ethereumConnector.ethGetCompilers(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_compileLLL"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_compileSolidity"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_compileSerpent"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_newFilter"){
            response, e = ethereumConnector.ethNewFilter(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_newBlockFilter"){
            response, e = ethereumConnector.ethNewBlockFilter(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_newPendingTransactionFilter"){
            response, e = ethereumConnector.ethNewPendingTransactionFilter(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_uninstallFilter"){
            response, e = ethereumConnector.ethUninstallFilter(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_getFilterChanges"){
            response, e = ethereumConnector.ethGetFilterChanges(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_getFilterLogs"){
            response, e = ethereumConnector.ethGetFilterLogs(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_getLogs"){
            response, e = ethereumConnector.ethGetLogs(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_getWork"){
            response, e = ethereumConnector.ethGetWork(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_submitWork"){
            response, e = ethereumConnector.ethSubmitWork(JSONRPCVersion, networkId, args[4], args[5], args[6]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "eth_submitHashrate"){
            response, e = ethereumConnector.ethSubmitHashrate(JSONRPCVersion, networkId, args[4], args[5]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_post"){
            response, e = ethereumConnector.shhPost(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_version"){
            response, e = ethereumConnector.shhVersion(JSONRPCVersion, networkId);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_newIdentity"){
            response, e = ethereumConnector.shhNewIdentity(JSONRPCVersion, networkId, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_hasIdentity"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_newGroup"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_addToGroup"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_newFilter"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_uninstallFilter"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_getFilterChanges"){
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName,args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println( JSONResponse.toString());
            } else {
                println(e);
            }
        } else if (methodName ==  "shh_getMessages") {
            response, e = ethereumConnector.remoteProcedureCall(JSONRPCVersion, networkId, methodName, args[4]);
            if (e == null) {
                json JSONResponse= response.getJsonPayload();
                println(JSONResponse.toString());
            } else {
                println(e);
            }
        }
    } else {
        println(networkIdError);
    }
}
