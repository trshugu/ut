@echo off
rem geth --networkid "15" --nodiscover --datadir "./"
rem geth  --rpc --rpcport 8545 --rpcapi "web3,eth,net,personal,miner" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --datadir "./" --nodiscover --networkid 15
rem geth --networkid "15" --nodiscover --datadir "./" console 2>> ./geth_err.log
rem geth --datadir ./ init ./g.json
rem geth  --rpc --rpcport 8545 --rpcapi "web3,eth,net,personal,miner" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --datadir "./" --nodiscover --networkid 15
rem geth  --rpc --rpcport 8545 --rpcapi "web3,eth,net,personal,miner" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --datadir "./" --nodiscover --networkid "15" --allow-insecure-unlock
rem geth.exe  --rpc --rpcport 8545 --rpcapi "web3,eth,net,personal,miner" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --datadir "./" --nodiscover --networkid "15"
rem geth.exe --datadir "./" --testnet --syncmode "fast"
rem geth.exe --datadir "./" --testnet --syncmode "fast" --bootnodes "enode://6332792c4a00e3e4ee0926ed89e0d27ef985424d97b6a45bf0f23e51f0dcb5e66b875777506458aea7af6f9e4ffb69f43f3778ee73c81ed9d34c51c4b16b0b0f@52.232.243.152:30303,enode://94c15d1b9e2fe7ce56e458b9a3b672ef11894ddedd0c6f247e0f1d3487f52b66208fb4aeb8179fce6e3a749ea93ed147c37976d67af557508d199d9594c35f09@192.81.208.223:30303"
rem geth.exe --datadir "./" --testnet --syncmode "fast" --bootnodes "enode://20c9ad97c081d63397d7b685a412227a40e23c8bdc6688c6f37e97cfbc22d2b4d1db1510d8f61e6a8866ad7f0e17c02b14182d37ea7c3c8b9c2683aeb6b733a1@52.169.14.227:30303,enode://6ce05930c72abc632c58e2e4324f7c7ea478cec0ed4fa2528982cf34483094e9cbc9216e7aa349691242576d552a2a56aaeae426c5303ded677ce455ba1acd9d@13.84.180.240:30303"
rem geth.exe --datadir "./" --testnet --cache 1024 --bootnodes "enode://7df4f8fa037f82cc03ba0c1acd3fccba4ae40fc03704283979f074cadf37cc5b70845d1acee4161c3432eb6934ba3020cbaf9cc2ba841cdfb03d113ebeef5b79@172.104.5.185:30303"
rem geth.exe --datadir "./" --testnet --syncmode "light" --cache 2048 --bootnodes "enode://6332792c4a00e3e4ee0926ed89e0d27ef985424d97b6a45bf0f23e51f0dcb5e66b875777506458aea7af6f9e4ffb69f43f3778ee73c81ed9d34c51c4b16b0b0f@52.232.243.152:30303,enode://94c15d1b9e2fe7ce56e458b9a3b672ef11894ddedd0c6f247e0f1d3487f52b66208fb4aeb8179fce6e3a749ea93ed147c37976d67af557508d199d9594c35f09@192.81.208.223:30303"
rem geth.exe --datadir "./" --testnet --cache 2048 --bootnodes "enode://6332792c4a00e3e4ee0926ed89e0d27ef985424d97b6a45bf0f23e51f0dcb5e66b875777506458aea7af6f9e4ffb69f43f3778ee73c81ed9d34c51c4b16b0b0f@52.232.243.152:30303,enode://94c15d1b9e2fe7ce56e458b9a3b672ef11894ddedd0c6f247e0f1d3487f52b66208fb4aeb8179fce6e3a749ea93ed147c37976d67af557508d199d9594c35f09@192.81.208.223:30303"
rem geth.exe --datadir "./" --testnet --cache 2048 --bootnodes "enode://20c9ad97c081d63397d7b685a412227a40e23c8bdc6688c6f37e97cfbc22d2b4d1db1510d8f61e6a8866ad7f0e17c02b14182d37ea7c3c8b9c2683aeb6b733a1@52.169.14.227:30303,enode://6ce05930c72abc632c58e2e4324f7c7ea478cec0ed4fa2528982cf34483094e9cbc9216e7aa349691242576d552a2a56aaeae426c5303ded677ce455ba1acd9d@13.84.180.240:30303"
rem geth --datadir "./"
geth --datadir "./" --syncmode "light"
