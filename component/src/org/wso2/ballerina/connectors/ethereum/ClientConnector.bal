package org.wso2.ballerina.connectors.ethereum;

import ballerina.net.http;

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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "web3_clientVersion", []));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "web3_sha3", [data]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "net_version", []));
        return response, e;
    }

    @Description{ value : "Returns true if client is actively listening for network connections, otherwise false"}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action netListening(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "net_listening", []));
        return response, e;
    }

    @Description{ value : "Returns number of peers currently connected to the client."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action netPeerCount(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "net_peerCount", []));
        return response, e;
    }

    @Description{ value : "Returns an object with data about the sync status or false."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethSyncing(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_syncing", []));
        return response, e;
    }

    @Description{ value : "Returns the client coinbase address."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethCoinbase(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_coinbase", []));
        return response, e;
    }

    @Description{ value : "Returns true if client is actively mining new blocks."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethMining(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_mining", []));
        return response, e;
    }

    @Description{ value : "Returns the number of hashes per second that the node is mining with."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethHashrate(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_hashrate", []));
        return response, e;
    }

    @Description{ value : "Returns the current price per gas in wei."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGasPrice(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_gasPrice", []));
        return response, e;
    }

    @Description{ value : "Returns a list of addresses owned by client."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethAccounts(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_accounts", []));
        return response, e;
    }

    @Description{ value : "Returns the number of most recent block."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethBlockNumber(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_blockNumber", []));
        return response, e;
    }

    @Description{ value : "Returns the balance of the account of given address."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "accountAddress : 20 Bytes - address to check for balance."}
    @Param { value : "block : Integer block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetBalance(string jsonRPCVersion, int id, string address, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getBalance", [address, block]));
        return response, e;
    }

    @Description{ value : "Returns the value from a storage position at a given address"}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 20 Bytes - address to check for balance."}
    @Param { value : "position : Integer of the position in the storage."}
    @Param { value : "block :  Integer block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetStorageAt(string jsonRPCVersion, int id, string address, string position, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getStorageAt",
                                                            [address, position, block]));
        return response, e;
    }

    @Description{ value : "Returns the number of transactions sent from an address."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 20 Bytes - address to check for balance."}
    @Param { value : "block : Integer block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetTransactionCount(string jsonRPCVersion, int id, string address, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getTransactionCount",
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getBlockTransactionCountByHash",
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getBlockTransactionCountByNumber",
                                                            [block]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getUncleCountByBlockHash",
                                                            [hash]));
        return response, e;
    }

    @Description{ value : ""}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "block : integer of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetUncleCountByBlockNumber(string jsonRPCVersion, int id, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getUncleCountByBlockNumber",
                                                            [block]));
        return response, e;
    }

    @Description{ value : "Returns code at a given address."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "address : 20 Bytes - address"}
    @Param { value : "block : integer of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetCode(string jsonRPCVersion, int id, string address, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getCode", [address, block]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_sign", [address, message]));
        return response, e;
    }

    @Description{ value : "Creates a message call transaction or a contract creation, if the data field contains code."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "transactionObject : The transaction object
        from: DATA, 20 Bytes - The address the transaction is send from.
        to: DATA, 20 Bytes - (optional when creating new contract) The address the transaction is directed to.
        gas: QUANTITY - (optional, default: 90000) Integer of the gas provided for the transaction execution.
        gasPrice: QUANTITY - (optional, default: To-Be-Determined) Integer of the gasPrice used for each paid gas
        value: QUANTITY - (optional) Integer of the value send with this transaction
        data: DATA - The compiled code of a contract OR the hash of the invoked method signature and encoded parameters.
        nonce: QUANTITY - (optional) Integer of a nonce."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethSendTransaction(string jsonRPCVersion, int id, json transactionObject)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_sendTransaction",
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_sendRawTransaction",
                                                            [signedTransactionData]));
        return response, e;
    }

    @Description{ value : ""}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "transactionCallObject : The transaction call object
        from: DATA, 20 Bytes - (optional) The address the transaction is sent from.
        to: DATA, 20 Bytes - The address the transaction is directed to.
        gas: QUANTITY - (optional) Integer of the gas provided for the transaction execution.
            eth_call consumes zero gas, but this parameter may be needed by some executions.
        gasPrice: QUANTITY - (optional) Integer of the gasPrice used for each paid gas
        value: QUANTITY - (optional) Integer of the value send with this transaction
        data: DATA - (optional) Hash of the method signature and encoded parameters."}
    @Param { value : "block : integer of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethCall(string jsonRPCVersion, int id, json transactionCallObject, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_call",
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
        gas: QUANTITY -  Integer of the gas provided for the transaction execution.
        gasPrice: QUANTITY -  Integer of the gasPrice used for each paid gas
        value: QUANTITY -  Integer of the value send with this transaction
        data: DATA - (optional) Hash of the method signature and encoded parameters."}
    @Param { value : "block : integer of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethEstimateGas(string jsonRPCVersion, int id, json transactionCallObject, string block)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_estimateGas",
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getBlockByHash",
                                                            [hash, fullTransaction]));
        return response, e;
    }

    @Description{ value : "Returns information about a block by block number."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "block : integer of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Param { value : "fullTransaction : If true it returns the full transaction objects,
        if false only the hashes of the transactions."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetBlockByNumber(string jsonRPCVersion, int id, string block, boolean fullTransaction)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getBlockByNumber",
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getTransactionByHash", [hash]));
        return response, e;
    }

    @Description{ value : "Returns information about a transaction by block number and transaction index position."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "hash : 32 Bytes - hash of a transaction"}
    @Param { value : "position : Integer of the transaction index position."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetTransactionByBlockHashAndIndex(string jsonRPCVersion, int id, string hash, string position)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getTransactionByBlockHashAndIndex",
                                                            [hash, position]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getTransactionReceipt", [hash]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getUncleByBlockHashAndIndex",
                                                            [hash, position]));
        return response, e;
    }

    @Description{ value : "Returns information about a uncle of a block by number and uncle index position."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Param { value : "block : integer of a block number, or the string 'latest', 'earliest' or 'pending'"}
    @Param { value : "position :  The uncle's index position."}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethGetUncleByBlockNumberAndIndex(string jsonRPCVersion, int id, string block, string position)
    (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getUncleByBlockNumberAndIndex",
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getCompilers", []));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_compileSolidity", [source]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_compileLLL", [source]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_compileSerpent", [source]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_newFilter", [filterOptions]));
        return response, e;
    }

    @Description{ value : "Creates a filter in the node, to notify when a new block arrives."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethNewBlockFilter(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_newBlockFilter", []));
        return response, e;
    }

    @Description{ value : "Creates a filter in the node, to notify when new pending transactions arrive."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action ethNewPendingTransactionFilter(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_newPendingTransactionFilter", []));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_uninstallFilter", [filterId]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getFilterChanges", [filterId]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getFilterLogs", [filterId]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getLogs", [filterObject]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_getWork", []));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_submitWork",
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "eth_submitHashrate",
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_version", []));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_post", [postObject]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_newIdentity", [address]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_hasIdentity", [address]));
        return response, e;
    }

    @Description{ value : "Creates new group."}
    @Param { value : "jsonRPCVersion : JSON RPC version"}
    @Param { value : "id : Network id"}
    @Return{ value : "Response object."}
    @Return{ value : "Error occured during HTTP client invocation." }
    action shhNewGroup(string jsonRPCVersion, int id) (http:Response, http:HttpConnectorError) {
        http:Response response = {};
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_newGroup", []));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_addToGroup", [address]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_newFilter", [filterOptions]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_uninstallFilter", [filterId]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_getFilterChanges", [filterId]));
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
        response, e = ethereumEP.post("/", constructRequest(jsonRPCVersion, id, "shh_getMessages", [filterId]));
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
