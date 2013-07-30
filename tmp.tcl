if 0 {
}




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

