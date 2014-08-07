-module(sev).
-export([loop/0]).

loop() ->
  receive
    hello ->
      io:format("g2 Hell~n"),
      loop();
    bye ->
      io:format("CUa!~n")
  end.
