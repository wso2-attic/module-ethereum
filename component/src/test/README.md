# Testing Ballerina Ethereum Connector

### Starting Geth Client

1) Download the Geth client from https://geth.ethereum.org/downloads/
2) Install the Geth Client. https://ethereum.github.io/go-ethereum/install/
3) Run `geth` command in your commandline to check whether the installation is complete or not.

### enabling JSON RPC Server

1) Open a new commandline terminal.
2) Create a folder for chain data. Let's call that folder `<chaindata>`.
3) Run the following command. Please change the `<chaindata>` value with the actual folder path.
`geth --identity "testServer" --rpc --rpcport "8080" --rpccorsdomain "*" --datadir "<chaindata>/TestChain" --port "30304" --nodiscover --rpcapi "db,eth,net,web3,admin,shh" --networkid 1999 console --shh`

### Running Tests

1) Download the Ballerina tool distribution by navigating https://ballerinalang.org/downloads/
2) Extract ballerina-ethereum-0.95.0.zip and copy ballerina-ethereum-0.95.0.jar into the `<ballerina-tools>/bre/lib` folder.
3) Copy `connector-ethereum/component/test/` folder and paste it into any `<ballerina-tools>/bin` folder
2) Open a commandline terminal inside `<ballerina-tools>/bin`.
4) Run the following command.
`ballerina test test/`
