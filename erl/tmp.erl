-module(tmp). -compile(export_all).


main(_)->tmp(). tmp() ->
%%
%%io:format(),







%%バイナリデータinput.datを読み込んで、それをoutput.datに2回書き込む。
%{ok, B} = file:read_file("input.dat"),
%file:write_file("output.dat", B),
%file:write_file("output.dat", B, [binary, append]),


%% ファイル入出力
%{ok, In} = file:open("input.txt", read),
%{N, _} = string:to_integer( io:get_line(In, '') ),

%{ok, Ou} = file:open("output.txt", write),
%io:format( Ou, "~p~n", [N*2] ),


%% for文
%for(1, 10, fun(I) -> io:format("~p~n", [I*I]) end),


%% if文
%N = 10,

%% Resultにはsameが入る.
%Result = if
%    N < 10 -> low;
%    N =:= 10 -> same;
%    N > 10 -> high
%end,

%io:format("~p",[Result]),


%% case文
%X = case {20, 30, 40} of
%  {10, A, B} -> one;
%  {20, A, B} when A > 50 -> two;
%  {20, A, _} when A < 50 -> three;
%  true -> others
%end,

%io:format("~p",[X]),


%% 無名関数
%F = fun(X) -> X * 3 end,
%io:format("~p",[F(10)]),



%% ガードの利用
%Odd = sum_odd([3,6,4,5]),
%io:format("~p",[Odd]),


%% sum関数
%Su = sum([2,4]),
%io:format("~p",[Su]),

%Nu = sum([]),
%io:format("~p",[Nu]),



%% 整数と浮動小数点数の比較以外では==と/=の代わりに、=:=と=/=を使う
%N1 = 1,
%N2 = 1,

% N1はN2と等しい.
%io:format(N1 == N2),
%io:format("~n"),

% N1はN2と同一.
%io:format(N1 =:= N2),
%io:format("~n"),

% N1はN2と等しくない.
%io:format(N1 /= N2),
%io:format("~n"),

% N1はN2と同一でない.
%io:format(N1 =/= N2),
%io:format("~n"),

% N1はN2より小さい.
%io:format(N1 < N2),
%io:format("~n"),

% N1はN2より大きい.
%io:format(N1 > N2),
%io:format("~n"),

% N1はN2以下.
%io:format(N1 =< N2),
%io:format("~n"),

% N1はN2以上.
%io:format(N1 >= N2),
%io:format("~n"),




%% 切り出し.
%S = string:substr("abcd", 1, 2),
%io:format(S),
%io:format("~n"),

%% 検索.
%R = string:rstr("abcd", "cd"),
%io:format("~p~n",[R]),


%% 画面出力
%% ~w : Erlangの標準構文として出力(アトムならそのまま、文字列ならリストとして出力など)
%% ~f : 浮動小数点数を出力.
%% ~p : 整形して出力.
%% ~s : 文字列を出力.
%% ~n : 改行.

%io:format("Hello world~n"),
%io:format("~-5w, ~6.3f, ~p, ~s~n", [5, 1.23456, 30, "erlang"]),
%% "5    ,  1.235, 30, erlang"


%% 長さ.
%L = length("abc"),
%io:format("~p",[L]),
%io:format("~n"),


%% 分割,
%Spbin = re:split("aaa, bbb, ccc", "\s*,\s*"),
%io:format(Spbin),
%io:format("~n"),

%% もう存在しない
%Reg = regexp:split("aaa, bbb, ccc", "\s*,\s*"),
%io:format(Reg),
%io:format("~n"),

%% ジョイン,
%%A = join(["aaa", "bbb", "ccc~n"]),
%%io:format(A),


%%fib:printfibo(2)
%%printfibo(2)


io:format("~n").
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-export([tmp/0]).
%-export([main/1]).
%-import(fib, [printfibo/1]).


%%-export([join/1]).
%%join([]) -> [];
%%join([H|T]) -> string:concat(H, join(T)).


%%tmp(_) ->
%%A = [1,2,3],
%%lists:nth(1,A),
%%hd(A),
%%io:format("print"),
%%Mon = 3,
%%Con = string:concat("fdfd","rere"),
%%io:format("hell day ~p ~n", [Con] )
%%
%%io:format("maimai")
%%.

%%tmp() -> io:format("hells~n").
%%tmp() -> io:format("hell").

%% sum関数
%sum([]) -> 0;
%sum([H|T]) -> H + sum(T).

%% ガードの利用
%sum_odd([]) -> 0;
%sum_odd([H|T]) when H rem 2 =:= 1 -> H + sum_odd(T);
%sum_odd([_|T]) -> sum_odd(T).

%% for文
%for(M, M, F) -> [F(M)];
%for(I, M, F) -> [F(I) | for(I+1, M, F)].
