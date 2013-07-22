#!/bin/sh
#@(#)hell world

: <<'#_EOF_'
#_EOF_






: <<'#_EOF_'
# 変数が空文字でないならtrue(うまくいった。文字列でなければダメ)
if [ -n "$1" ]; then
  echo if
else
  echo el
fi
#_EOF_


: <<'#_EOF_'
# 複数行
echo "Hello, \
bourne shell world."
#_EOF_

: <<'#_EOF_'
# 引数渡し
MSG=`./module.sh aa3a`
echo $MSG
echo $?
#_EOF_

: <<'#_EOF_'
# 外部シェル呼び出し
MSG=`./module.sh`
echo $MSG
#_EOF_

: <<'#_EOF_'
# array
for str in "hoge" "fuga"
do
  echo "$str"
done
#_EOF_


: <<'#_EOF_'
# "q" 入力以外で終了しないように無限ループにする。
while :
do
  read key
  case "$key" in
    "a" ) echo "aが入力されました。" ;;
    "bb" ) echo "bbが入力されました。" ;;
    "c c c" ) echo "c c cが入力されました。" ;;
    "q" ) echo "終了します。"
          break ;;
  esac
done

exit 0
#_EOF_

: <<'#_EOF_'
# case文
arg=$1

case $arg in
  1 ) echo 2 ;;
  3 ) echo 4 ;;
  5 ) echo 6 ;;
  * ) echo no ;;
esac
#_EOF_


: <<'#_EOF_'
# 論理結合演算子
arg=$1
echo $arg
if ! [ -z $1 ]; then
  echo $arg
else
  echo nothing
fi
#_EOF_


: <<'#_EOF_'
# unary operator expected を出さない方法
arg=$1

# 文字同士の比較にする
#if [ $arg = "hoge" ]; then
if [ "${arg}" = "hoge" ]; then
    echo $arg
fi
#_EOF_


: <<'#_EOF_'
# シェル自身のPID（プロセスID）
echo $$

# シェルが最後に実行したバックグラウンドプロセスのPID
echo $!

# 最後に実行したコマンドの終了コード（戻り値）
echo $?


# setコマンドを使って設定したフラグの一覧
echo $-

# 全引数リスト。"$*"のように「"」で囲んだ場合、"$1 $2 … $n" と全引数を一つにくっついた形で展開される。
echo $*
echo "$*"

# 全引数リスト。"$@"のように「"」で囲んだ場合、"$1" "$2" … "$n" とそれぞれの引数を個別にダブルクォートで囲んで展開される。
echo $@
echo "$@"

# シェルに与えられた引数の個数
echo $#

# シェル自身のファイル名
echo $0

# シェルに与えられた引数の値。$1は第１引数、$2は第２引数…となる。
echo $1
echo $n
#_EOF_


: <<'#_EOF_'
#-----変数に値を代入します-----
PARA1="string"
PARA2=string
PARA3=3
PARA4=`date '+%Y-%m-%d'`
#-----変数を「echo」で表示します-----
echo "PARA1 = ${PARA1}"
echo "PARA2 = ${PARA2}"
echo "PARA3 = ${PARA3}"
echo "PARA4 = ${PARA4}"
echo "PARA5 = ${PARA5}"
#_EOF_

: <<'#_EOF_'
# [ は、コマンド名である。
if [ 1 -ne 2 ] ; then
  echo if
else
  echo else
fi
#_EOF_

: <<'#_EOF_'
# 変数が空文字ならtrue
if [ -z $1 ]; then
  echo if
else
  echo el
fi

# 変数が空文字でないならtrue(うまくいかない)
if [ -n $1 ]; then
  echo if
else
  echo el
fi
#_EOF_

: <<'#_EOF_'
# 複数コマンドの出力をまとめてパイプに流す
{ echo sdf; echo asdf; } | grep sd
{
  echo sdf
  echo asdf
} | grep sd
#_EOF_


# 関数全体をリダイレクト
func()
{
  echo funfunc
  return 0
} >/dev/null 2>&1


: <<'#_EOF_'
#ブロックをリダイレクト
for i in 1 2 3
do
  echo "$i"
done >>file
#_EOF_


: <<'#_EOF_'
#複数処理のリダイレクト2
cat <<__END_OF_MESSAGE__ >>file
1. hogehoge
2. fugafuga
3. foofoo
4. barbar
__END_OF_MESSAGE__
#_EOF_

: <<'#_EOF_'
# 複数処理のリダイレクト1
{
  echo "1. hogehoge"
  echo "2. fugafuga"
  echo "3. foofoo"
  echo "4. barbar"
} >>file
#_EOF_

: <<'#_EOF_'
# if文の省略
echo abc
#[ 1 -eq 1 ] && exit 0
#[ "sfdf" = "sfdf" ] && exit 0
echo def
#_EOF_


: <<'#_EOF_'
# 関数
func()
{
  echo funfun
  return 0
}

func
#_EOF_

: <<'#_EOF_'
# for
for i in 1 2 3 4 5
do
  echo $i
done

#_EOF_


: <<'#_EOF_'
#ヒアドキュメント
cat << dd
werw
sfeef
dd
#_EOF_


: <<'#__EOF__'
# ファイル接続子
echo あああ
echo aaa >& aaa
echo bbb 2>&1

# if文
VAA="sfdf"
echo VAA
if [ "$VAA" = "sfdf" ]; then
  echo ifif
else
  echo  elel
fi
#__EOF__
