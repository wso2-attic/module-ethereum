import ballerina.net.http;
import org.wso2.ballerina.connectors.ethereum;

public function main (string[] args) {

    endpoint<ethereum:ClientConnector> ethereumConnector {
        create ethereum:ClientConnector(args[0]);
    }

    string JSONRPCVersion = args[1];

    var networkId, networkIdError = <int> args[2];
    if (networkIdError == null) {

        string latest = "latest";
        http:Response response = {};
        http:HttpConnectorError e;
        json JSONResponse;

        println("Sample Ethereum Client");
        println("------------------------------------------------------");

        response, e = ethereumConnector.web3ClientVersion(JSONRPCVersion, networkId);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            println("Web3 Client Version: " + JSONResponse.result.toString());
        } else {
            println(e);
        }

        response, e = ethereumConnector.ethAccounts(JSONRPCVersion, networkId);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            json accounts = JSONResponse.result;
            println("Number of accounts: " + lengthof accounts);
            println("\nAccount Balances");

            int i = 0;
            while (i < lengthof accounts) {
                response, e = ethereumConnector.ethGetBalance(JSONRPCVersion, networkId, accounts[i].toString(), latest);
                if (e == null) {
                    JSONResponse = response.getJsonPayload();
                    println(accounts[i].toString() + "\t" + JSONResponse.result.toString());

                } else {
                    println(e);
                }
                i = i + 1;
            }

        } else {
            println(e);
        }

        response, e = ethereumConnector.ethBlockNumber(JSONRPCVersion, networkId);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            println("\nNumber of blocks: " + JSONResponse.result.toString());

        } else {
            println(e);
        }

        println("\nlatest block details: ");
        response, e = ethereumConnector.ethGetBlockByNumber(JSONRPCVersion, networkId, latest, false);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            println(JSONResponse.result);

        } else {
            println(e);
        }

        println("\nlatest block transactions:");
        response, e = ethereumConnector.ethGetBlockTransactionCountByNumber(JSONRPCVersion, networkId, latest);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            println(JSONResponse.result);

        } else {
            println(e);
        }
    } else {
        println(networkIdError);
    }

}