#!/usr/local/bin/perl

#| Ans.Q Version 1.40.04
#| This script is free.
#|
#| Author Shigeto Nakazawa.(1996/11/27)
#| HomePageUrl http://www7.big.or.jp/~jawa/

# //////////////////////////////////////////////////////////
# �I�v�V�����̐ݒ��ύX���邱�Ƃ��ł��܂��B
# �ύX����ꍇ�́Areadme.htm �������ɂȂ��Ă���s���Ă��������B
# �ݒ�ύX�ɂ͏[�����ӂ��Ă��������B
# //////////////////////////////////////////////////////////

# ----------------------------------------------------------
# Ans.Q �̊Ǘ��ҁi���Ȃ��j�̏��ł��B
# ----------------------------------------------------------

$admin_name ='�Ǘ��l';              # �Ǘ��l�i���Ȃ��j�̖��O
$admin_pass ='password';            # �Ǘ��l���e�p�p�X���[�h
$admin_email = 'mail@your.address'; # ���Ȃ��̃��[���A�h���X�������܂��B
$master = 'password';               # �Ǘ��p�G�f�B�^�̃p�X���[�h

# ----------------------------------------------------------
# Ans.Q �̃J�X�^�}�C�Y���ڂł��B
# ----------------------------------------------------------

$reg_max = 300;                     # �ő�ێ����i�ő�9998�܂Łj
$page_max = 15;                      # 1�y�[�W�ɕ\������^��̐�

$title = 'Ans.Q';                   # Ans.Q �̃^�C�g��
$body = '<BODY TEXT="#000000" BGCOLOR="#DDDDEE">';
                                    # <BODY>�^�O�̐ݒ�

$name_color    = "#FFFFFF";         # �i�^��́j���O�̐F
$title_color   = "#FFDDDD";         # �i�^��́j�^�C�g���̐F
$name_bgcolor  = "#446644";         # �i�^��́j���O�̔w�i�F
$title_bgcolor = "#666666";         # �i�^��́j�^�C�g���̔w�i�F
$emb_color     = "#FF0000";         # �����F


$gethostaddr = 0;   # �����[�g�z�X�g���������\������Ȃ��ꍇ�́A������ 1 �ɂ�
                    # ��Ƃ��܂��\������邱�Ƃ�����܂��B
                    #�i�������A�T�[�o�[�G���[�̌����ɂȂ邱�Ƃ�����܂��B�j

$check_url = "";    # ������ Ans.Q �̐��m�� URL (http://�`) �������Ă�����
                    # ���T�C�g����s���ɓ��e���ꂽ���̂����ۂł��܂��B
                    # �i�C�^�Y������āA���߂ė��p���邱�ƁI�j

@check_ipad = ();   # ������ �o�^���ꂽ���Ȃ����� IP�A�h���X�������Ă����ƁA
                    # ���� IP�A�h���X����̑S�Ă̓��e�����ۂ��܂��B
                    # �i�C�^�Y������āA���߂ė��p���邱�ƁI�j

$check_proxy = 0;   # �����̒l�� 1 �ɂ���ƁA�v���N�V�o�R�ŗ��铽���ȖK��҂�
                    # �r���ł����܂����A�ʏ�̕���r������\��������܂��B
                    # �i�C�^�Y������āA���߂ė��p���邱�ƁI�j

                                    # �t�@�C���֘A�̐ݒ�
$cginame     = './ansq.cgi';        # ���� CGI �̃t�@�C���̖��O
$jcode       = './jcode.pl';        # jcode.pl �̂���ꏊ
$logfile     = './ansq.log';        # �L�^�p�t�@�C���i�ꕔ�v���o�C�_�ł͏��������K�v�j
$lock1       = './ansq1.lock';      # ���t�@�C��(1)
$lock2       = './ansq2.lock';      # ���t�@�C��(2)
$lock_flag   = 1;                   # ���t�@�C���� 1:�g�p 0:�s�g�p

# --------------------              # �^�C�g�������� HTML��
$html_title=<<"_EOF_";
<CENTER>
<TABLE CELLPADDING=4 BGCOLOR="#1366BB"><TR><TD ALIGN=center>
<FONT COLOR="#FFFFFF"><TT>
������ƋC�ɂȂ�Ɩ������Ȃ��B<BR>
</TT></FONT>
<HR>
<FONT COLOR="#00FFAA" SIZE=+3><B>Ans.Q</B></FONT><BR>
<HR>
<FONT COLOR="#FFFFFF"><TT>
�ǂ��ł��ǂ����ƂȂ̂Ɂc�A�N�������āI</TT></FONT>
</TD></TR></TABLE>
</CENTER>
<P>
_EOF_

# --------------------              # �^�╔���H�� HTML��
$html_formmsg=<<"_EOF_";
<TT>
� ���Ȃ����^��������Ă���Ȃ�A�����ŋL�����Ă��������B
</TT>
_EOF_
# �� _EOF_ �͕K�{�ł��B

# //////////////////////////////////////////////////////////
# �I�v�V�����̐ݒ�͂����܂łł��B
# �ȉ��� CGI �̃v���O�����ł��B
# ���������͌l�̐ӔC�ōs���ĉ������B
# //////////////////////////////////////////////////////////

&check_code;
&read_form;
@logs = &read_file($logfile);
if ($FORM{'edit'}) {
    if ($FORM{'pass'} ne $master) {
        &html_header;
        &editor_password;
        &html_footer;
        exit;
    }
    else { &editor_main; }
}
if ($FORM{'ans'} && $FORM{'name'}) { &axs_limited; &regist_answer; }
if ($FORM{'qes'} && $FORM{'name'}) { &axs_limited; &regist_question; }
&html_header;
print $html_title;
&html_form;
&html_list(&page_list);
&html_footer;

# [ �w�b�_�[���� ]
#

sub html_header {
    print "Content-type: text/html\n\n";
    print<<"_EOF_";
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=$charset_code">
<TITLE>$title</TITLE>
</HEAD>
$body
<BASEFONT SIZE=3 FACE="�l�r �S�V�b�N">
_EOF_
}

# [ �t�b�^�[�����i���쌠�͕\�����邱�Ɓj ]
#

sub html_footer {
    print<<"_EOF_";
<HR>
<DIV ALIGN="right"><TT>
<!-- �Ǘ��ҕ\\�� -->
�Ǘ��� <A HREF="mailto:$admin_email">$admin_name</A> :
<!-- ���쌠�\\�� �i�K���\\�����Ă��������B�j -->
Ans.Q v1.40 [<A HREF="http://www7.big.or.jp/~jawa/" TARGET=_top>Shigeto Nakazawa</A>]
</TT></DIV>
</BODY></HTML>
_EOF_
}

# [ �V�K���e�t�H�[���\������ ]
#

sub html_form {
    print<<"_EOF_";
<HR>
$html_formmsg
<FORM ACTION="$cginame" METHOD=post>
<TT>���O:</TT><INPUT TYPE="text" NAME="name" SIZE=16 MAXSIZE=16>
<TT>�^��:</TT><INPUT TYPE="text" NAME="qes" SIZE=60>
<INPUT TYPE="submit" VALUE="��������">
</FORM>
_EOF_
}

# [ ���y�[�W���� ]
#

sub page_list {
    $start = $FORM{'page'};
    $max = @logs;
    if ($start > $max - $page_max) { $start = $max - $page_max;}
    if ($start < 0) { $start = 0; }
    print "<HR>\n";
    print "<CENTER>\n";
    if ($FORM{'pass'} ne $master) { print "<FORM ACTION=\"$cginame\" METHOD=post>\n"; }
    print "<SELECT NAME=\"page\">\n";
    $qes = (split(/<>/,$logs[$start]))[2];
    print "<OPTION VALUE=$start>���y�[�W��I���ł��܂�\n";
    for($i=0;$i<$max;$i+=$page_max) {
        local($q,$a) = split(/<#>/,$logs[$i]);
        $text = (split(/<>/,$q))[2];
        if (length($text) > 20) { $text = substr($text,0,20); }
        print "<OPTION VALUE=$i>$i:$text\n";
    }
    print "</SELECT>\n";
    if ($FORM{'pass'} eq $master) {
        print "<INPUT TYPE=\"submit\" VALUE=\"���s����\">\n";
    } else {
        print "<INPUT TYPE=\"submit\" VALUE=\"�ړ�����\">\n";
        print "</FORM>\n";
    }
    print "</CENTER>\n";
    return ($start,$start + $page_max);
}

# [ ���X�g�\���� ]
#

sub html_list {
    local($start,$end) = @_;
    $max = @logs;
    if ($start < 0) { $start = 0; }
    if ($end > $max) { $end = $max; }
    for($i = $start;$i<$end;$i++) {
        local($q,$a) = split(/<#>/,$logs[$i]);
        $a =~ s/\n//;
        local($no,$name,$text,$ipad,$rhost) = split(/<>/,$q);
        print<<"_EOF_";
<HR>
<TABLE CELLPADDING=2 WIDTH=100%>
<TR><TD BGCOLOR="$name_bgcolor" VALIGN=top><FONT COLOR="$name_color">
<NOBR><TT>$name<BR>����̋^��</TT></NOBR>
</TD><TD BGCOLOR="$title_bgcolor" WIDTH=80%>
<FONT COLOR="$title_color" SIZE=+1><B><TT>$text</B></TT></FONT>
</FONT></TD></TR></TABLE>
<P><TT>
_EOF_
        if ($a ne '') {
            foreach (split(/<\$>/,$a)) {
                local($name,$text,$ipad,$rhost) = split(/<>/,$_);
                print "<!--$ipad $rhost-->�E$text<FONT COLOR=\"$emb_color\"><I>[$name]</I></FONT><BR>\n";
            }
        } else {
            print "<FONT COLOR=\"$emb_color\"><B>�N�������ĉ������B</B></FONT>";
        }
        print<<"_EOF_";
</TT>
<DIV ALIGN="right">
<FORM ACTION="$cginame" METHOD=post>
<INPUT TYPE="hidden" NAME="no" VALUE="$no">
<TT>���O:</TT><INPUT TYPE="text" NAME="name" SIZE=16 MAXSIZE=16>
<TT>��:</TT><INPUT TYPE="text" NAME="ans" SIZE=60>
<INPUT TYPE="submit" VALUE="��������">
</FORM>
</DIV>
_EOF_
    }
    print<<"_EOF_";
<HR>
<DIV ALIGN="right"><TT>
<A HREF="$cginame?edit=on">[�Ǘ��l��p]</A>
</TT></DIV>
_EOF_
}

# [ �o�^�������� ]
#

sub axs_limited {
    $ref_url = $ENV{'HTTP_REFERER'};
    s/\?(.|\n)*//ig;
    s/\%7E/\~/ig;
    if($check_url && ($ref_url !~ $check_url)){
        &error(1,"<B>�s���ȃA�N�Z�X�ł��B</B><BR>$ref_url<BR>\n");
    }
    $ipad = $ENV{'REMOTE_ADDR'};
    foreach (@check_ipad) {
        if ($ipad =~ /^$_/) {  &error(1,"$ipad ����̓��e�͋��ۂ���Ă܂��B\n"); }
    }
    if ($check_proxy) {
        local($envkey,$envvalue) = ();
        while(($envkey,$envvalue) = each(%ENV)){
            if($envkey =~ /proxy/i || $envvalue =~ /proxy/i){
            &error(1,"�v���N�V�o�R�ł̃A�N�Z�X�͋֎~����Ă܂��B\n");
            }
        }
    }
    if ($FORM{'name'} eq $admin_name) { &error(1,"���O���s���ł��B���������ĉ������B"); }
    if ($FORM{'name'} eq $admin_pass) { $FORM{'name'} = $admin_name; }
}

# [ �N�G�X�`�����o�^ ]
#

sub regist_question {
    if ((length($FORM{'name'}) > 16) || (length($FORM{'qes'}) > 4000)) { &error(1,'���O�܂��̓��b�Z�[�W���������ł��B'); }
    $ipad = $ENV{'REMOTE_ADDR'};
    $rhost = $ENV{'REMOTE_HOST'};
    if ($gethostaddr) { $rhost = $rhost eq $ipad?gethostbyaddr(pack('C4',split(/\./,$ipad)),2)||'':$rhost; }
    $no = (split(/<>/,$logs[0]))[0] + 1;
    unshift(@logs,"$no<>$FORM{'name'}<>$FORM{'qes'}<>$ipad<>$rhost<#>\n");
    while ($#logs>$reg_max-1) { pop(@logs); }
    &write_file($logfile,@logs);
}

# [ �A���T�[�o�^ ]
#

sub regist_answer {
    if ((length($FORM{'name'}) > 16) || (length($FORM{'ans'}) > 4000)) { &error(1,'���O�܂��̓��b�Z�[�W���������ł��B'); }
    $max = @logs;
    $ipad = $ENV{'REMOTE_ADDR'};
    $rhost = $ENV{'REMOTE_HOST'};
    if ($gethostaddr) { $rhost = $rhost eq $ipad?gethostbyaddr(pack('C4',split(/\./,$ipad)),2)||'':$rhost; }
    for ($i=0;$i<$max;$i++) {
        if ((split(/<>/,$logs[$i]))[0] == $FORM{'no'}) {
            local($q,$a) = split(/<#>/,$logs[$i]);
            $a =~ s/\n//;
            foreach (split(/<\$>/,$a)) {
                ($name,$text) = split(/<>/,$_);
            }
            if ($FORM{'name'} eq $name && $FORM{'ans'} eq $text) {
                &error(1,'��d���e�͂��������������B�����[�h�͂��Ȃ��ł��������B');
            }
            $logs[$i] =~ s/\n//;
            $logs[$i] .= "$FORM{'name'}<>$FORM{'ans'}<>$ipad<>$rhost<\$>\n";
        }
    }
    &write_file($logfile,@logs);
}

# [ �G�f�B�^�[���C���i��ʂ̕\�����j ]
#

sub editor_main {
    @logs = &write_file($logfile,&kiji_edit);
    &html_header;
    $kiji = @logs;
    $size = (stat($logfile))[7];
    if ($lock_flag) {
        if (-f $lock1 || -f $lock2) {
            $comment = "� <FONT COLOR=\"$emb_color\"><B>���b�N�t�@�C�������o����܂����i���b�N���j</B></FONT><BR>";
        } else {
            $comment = "� ���b�N�@�\\�͐���ɓ��삵�Ă��܂��B<BR>";
        }
    } else {
        $comment = "� ���b�N�@�\\���g�p���Ă��܂���<BR>";
    }
    print<<"_EOF_";
<DIV ALIGN="right"><TT>[<A HREF="$cginame">��߂�</A>]</TT></DIV>
<FORM METHOD="post" ACTION="$cginame">
<INPUT TYPE="hidden" NAME="edit" VALUE="on">
<INPUT TYPE="hidden" NAME="pass" VALUE="$FORM{'pass'}">
<CENTER><H2>Ans.Q Editor</H2></CENTER>
<BLOCKQUOTE><TT>
<HR>
<I>[ Ans.Q�̏�� ]</I><BR>
� ���� $kiji ���̋^�₪����A���O�t�@�C���� $size �o�C�g�ɂȂ��Ă܂�<BR>
$comment
_EOF_
    &page_list;
    $start = $FORM{'page'}; $end = $start + $page_max;
    $max = @logs;
    if ($start < 0) { $start = 0; }
    if ($end > $max) { $end = $max; }
    for($i = $start;$i<$end;$i++) {
        local($q,$a) = split(/<#>/,$logs[$i]);
        $a =~ s/\n//;
        local($no,$name,$text,$ipad,$rhost) = split(/<>/,$q);
        print "<HR><TT><INPUT TYPE=checkbox NAME=del VALUE=$no-0><B> $text [<I>$name</I>]</B>($ipad $rhost)</TT></<BR>\n";
        if ($a ne '') {
            $ct = 0;
            foreach (split(/<\$>/,$a)) {
                local($name,$text,$ipad,$rhost) = split(/<>/,$_);
                $ct++;
                print "<TT><INPUT TYPE=checkbox NAME=del VALUE=$no-$ct> $text [<I>$name</I>]($ipad $rhost)</TT><BR>\n";
            }
        }
    }
    print "<HR>\n";
    print "</FORM>\n";
    &html_footer;
    exit;
}

# [ �G�f�B�^�ŕҏW ]

sub kiji_edit {
    foreach $log (@logs) {
        local($q,$a) = split(/<#>/,$log);
        local($no,$name,$text,$ipad,$rhost) = split(/<>/,$q);
        $tp = "$no-0"; $data = "$no<>$name<>$text<>$ipad<>$rhost<#>\n";
        if ($del{$tp}) { next; }
        if ($a ne '') {
            $ct = 0; $a =~ s/\n//;
            foreach (split(/<\$>/,$a)) {
                local($name,$text,$ipad,$rhost) = split(/<>/,$_);
                $ct++; $tp = "$no-$ct";
                if (!$del{$tp}) {
                    $data =~ s/\n//;
                    $data .= "$name<>$text<>$ipad<>$rhost<\$>\n";
                }
            }
        }
        push (@new,$data);
    }
    return @new;
}

# [ �p�X���[�h���́i�G�f�B�^�[) ]
#

sub editor_password {
    print<<"_EOF_";
<HR>
<CENTER>
�Ǘ��p�p�X���[�h����͂��Ă��������B<P>
<FORM ACTION="$cginame" METHOD="post">
<INPUT TYPE="hidden" NAME="edit" VALUE="on">
<INPUT TYPE="password" NAME="pass" SIZE=10>
<INPUT TYPE="submit" VALUE="�N������">
</FORM><P>
�i�Ǘ��p�̃G�f�B�^���g�p���邽�߂ɂ́A�Ǘ��p�p�X���[�h���K�v�ł��B�j
</CENTER>
_EOF_
}

# [ �t�H�[������f�[�^�擾 ]
#

sub read_form {
    local($pair,$buffer);
    if ($ENV{'REQUEST_METHOD'} eq "POST") { read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'}); } else { $buffer = $ENV{'QUERY_STRING'}; }
    local(@pairs) = split(/&/,$buffer);
    foreach $pair (@pairs) {
        local($name,$value) = split(/=/,$pair);
        $value =~ tr/+/ /;
        $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
        if ($name eq 'del') {
            $del{$value} = 1;
        }
        $FORM{$name} = &change_code($value);
    }
}

# [ �����R�[�h�֘A ]
#

sub check_code {
    if (!(-r $jcode)) { &error(1,"jcode.pl ���݂���܂���B"); }
    require $jcode;
    local($text) = ord(substr("���V�d�l�������(^-^;;",0,1));
    if ($text == 0xc3) { $mojicode = "euc"; $charset_code = "x-euc-jp"; }
    elsif ($text == 0x92) { $mojicode = "sjis";$charset_code = "x-sjis"; }
    else { &error(1,"�T�|�[�g���ĂȂ������R�[�h�ł�"); }
}
sub change_code {
    local($text)=$_[0];
    &jcode'convert(*text,$mojicode);
    if ($mojicode eq 'sjis') { &jcode'h2z_sjis(*text); }
    if ($mojicode eq 'euc')  { &jcode'h2z_euc(*text); }
    $text =~ s/\&/&amp;/g;
    $text =~ s/</&lt;/g;
    $text =~ s/>/&gt;/g;
    return $text;
}

# [ �L�^�t�@�C���̏��� ]
#

sub read_file {
    local($logfile) = $_[0];
    if (!open(IN,$logfile)) {
        &error(1,"�L�^�t�@�C���̓ǂݍ��ݕs��");
    }
    local(@files) = <IN>;
    close(IN);
    return @files;
}
sub write_file {
    local($logfile,@lines) = @_;
    &dubble_lock_file;
    if ($lock_error) { &error(1,"���b�N�t�@�C�������o���܂����B���Ԃ������Ă����p�������B"); }

    if (!$savetype) {
        # �W���^�C�v �S OS ����
        if (!open(OUT,">$logfile")) {
            &dubble_unlock_file;
            &error(1,"�L�^�t�@�C���̏������ݕs��");
        }
        print OUT @lines;
        close(OUT);
    } else {
        # ���ǃ^�C�v chmod �g�p
        $tmpfile = "$$\.tmp";
        if (!open(OUT,">$tmpfile")) {
            &dubble_unlock_file;
            &error(1,"Temp���p���O�L�^�����ɖ��Ή��ł��B");
        }
        close(OUT);
        chmod 0666,$tmpfile;
        if (!open(OUT,">$tmpfile")) {
            &dubble_unlock_file;
            &error(1,"Temp���p���O�L�^�����ɖ��Ή��ł��B");
        }
        print OUT @lines;
        close(OUT);
        rename($tmpfile,$logfile);
    }
    &dubble_unlock_file;
    return @lines;
}

# [ ���b�N�@�\ ]
#
sub dubble_lock_file {
    if (!(&lock_file($lock1))) { &dubble_unlock_file; }
    elsif (!(&lock_file($lock2))) { &dubble_unlock_file; }
}
sub dubble_unlock_file {
    &unlock_file($lock2);&unlock_file($lock1);
}
sub lock_file {
    local($lockfile) = $_[0];
    if (!$lock_flag) { return 1; }
    local($retry) = 5;
    while (-f $lockfile) {
        if ($retry-- <= 0) {
            local($mtime) = (stat($lockfile))[9];
            if ($mtime < time()-60*15) { return 0; }
            $lock_error = 1;
            return 1;
        }
        sleep 1;
    }
    open (LOCK,">$lockfile");
    close(LOCK);
    return 1;
}
sub unlock_file {
    local($lockfile) = $_[0];
    unlink($lockfile);
}

# [ �G���[���� ]
#

sub error {
    ($err,$err_msg) = @_;
    if ($err) { print "Content-type: text/html\n\n<HTML><BODY>"; }
    print<<"_EOF_";
<HR>
<TABLE BGCOLOR="#FFEEEE" CELLPADDING=5 WIDTH=100%><TD ALIGN=center>
<FONT COLOR="red"><B>�G���[:$err_msg</B></FONT>
</TD></TABLE>
<HR>
<P>
<CENTER>
<TT><B>[ <A HREF="$cginame?">Ans.Q</A> ]</B></TT>
</CENTER>
</BODY></HTML>
_EOF_
    exit;
}