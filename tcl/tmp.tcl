if 0 {
}



if 0 {
pack [button .b -text �{�^�� -command exit]
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
# tk�K�{(wish��)
button .b -text {�����Ă�} -command {
    tk_messageBox -message {����ɂ���}
}
pack .b

if 0 {
# #�L���i���ߍs�j
#�����l�Z�b�g
 # set a 0
 set b 0 ; # �����l
 set c 0   # �����l �G���[
}

if 0 {
# �Z�~�R�����L���i�}���`�R�}���h�j
 set a 100 ; set b 200; puts [expr $a * $b]
}

if 0 {
set text �΂𓊂�����"�S�c��"�Ɖ�������
puts $text
}

if 0 {
# �_�u���N�H�[�e�[�V�����L��
set num 3
puts {[expr 100*$num] �~}
puts "[expr 100*$num] �~"
}


if 0 {
# �ϐ�
set a [expr 100*2]
puts $a
}

if 0 {
# �n�����E
puts "hell world"; # ������؂��ăR�����g
}

