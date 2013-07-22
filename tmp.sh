#!/bin/sh
#@(#)hell world

: <<'#_EOF_'
#_EOF_






: <<'#_EOF_'
# �ϐ����󕶎��łȂ��Ȃ�true(���܂��������B������łȂ���΃_��)
if [ -n "$1" ]; then
  echo if
else
  echo el
fi
#_EOF_


: <<'#_EOF_'
# �����s
echo "Hello, \
bourne shell world."
#_EOF_

: <<'#_EOF_'
# �����n��
MSG=`./module.sh aa3a`
echo $MSG
echo $?
#_EOF_

: <<'#_EOF_'
# �O���V�F���Ăяo��
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
# "q" ���͈ȊO�ŏI�����Ȃ��悤�ɖ������[�v�ɂ���B
while :
do
  read key
  case "$key" in
    "a" ) echo "a�����͂���܂����B" ;;
    "bb" ) echo "bb�����͂���܂����B" ;;
    "c c c" ) echo "c c c�����͂���܂����B" ;;
    "q" ) echo "�I�����܂��B"
          break ;;
  esac
done

exit 0
#_EOF_

: <<'#_EOF_'
# case��
arg=$1

case $arg in
  1 ) echo 2 ;;
  3 ) echo 4 ;;
  5 ) echo 6 ;;
  * ) echo no ;;
esac
#_EOF_


: <<'#_EOF_'
# �_���������Z�q
arg=$1
echo $arg
if ! [ -z $1 ]; then
  echo $arg
else
  echo nothing
fi
#_EOF_


: <<'#_EOF_'
# unary operator expected ���o���Ȃ����@
arg=$1

# �������m�̔�r�ɂ���
#if [ $arg = "hoge" ]; then
if [ "${arg}" = "hoge" ]; then
    echo $arg
fi
#_EOF_


: <<'#_EOF_'
# �V�F�����g��PID�i�v���Z�XID�j
echo $$

# �V�F�����Ō�Ɏ��s�����o�b�N�O���E���h�v���Z�X��PID
echo $!

# �Ō�Ɏ��s�����R�}���h�̏I���R�[�h�i�߂�l�j
echo $?


# set�R�}���h���g���Đݒ肵���t���O�̈ꗗ
echo $-

# �S�������X�g�B"$*"�̂悤�Ɂu"�v�ň͂񂾏ꍇ�A"$1 $2 �c $n" �ƑS��������ɂ��������`�œW�J�����B
echo $*
echo "$*"

# �S�������X�g�B"$@"�̂悤�Ɂu"�v�ň͂񂾏ꍇ�A"$1" "$2" �c "$n" �Ƃ��ꂼ��̈������ʂɃ_�u���N�H�[�g�ň͂�œW�J�����B
echo $@
echo "$@"

# �V�F���ɗ^����ꂽ�����̌�
echo $#

# �V�F�����g�̃t�@�C����
echo $0

# �V�F���ɗ^����ꂽ�����̒l�B$1�͑�P�����A$2�͑�Q�����c�ƂȂ�B
echo $1
echo $n
#_EOF_


: <<'#_EOF_'
#-----�ϐ��ɒl�������܂�-----
PARA1="string"
PARA2=string
PARA3=3
PARA4=`date '+%Y-%m-%d'`
#-----�ϐ����uecho�v�ŕ\�����܂�-----
echo "PARA1 = ${PARA1}"
echo "PARA2 = ${PARA2}"
echo "PARA3 = ${PARA3}"
echo "PARA4 = ${PARA4}"
echo "PARA5 = ${PARA5}"
#_EOF_

: <<'#_EOF_'
# [ �́A�R�}���h���ł���B
if [ 1 -ne 2 ] ; then
  echo if
else
  echo else
fi
#_EOF_

: <<'#_EOF_'
# �ϐ����󕶎��Ȃ�true
if [ -z $1 ]; then
  echo if
else
  echo el
fi

# �ϐ����󕶎��łȂ��Ȃ�true(���܂������Ȃ�)
if [ -n $1 ]; then
  echo if
else
  echo el
fi
#_EOF_

: <<'#_EOF_'
# �����R�}���h�̏o�͂��܂Ƃ߂ăp�C�v�ɗ���
{ echo sdf; echo asdf; } | grep sd
{
  echo sdf
  echo asdf
} | grep sd
#_EOF_


# �֐��S�̂����_�C���N�g
func()
{
  echo funfunc
  return 0
} >/dev/null 2>&1


: <<'#_EOF_'
#�u���b�N�����_�C���N�g
for i in 1 2 3
do
  echo "$i"
done >>file
#_EOF_


: <<'#_EOF_'
#���������̃��_�C���N�g2
cat <<__END_OF_MESSAGE__ >>file
1. hogehoge
2. fugafuga
3. foofoo
4. barbar
__END_OF_MESSAGE__
#_EOF_

: <<'#_EOF_'
# ���������̃��_�C���N�g1
{
  echo "1. hogehoge"
  echo "2. fugafuga"
  echo "3. foofoo"
  echo "4. barbar"
} >>file
#_EOF_

: <<'#_EOF_'
# if���̏ȗ�
echo abc
#[ 1 -eq 1 ] && exit 0
#[ "sfdf" = "sfdf" ] && exit 0
echo def
#_EOF_


: <<'#_EOF_'
# �֐�
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
#�q�A�h�L�������g
cat << dd
werw
sfeef
dd
#_EOF_


: <<'#__EOF__'
# �t�@�C���ڑ��q
echo ������
echo aaa >& aaa
echo bbb 2>&1

# if��
VAA="sfdf"
echo VAA
if [ "$VAA" = "sfdf" ]; then
  echo ifif
else
  echo  elel
fi
#__EOF__
