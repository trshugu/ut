#!/bin/sh
#@(#)hell world
: <<'#_EOF_'
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
