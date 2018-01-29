package org.wso2.ballerina.connectors.ethereum;

import ballerina.net.http;

json emptyParams = [];

@Description{ value : "Ethereum client connector."}
@Param{ value : "URI: URI of the Ethereum JSON - RPC server."}
public connector ClientConnector (string URI) {

    endpoint<http:HttpClient> ethereumEP {
        create http:HttpClient(URI, {});
    }
    http:HttpConnectorError e;

    @Description{ value : "Returns the current client version."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action web3ClientVersion(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, web3ClientVersionMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns Keccak-256 (not the standardized SHA3-256) of the given data."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "data : the data to convert into a SHA3 hash"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action web3Sha3(string jsonRPCVersion, int id, string data) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, web3Sha3Method, [data]));
        return response, e;
    }

    @Description{ value : "Returns the current network id.String - The current network id.
        1: Ethereum Mainnet,
        2: Morden Testnet (deprecated),
        3: Ropsten Testnet,
        4: Rinkeby Testnet,
        42: Kovan Testnet"}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action netVersion(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, netVersionMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns true if client is actively listening for network connections, otherwise false"}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action netListening(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, netListeningMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns number of peers currently connected to the client."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action netPeerCount(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, netPeerCountMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns the current ethereum protocol version."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethProtocolVersion(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethProtocolVersionMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns an object with data about the sync status or false."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethSyncing(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethSyncingMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns the client coinbase address."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethCoinbase(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethCoinbaseMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns true if client is actively mining new blocks."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethMining(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethMiningMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns the number of hashes per second that the node is mining with."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethHashrate(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethHashrateMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns the current price per gas in wei."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGasPrice(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGasPriceMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns a list of addresses owned by client."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethAccounts(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethAccountsMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns the number of most recent block."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethBlockNumber(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethBlockNumberMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns the balance of the account of given address."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "accountAddress : 20 Bytes - address to check for balance."}
    @Param { value : "block : Hex value block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetBalance(string jsonRPCVersion, int id, string address, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetBalanceMethod, [address, block]));
        return response, e;
    }

    @Description{ value : "Returns the value from a storage position at a given address"}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 20 Bytes - address to check for balance."}
    @Param { value : "position : Hex value of the position in the storage."}
    @Param { value : "block :  Hex value block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetStorageAt(string jsonRPCVersion, int id, string address, string position, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetStorageAtMethod,
                                                            [address, position, block]));
        return response, e;
    }

    @Description{ value : "Returns the number of transactions sent from an address."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 20 Bytes - address to check for balance."}
    @Param { value : "block : Hex value block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetTransactionCount(string jsonRPCVersion, int id, string address, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetTransactionCountMethod,
                                                            [address, block]));
        return response, e;
    }


    @Description{ value : "Returns the number of transactions in a block from a block matching the given block hash."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hash : 32 Bytes - hash of a block"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetBlockTransactionCountByHash(string jsonRPCVersion, int id, string hash)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetBlockTransactionCountByHashMethod,
                                                            [hash]));
        return response, e;
    }

    @Description{ value : "Returns the number of transactions in a block matching the given block number."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "block : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetBlockTransactionCountByNumber(string jsonRPCVersion, int id, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                            ethGetBlockTransactionCountByNumberMethod, [block]));
        return response, e;
    }

    @Description{ value : "Returns the number of uncles in a block from a block matching the given block hash."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hash : 32 Bytes - hash of a block"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetUncleCountByBlockHash(string jsonRPCVersion, int id, string hash)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetUncleCountByBlockHashMethod,
                                                            [hash]));
        return response, e;
    }

    @Description{ value : ""}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "block : Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetUncleCountByBlockNumber(string jsonRPCVersion, int id, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetUncleCountByBlockNumberMethod,
                                                            [block]));
        return response, e;
    }

    @Description{ value : "Returns code at a given address."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 20 Bytes - address"}
    @Param { value : "block : Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetCode(string jsonRPCVersion, int id, string address, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetCodeMethod, [address, block]));
        return response, e;
    }

    @Description{ value : "The sign method calculates an Ethereum specific signature with."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 20 Bytes - address"}
    @Param { value : "message : message to sign"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethSign(string jsonRPCVersion, int id, string address, string message)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethSignMethod, [address, message]));
        return response, e;
    }

    @Description{ value : "Creates a message call transaction or a contract creation, if the data field contains code."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "transactionObject : The transaction object
        from: DATA, 20 Bytes - The address the transaction is send from.
        to: DATA, 20 Bytes - (optional when creating new contract) The address the transaction is directed to.
        gas: QUANTITY - (optional, default: 90000) Hex value of the gas provided for the transaction execution.
        gasPrice: QUANTITY - (optional, default: To-Be-Determined) Hex value of the gasPrice used for each paid gas
        value: QUANTITY - (optional) Hex value of the value send with this transaction
        data: DATA - The compiled code of a contract OR the hash of the invoked method signature and encoded parameters.
        nonce: QUANTITY - (optional) Hex value of a nonce."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethSendTransaction(string jsonRPCVersion, int id, json transactionObject)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethSendTransactionMethod,
                                                            [transactionObject]));
        return response, e;
    }

    @Description{ value : "Creates new message call transaction or a contract creation for signed transactions."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "signedTransactionData :  The signed transaction data."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethSendRawTransaction(string jsonRPCVersion, int id, string signedTransactionData)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethSendRawTransactionMethod,
                                                            [signedTransactionData]));
        return response, e;
    }

    @Description{ value : ""}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "transactionCallObject : The transaction call object
        from: DATA, 20 Bytes - (optional) The address the transaction is sent from.
        to: DATA, 20 Bytes - The address the transaction is directed to.
        gas: QUANTITY - (optional) Hex value of the gas provided for the transaction execution.
            eth_call consumes zero gas, but this parameter may be needed by some executions.
        gasPrice: QUANTITY - (optional) Hex value of the gasPrice used for each paid gas
        value: QUANTITY - (optional) Hex value of the value send with this transaction
        data: DATA - (optional) Hash of the method signature and encoded parameters."}
    @Param { value : "block : Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethCall(string jsonRPCVersion, int id, json transactionCallObject, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethCallMethod,
                                                            [transactionCallObject, block]));
        return response, e;
    }

    @Description{ value : "Makes a call or transaction, which won't be added to the blockchain and returns the used gas,
        which can be used for estimating the used gas."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "transactionCallObject : The transaction call object
        from: DATA, 20 Bytes - The address the transaction is sent from.
        to: DATA, 20 Bytes - The address the transaction is directed to.
        gas: QUANTITY -  Hex value of the gas provided for the transaction execution.
        gasPrice: QUANTITY -  Hex value of the gasPrice used for each paid gas
        value: QUANTITY -  Hex value of the value send with this transaction
        data: DATA - (optional) Hash of the method signature and encoded parameters."}
    @Param { value : "block : Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethEstimateGas(string jsonRPCVersion, int id, json transactionCallObject, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethEstimateGasMethod,
                                                            [transactionCallObject, block]));
        return response, e;
    }

    @Description{ value : "Returns information about a block by hash."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hash : 32 Bytes - Hash of a block."}
    @Param { value : "fullTransaction : If true it returns the full transaction objects,
        if false only the hashes of the transactions."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetBlockByHash(string jsonRPCVersion, int id, string hash, boolean fullTransaction)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetBlockByHashMethod,
                                                            [hash, fullTransaction]));
        return response, e;
    }

    @Description{ value : "Returns information about a block by block number."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "block : Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Param { value : "fullTransaction : If true it returns the full transaction objects,
        if false only the hashes of the transactions."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetBlockByNumber(string jsonRPCVersion, int id, string block, boolean fullTransaction)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetBlockByNumberMethod,
                                                            [block, fullTransaction]));
        return response, e;
    }

    @Description{ value : "Returns the information about a transaction requested by transaction hash."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hash : 32 Bytes - hash of a transaction"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetTransactionByHash(string jsonRPCVersion, int id, string hash)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetTransactionByHashMethod, [hash]));
        return response, e;
    }

    @Description{ value : "Returns information about a transaction by block hash and transaction index position."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hash : 32 Bytes - hash of a transaction"}
    @Param { value : "position : Hex value of the transaction index position."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetTransactionByBlockHashAndIndex(string jsonRPCVersion, int id, string hash, string position)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                            ethGetTransactionByBlockHashAndIndexMethod,
                                                            [hash, position]));
        return response, e;
    }

    @Description{ value : "Returns information about a transaction by block number and transaction index position."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "block : Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Param { value : "position : Hex value of the transaction index position."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetTransactionByBlockNumberAndIndex(string jsonRPCVersion, int id, string block, string position)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                            ethGetTransactionByBlockHashAndIndexMethod,
                                                            [block, position]));
        return response, e;
    }

    @Description{ value : "Returns the receipt of a transaction by transaction hash."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hash : 32 Bytes - hash of a transaction"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetTransactionReceipt(string jsonRPCVersion, int id, string hash)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id,
                                                            ethGetTransactionReceiptMethod, [hash]));
        return response, e;
    }

    @Description{ value : "Returns information about a uncle of a block by hash and uncle index position."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hash : 32 Bytes - hash of a transaction"}
    @Param { value : "position :  The uncle's index position."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetUncleByBlockHashAndIndex (string jsonRPCVersion, int id, string hash, string position)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetUncleByBlockHashAndIndexMethod,
                                                            [hash, position]));
        return response, e;
    }

    @Description{ value : "Returns information about a uncle of a block by number and uncle index position."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "block : Hex value of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Param { value : "position :  The uncle's index position."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetUncleByBlockNumberAndIndex(string jsonRPCVersion, int id, string block, string position)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetUncleByBlockNumberAndIndexMethod,
                                                            [block, position]));
        return response, e;
    }

    @Description{ value : "Returns a list of available compilers in the client."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetCompilers(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetCompilersMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Returns compiled solidity code."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "source : The source code."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethCompileSolidity(string jsonRPCVersion, int id, string source) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethCompileSolidityMethod, [source]));
        return response, e;
    }

    @Description{ value : "Returns compiled LLL code."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "source : The source code."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethCompileLLL(string jsonRPCVersion, int id, string source) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethCompileLLLMethod, [source]));
        return response, e;
    }

    @Description{ value : "Returns compiled serpent code."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "source : The source code."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethCompileSerpent(string jsonRPCVersion, int id, string source) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethCompileSerpentMethod, [source]));
        return response, e;
    }

    @Description{ value : "Creates a filter object, based on filter options, to notify when the state changes (logs)"}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterOptions :  The filter options"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethNewFilter(string jsonRPCVersion, int id, json filterOptions) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethNewFilterMethod, [filterOptions]));
        return response, e;
    }

    @Description{ value : "Creates a filter in the node, to notify when a new block arrives."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethNewBlockFilter(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethNewBlockFilterMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Creates a filter in the node, to notify when new pending transactions arrive."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethNewPendingTransactionFilter(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethNewPendingTransactionFilterMethod,
                                                            emptyParams));
        return response, e;
    }

    @Description{ value : "Uninstalls a filter with given id."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterId : The filter id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethUninstallFilter(string jsonRPCVersion, int id, string filterId) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethUninstallFilterMethod, [filterId]));
        return response, e;
    }

    @Description{ value : "Polling method for a filter, which returns an array of logs which occurred since last poll."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterId : The filter id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetFilterChanges(string jsonRPCVersion, int id, string filterId)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetFilterChangesMethod, [filterId]));
        return response, e;
    }

    @Description{ value : "Returns an array of all logs matching filter with given id."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterId : The filter id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetFilterLogs(string jsonRPCVersion, int id, string filterId) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetFilterLogsMethod, [filterId]));
        return response, e;
    }

    @Description{ value : "Returns an array of all logs matching a given filter object."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterObject : The filter object"}
    @Return{ value : "Response object"}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetLogs(string jsonRPCVersion, int id, json filterObject) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetLogsMethod, [filterObject]));
        return response, e;
    }

    @Description{ value : "Returns the hash of the current block, the seedHash, and the boundary condition to be met
        ('target')."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetWork(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethGetWorkMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Used for submitting a proof-of-work solution."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "nonce : 8 Bytes - The nonce found"}
    @Param { value : "powHash : 32 Bytes - The header's pow-hash"}
    @Param { value : "mixDigest : 32 Bytes - The mix digest"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethSubmitWork(string jsonRPCVersion, int id, string nonce, string powHash, string mixDigest)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethSubmitWorkMethod,
                                                            [nonce, powHash, mixDigest]));
        return response, e;
    }

    @Description{ value : "Used for submitting mining hashrate."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hashrate : Hexadecimal string representation (32 bytes) of the hash rate"}
    @Param { value : "clientId : Random hexadecimal(32 bytes) ID identifying the client"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethSubmitHashrate(string jsonRPCVersion, int id, string hashrate, string clientId)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, ethSubmitHashrateMethod,
                                                            [hashrate, clientId]));
        return response, e;
    }

    @Description{ value : "Returns the current whisper protocol version."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhVersion(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhVersionMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Sends a whisper message."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "postObject : The whisper post object"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhPost(string jsonRPCVersion, int id, json postObject) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhPostMethod, [postObject]));
        return response, e;
    }

    @Description{ value : "Creates new whisper identity in the client."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 60 Bytes - the address of the new identiy"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhNewIdentity(string jsonRPCVersion, int id, string address) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhNewIdentityMethod, [address]));
        return response, e;
    }

    @Description{ value : "Checks if the client hold the private keys for a given identity."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 60 Bytes - The identity address to check."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhHasIdentity(string jsonRPCVersion, int id, string address) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhHasIdentityMethod, [address]));
        return response, e;
    }

    @Description{ value : "Creates new group."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhNewGroup(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhNewGroupMethod, emptyParams));
        return response, e;
    }

    @Description{ value : "Adds identities to a group"}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 60 Bytes - The identity address to add to a group."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhAddToGroup(string jsonRPCVersion, int id, string address) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhAddToGroupMethod, [address]));
        return response, e;
    }

    @Description{ value : "Creates filter to notify, when client receives whisper message matching the filter options."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterOptions : The filter options:
        to: DATA, 60 Bytes - (optional) Identity of the receiver.
        topics: Array of DATA - Array of DATA topics which the incoming message's topics should match."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhNewFilter(string jsonRPCVersion, int id, json filterOptions) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhNewFilterMethod, [filterOptions]));
        return response, e;
    }

    @Description{ value : "Uninstalls a filter with given id."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterId : The filter id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhUninstallFilter(string jsonRPCVersion, int id, string filterId) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhUninstallFilterMethod, [filterId]));
        return response, e;
    }

    @Description{ value : "Polling method for whisper filters. Returns new messages since the last call of this method.
    "}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterId : The filter id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhGetFilterChanges(string jsonRPCVersion, int id, string filterId)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhGetFilterChangesMethod, [filterId]));
        return response, e;
    }

    @Description{ value : "Get all messages matching a filter. "}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "filterId : The filter id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhGetMessages(string jsonRPCVersion, int id, string filterId) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, shhGetMessagesMethod, [filterId]));
        return response, e;
    }

    @Description{ value : "Generic method for Ethereum RPC"}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "method : Method name"}
    @Param { value : "params : parameter array"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action remoteProcedureCall(string jsonRPCVersion, int id, string method, json params)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, method, params));
        return response, e;
    }
}

function constructRequest(string jsonRPCVersion, int id, string method, json params)(http:Request){
    http:Request request = {};
    request.setHeader("Content-Type","application/json");
    request.setJsonPayload({"jsonrpc" : jsonRPCVersion, "id": id,  "method" : method, "params" : params});
    return request;
}
