if 0 {
}



if 0 {
pack [button .b -text ボタン -command exit]
}

if 0 {
package require dde
dde servername foo
pack [entry .e -textvariable var]
}

if 0 {
package require msgcat 1.0
namespace import msgcat::*
msgcat::mcload [file join [file dirname [info script]] msg]
set env(LANG) ja_JP
pack [button .b -text [mc "Push Me"]]
}


if 0 {
package require dde
button .b -text Send -command {
    dde execute -async TclEval foo {set var Hello!}
}
pack .b
}

if 0 {
}
# tk必須(wishで)
button .b -text {押してね} -command {
    tk_messageBox -message {こんにちは}
}
pack .b

if 0 {
# #記号（注釈行）
#初期値セット
 # set a 0
 set b 0 ; # 初期値
 set c 0   # 初期値 エラー
}

if 0 {
# セミコロン記号（マルチコマンド）
 set a 100 ; set b 200; puts [expr $a * $b]
}

if 0 {
set text 石を投げたら"ゴツン"と音がした
puts $text
}

if 0 {
# ダブルクォーテーション記号
set num 3
puts {[expr 100*$num] 円}
puts "[expr 100*$num] 円"
}


if 0 {
# 変数
set a [expr 100*2]
puts $a
}

if 0 {
# 地獄世界
puts "hell world"; # 文を区切ってコメント
}

