@echo off
erlc tmp.erl
erl -noshell -s tmp tmp -s init stop
