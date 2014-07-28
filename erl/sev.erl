-module(sev).
-export([loop/0]).

loop() ->
  receive
    hello ->
      io:format("Hello!~n"),
      loop();
    bye ->
      io:format("See you!~n")
  end.
