import ballerina.net.http;
import org.wso2.ballerina.connectors.ethereum;

public function main (string[] args) {

    endpoint<ethereum:ClientConnector> ethereumConnector {
        create ethereum:ClientConnector("http://localhost:8081");
    }

    http:Response response = {};
    http:HttpConnectorError e;
    json JSONResponse;

    response, e = ethereumConnector.web3ClientVersion("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.web3Sha3 ("2.0", 1999, "0x68656c6c6f20776f726c64");
    if(e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.netVersion("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.netListening("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.netPeerCount("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethSyncing("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethCoinbase("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethMining("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethHashrate("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethGasPrice("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethAccounts("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethBlockNumber("2.0", 1999);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethGetBalance("2.0", 1999, "0x69d26fed647f8f6fca079918946dfee74f1d4c18", "latest");
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethGetStorageAt("2.0", 1999, "0x69d26fed647f8f6fca079918946dfee74f1d4c18", "0x0",
                                                   "latest");
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.ethGetTransactionCount("2.0", 1999, "0x69d26fed647f8f6fca079918946dfee74f1d4c18", "latest");
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }

    response, e = ethereumConnector.remoteProcedureCall("2.0", 1999, "admin_peers", []);
    if (e == null) {
        JSONResponse = response.getJsonPayload();
        println(JSONResponse.toString());
    } else {
        println(e);
    }


}
