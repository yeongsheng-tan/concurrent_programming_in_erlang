-module(foo).
-export([bar/0,bar/1,baz/0,bazz/0]).

bar() ->
  timer:sleep(500),
  io:format("bar started~n"),
  io:format("bar working~n"),
  io:format("bar finished~n").

bar(Pid) ->
  Pid ! "bar started~n",
  Pid ! "bar working~n",
  Pid ! "bar finished~n".

baz() ->
  receive
    Msg ->
      io:format("got: ~s~n", [Msg])
  end,
  baz().

bazz() ->
  receive
    stop ->
      io:format("stopped~n");
    Msg ->
      io:format("got: ~s~n", [Msg]),
      bazz()
  end.
