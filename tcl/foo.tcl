package require msgcat 1.0
namespace import msgcat::*
msgcat::mcload [file join [file dirname [info script]] msg]
set env(LANG) ja_JP
pack [button .b -text [mc "Push Me"]]