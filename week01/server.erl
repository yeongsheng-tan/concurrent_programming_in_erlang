-module(server).
-import(palin,[palindrome_check/1]).
-export([server/1]).

server(Pid) ->
  receive
    {check, String} ->
      case palin:palindrome_check(String) of
        true ->
          Pid ! {result, "\"" ++ String ++ "\" is a palindrome."},
          server(Pid);
        _ ->
          Pid ! {result, "\"" ++ String ++ "\" is not a palindrome."},
          server(Pid)
      end;
    _Message ->
      ok
  end.
