@echo off
rem geth --networkid "15" --nodiscover --datadir "./"
rem geth  --rpc --rpcport 8545 --rpcapi "web3,eth,net,personal,miner" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --datadir "./" --nodiscover --networkid 15
rem geth  --rpc --rpcport 8545 --rpcapi "web3,eth,net,personal,miner" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --datadir "./" --nodiscover --networkid 15 --allow-insecure-unlock
geth --datadir ./ init ./g.json
geth  --rpc --rpcport 8545 --rpcapi "web3,eth,net,personal,miner" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --datadir "./" --nodiscover --networkid 15


