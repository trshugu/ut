#!/bin/sh
#@(#)hell world
: <<'#_EOF_'
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
