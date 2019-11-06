console.time "tmp"
puts = console.log
###
###


Web3 = require "web3"
solc = require "solc"
request = require "request"
bi = require "big-integer"

ethfy = (w)-> Web3.utils.fromWei w, "ether"
weify = (w)-> Web3.utils.toWei w, "ether"

w3 =  new Web3()
w3.setProvider new w3.providers.HttpProvider('http://localhost:8545')


minerStart = (cpu=1)-> new Promise (f,r)->
  obj = {}
  obj.jsonrpc = "2.0"
  obj.method = "miner_start"
  obj.params = [cpu]
  obj.id = 100
  
  request.post
    uri: "http://localhost:8545"
    headers:
      "Accept" : "application/json"
      "Content-type" : 'application/json'
    body: JSON.stringify(obj)
  , (e,r,b)->
    if e?
      r e
    else
      f b


minerStop = -> new Promise (f,r)->
  obj = {}
  obj.jsonrpc = "2.0"
  obj.method = "miner_stop"
  obj.params = []
  obj.id = 100
  
  request.post
    uri: "http://localhost:8545"
    headers:
      "Accept" : "application/json"
      "Content-type" : 'application/json'
    body: JSON.stringify(obj)
  , (e,r,b)->
    if e?
      r e
    else
      f b







# スマートコントラクトのコンパイル
sol = """
pragma solidity 0.5.4;
contract Hell {
  function getBool() public pure returns(bool) {
    return true;
  }
  
  uint storedData;
  function set(uint x) public {
    storedData = x;
  }
  
  function get() public view returns (uint) {
    return storedData;
  }
  
}
"""

input =
  language: 'Solidity'
  sources:
    'hell.sol': 
      content: sol
  settings:
    outputSelection:
      '*':
        '*': ['*']

output = JSON.parse(solc.compile(JSON.stringify(input)))
bin = "0x" + output.contracts["hell.sol"]["Hell"].evm.bytecode.object
abi = output.contracts["hell.sol"]["Hell"].abi


# スマートコントラクトの登録
deploy = (abi, bin)-> new Promise (f)->
  await w3.eth.personal.unlockAccount (await w3.eth.getCoinbase()), "1212"
  await minerStart()
  
  myc = await new w3.eth.Contract(abi)
    .deploy
      data: bin
    .send
      from: (await w3.eth.getCoinbase())
      gas: (await w3.eth.estimateGas(data:bin))
  await minerStop()
  
  console.log "deploy contract:", myc._address
  f myc._address

deploy abi, bin
.then (address)->
  cont = new w3.eth.Contract(abi, address)
  console.log await cont.methods.getBool().call()
  
  console.log await cont.methods.get().call()
  
  await w3.eth.personal.unlockAccount (await w3.eth.getCoinbase()), "1212"
  
  await minerStart()
  
  tx = await cont.methods.set(4).send
    from: (await w3.eth.getCoinbase())
    gas: (await w3.eth.estimateGas(data:bin))
  console.log tx
  
  await minerStop()
  
  console.log await cont.methods.get().call()
  
  





###
sol = """
pragma solidity 0.5.4;
contract Hell {
  function getBool() public pure returns(bool) {
    return true;
  }
}
"""

input =
  language: 'Solidity'
  sources:
    'hell.sol': 
      content: sol
  settings:
    outputSelection:
      '*':
        '*': ['*']

output = JSON.parse(solc.compile(JSON.stringify(input)))
bin = "0x" + output.contracts["hell.sol"]["Hell"].evm.bytecode.object
abi = output.contracts["hell.sol"]["Hell"].abi


Promise.resolve().then ->
  opt = 
    from: (await w3.eth.getCoinbase())
    gas: (await w3.eth.estimateGas(data:bin))
    data: bin
  
  cont = new w3.eth.Contract(abi, opt)
  
  await w3.eth.personal.unlockAccount (await w3.eth.getCoinbase()), "1212"
  await minerStart()
  myc = await cont.deploy().send(opt)
  await minerStop()
  
  console.log myc._address
  
  # =====
  cont = new w3.eth.Contract(abi, myc._address)
  console.log await cont.methods.getBool().call()
###



###
# minerStart()
# minerStop()


abi = [{"constant":true,"inputs":[],"name":"getBool","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"pure","type":"function"}]
myc = "0x7753123f35cfd9eaf3fd82588559e94bbaed7a5e"
cont = new w3.eth.Contract(abi, myc)
cont.methods.getBool().call().then (v)->
  console.log "1",v

Promise.resolve()
.then ->
  y = await cont.methods.getBool().call()
  console.log "2",y
###


###
# "0xc3134c71093cac2a6114bf77c4b8c69f9347a91d"
fs = require("fs")
abi = JSON.parse fs.readFileSync("./SingleNumRegister_sol_SingleNumRegister.abi", "utf8")
bin = require("fs").readFileSync("./SingleNumRegister_sol_SingleNumRegister.bin", "utf8")
# puts abi
# puts bin

opt = 
  from: "0xd58f72e1cce931f09e09c26f9183e2a75c2e07f8"
  gasPrice:21000
  gas:21000
  data: bin

cont = new w3.eth.Contract(abi, opt)
puts cont.deploy()
setInterval ->
  puts cont
,1000
###





###
# 0x20fb99860ad0df03b6e9d793782a0ebc804adcdf
# solc = require "solc"
bin = "60806040523480156100115760006000fd5b50610017565b60da806100256000396000f3fe608060405234801560105760006000fd5b506004361060365760003560e01c80636d4ce63c14603c578063e5c19b2d146058576036565b60006000fd5b60426084565b6040518082815260200191505060405180910390f35b608260048036036020811015606d5760006000fd5b81019080803590602001909291905050506095565b005b600060006000505490506092565b90565b8060006000508190909055505b5056fea265627a7a7231582014dbc808ff5c46f575e0b522a4d0f9f4b1043dc4b62a0d7f606412633c164ab164736f6c634300050c0032"
abi = [{"constant":true,"inputs":[],"name":"get","outputs":[{"internalType":"int256","name":"retVal","type":"int256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"int256","name":"x","type":"int256"}],"name":"set","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}]


opt = 
  from: "0xd58f72e1cce931f09e09c26f9183e2a75c2e07f8"
  data: bin

# cont = new w3.eth.Contract(abi, "0x20fb99860ad0df03b6e9d793782a0ebc804adcdf", opt)
cont = new w3.eth.Contract(abi, opt)
puts cont.address
cont.deploy()
puts cont.address
###



###
w3.eth.getBlock("pending")
.then (v)-> v
###




###
# web3_clientVersion
# eth_blockNumber

request.post
  uri: "http://localhost:8545"
  headers:
    "Accept" : "application/json"
    "Content-type" : 'application/json'
  body: JSON.stringify(obj)
, (e,r,b)->
  if e?
    console.log "e:",e
  else
    console.log "b:",b
###


###
w3.eth.getBlock("pending")
.then (v)->
  puts v
  puts v.transactions.length

# eth.sendTransaction({from: eth.accounts[0], to: eth.accounts[1], value: web3.toWei(5, "ether")})
###



###
# puts weify "5"
# w3.eth.sendTransaction({from: w3.eth.accounts[0], to: w3.eth.accounts[1], value: Web3.utils.toWei(5, "ether")})

w3.eth.getAccounts()
.then (a)->
  puts a
  w3.eth.personal.unlockAccount a[0], "1212"
  .then (b)->
    puts a[1]
    w3.eth.sendTransaction
      from: a[0]
      to: a[1]
      value: weify "5"
      ,
      "1212"
    # .then (v)->
    #   puts v
    console.log "thend"
.catch (e)->
  console.log e
###



###
w3.eth.getCoinbase()
.then (v)->
  w3.eth.getBalance v
  .then (v)->
    puts v
    puts ethfy v
    puts weify ethfy v
###


###
w3.eth.getCoinbase()
.then (v)->
  puts v
###

###
w3.eth.getAccounts()
.then (v)->
  puts v
###

###
w3.eth.personal.newAccount("test")
.then (v)->
  puts v
###





