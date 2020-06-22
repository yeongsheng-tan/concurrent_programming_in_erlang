-module(palin).
-export([palindrome_check/1]).

rem_punct(String) -> lists:filter(fun (Ch) ->
                                      not(lists:member(Ch,"\"\'\t\n "))
                                    end,
                                    String).

to_small(String) -> lists:map(fun(Ch) ->
                                  case ($A =< Ch andalso Ch =< $Z) of
                                      true -> Ch+32;
                                      false -> Ch
                                   end
                                 end,
                                 String).

palindrome_check(String) ->
    Normalise = to_small(rem_punct(String)),
    lists:reverse(Normalise) == Normalise.
