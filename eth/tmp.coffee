console.time "tmp"
puts = console.log
###
###


Web3 = require "web3"
bi = require "big-integer"
ethfy = (w)-> Web3.utils.fromWei w, "ether"
weify = (w)-> Web3.utils.toWei w, "ether"

w3 =  new Web3()
w3.setProvider new w3.providers.HttpProvider('http://localhost:8545')

request = require "request"



###
w3.eth.getBlock("pending")
.then (v)-> v
###


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
###
w3.eth.getBlock("pending")
.then (v)->
  puts v
  puts v.transactions.length

# eth.sendTransaction({from: eth.accounts[0], to: eth.accounts[1], value: web3.toWei(5, "ether")})

###
# puts weify "5"

w3.eth.getAccounts()
.then (a)->
  w3.eth.personal.unlockAccount a[0], "12121212"
  .then (b)->
    puts a[1]
    w3.eth.sendTransaction
      from: a[0]
      to: a[1]
      value: weify "5"
      ,
      "12121212"
    .then (v)->
      puts v
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





