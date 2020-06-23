-module(mailbox).
-export([receiver/0]).

receiver() ->
    receive
        stop ->
            io:format("received stop.~n");
        Msg ->
            io:format("message:~w~n", [{ok,42}]),
            receiver()
    end.
