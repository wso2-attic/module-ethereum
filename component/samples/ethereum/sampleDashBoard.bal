import ballerina.net.http;
import org.wso2.ballerina.connectors.ethereum;

const string latest = "latest";

// This is a simple dashboard for an Ethereum wallet
public function main (string[] args) {

    endpoint<ethereum:ClientConnector> ethereumConnector {
        create ethereum:ClientConnector(args[0]); //set args[0] as the URI of the JSON RPC server
    }

    string JSONRPCVersion = args[1]; //JSONRPC version of the ethereum node

    var networkId, networkIdError = <int> args[2]; //networkID: identity number in the ethereum network
    if (networkIdError == null) {

        http:Response response = {};
        http:HttpConnectorError e;
        json JSONResponse;

        println("Sample Ethereum Client");
        println("------------------------------------------------------");

        //get client version
        response, e = ethereumConnector.web3ClientVersion(JSONRPCVersion, networkId);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            println("Web3 Client Version: " + JSONResponse.result.toString());
        } else {
            println(e);
        }

        //get available account addresses
        response, e = ethereumConnector.ethAccounts(JSONRPCVersion, networkId);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            json accounts = JSONResponse.result;
            println("Number of accounts: " + lengthof accounts);
            println("\nAccount Balances");

            int i = 0;
            while (i < lengthof accounts) {
                //get the account balance for each account
                response, e = ethereumConnector.ethGetBalance(JSONRPCVersion, networkId, accounts[i].toString(),
                                                              latest);
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

        //get the number of the latest block
        response, e = ethereumConnector.ethBlockNumber(JSONRPCVersion, networkId);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            println("\nNumber of blocks: " + JSONResponse.result.toString());

        } else {
            println(e);
        }

        //get the details of the latest block
        println("\nlatest block details: ");
        response, e = ethereumConnector.ethGetBlockByNumber(JSONRPCVersion, networkId, latest, false);
        if (e == null) {
            JSONResponse = response.getJsonPayload();
            println(JSONResponse.result);

        } else {
            println(e);
        }

        //get the transactions of the latest block
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