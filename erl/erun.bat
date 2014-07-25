@echo off
rem erlc tmp.erl
rem erl -noshell -s tmp tmp -s init stop

escript tmp.erl
