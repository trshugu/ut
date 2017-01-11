#!/usr/local/bin/perl

#| Ans.Q Version 1.40.04
#| This script is free.
#|
#| Author Shigeto Nakazawa.(1996/11/27)
#| HomePageUrl http://www7.big.or.jp/~jawa/

# //////////////////////////////////////////////////////////
# オプションの設定を変更することができます。
# 変更する場合は、readme.htm をご覧になってから行ってください。
# 設定変更には充分注意してください。
# //////////////////////////////////////////////////////////

# ----------------------------------------------------------
# Ans.Q の管理者（あなた）の情報です。
# ----------------------------------------------------------

$admin_name ='管理人';              # 管理人（あなた）の名前
$admin_pass ='password';            # 管理人投稿用パスワード
$admin_email = 'mail@your.address'; # あなたのメールアドレスを書きます。
$master = 'password';               # 管理用エディタのパスワード

# ----------------------------------------------------------
# Ans.Q のカスタマイズ項目です。
# ----------------------------------------------------------

$reg_max = 300;                     # 最大保持数（最大9998まで）
$page_max = 15;                      # 1ページに表示する疑問の数

$title = 'Ans.Q';                   # Ans.Q のタイトル
$body = '<BODY TEXT="#000000" BGCOLOR="#DDDDEE">';
                                    # <BODY>タグの設定

$name_color    = "#FFFFFF";         # （疑問の）名前の色
$title_color   = "#FFDDDD";         # （疑問の）タイトルの色
$name_bgcolor  = "#446644";         # （疑問の）名前の背景色
$title_bgcolor = "#666666";         # （疑問の）タイトルの背景色
$emb_color     = "#FF0000";         # 強調色


$gethostaddr = 0;   # リモートホストが正しく表示されない場合は、ここを 1 にす
                    # るとうまく表示されることがあります。
                    #（ただし、サーバーエラーの原因になることもあります。）

$check_url = "";    # ここに Ans.Q の正確な URL (http://～) を書いておくと
                    # 他サイトから不正に投稿されたものを拒否できます。
                    # （イタズラされて、初めて利用すること！）

@check_ipad = ();   # ここに 登録されたくない方の IPアドレスを書いておくと、
                    # その IPアドレスからの全ての投稿を拒否します。
                    # （イタズラされて、初めて利用すること！）

$check_proxy = 0;   # ここの値を 1 にすると、プロクシ経由で来る匿名な訪問者を
                    # 排除ですきますが、通常の方を排除する可能性もあります。
                    # （イタズラされて、初めて利用すること！）

                                    # ファイル関連の設定
$cginame     = './ansq.cgi';        # この CGI のファイルの名前
$jcode       = './jcode.pl';        # jcode.pl のある場所
$logfile     = './ansq.log';        # 記録用ファイル（一部プロバイダでは書き換え必要）
$lock1       = './ansq1.lock';      # 鍵ファイル(1)
$lock2       = './ansq2.lock';      # 鍵ファイル(2)
$lock_flag   = 1;                   # 鍵ファイルの 1:使用 0:不使用

# --------------------              # タイトル部分の HTML文
$html_title=<<"_EOF_";
<CENTER>
<TABLE CELLPADDING=4 BGCOLOR="#1366BB"><TR><TD ALIGN=center>
<FONT COLOR="#FFFFFF"><TT>
ちょっと気になると夜も眠れない。<BR>
</TT></FONT>
<HR>
<FONT COLOR="#00FFAA" SIZE=+3><B>Ans.Q</B></FONT><BR>
<HR>
<FONT COLOR="#FFFFFF"><TT>
どうでも良いことなのに…、誰か助けて！</TT></FONT>
</TD></TR></TABLE>
</CENTER>
<P>
_EOF_

# --------------------              # 疑問部分？の HTML文
$html_formmsg=<<"_EOF_";
<TT>
･ あなたが疑問を持っているなら、ここで記入してください。
</TT>
_EOF_
# ↑ _EOF_ は必須です。

# //////////////////////////////////////////////////////////
# オプションの設定はここまでです。
# 以下は CGI のプログラムです。
# 書き換えは個人の責任で行って下さい。
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

# [ ヘッダー部分 ]
#

sub html_header {
    print "Content-type: text/html\n\n";
    print<<"_EOF_";
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=$charset_code">
<TITLE>$title</TITLE>
</HEAD>
$body
<BASEFONT SIZE=3 FACE="ＭＳ ゴシック">
_EOF_
}

# [ フッター部分（著作権は表示すること） ]
#

sub html_footer {
    print<<"_EOF_";
<HR>
<DIV ALIGN="right"><TT>
<!-- 管理者表\示 -->
管理者 <A HREF="mailto:$admin_email">$admin_name</A> :
<!-- 著作権表\示 （必ず表\示してください。） -->
Ans.Q v1.40 [<A HREF="http://www7.big.or.jp/~jawa/" TARGET=_top>Shigeto Nakazawa</A>]
</TT></DIV>
</BODY></HTML>
_EOF_
}

# [ 新規投稿フォーム表示部分 ]
#

sub html_form {
    print<<"_EOF_";
<HR>
$html_formmsg
<FORM ACTION="$cginame" METHOD=post>
<TT>名前:</TT><INPUT TYPE="text" NAME="name" SIZE=16 MAXSIZE=16>
<TT>疑問:</TT><INPUT TYPE="text" NAME="qes" SIZE=60>
<INPUT TYPE="submit" VALUE="書き込む">
</FORM>
_EOF_
}

# [ 改ページ処理 ]
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
    print "<OPTION VALUE=$start>他ページを選択できます\n";
    for($i=0;$i<$max;$i+=$page_max) {
        local($q,$a) = split(/<#>/,$logs[$i]);
        $text = (split(/<>/,$q))[2];
        if (length($text) > 20) { $text = substr($text,0,20); }
        print "<OPTION VALUE=$i>$i:$text\n";
    }
    print "</SELECT>\n";
    if ($FORM{'pass'} eq $master) {
        print "<INPUT TYPE=\"submit\" VALUE=\"実行する\">\n";
    } else {
        print "<INPUT TYPE=\"submit\" VALUE=\"移動する\">\n";
        print "</FORM>\n";
    }
    print "</CENTER>\n";
    return ($start,$start + $page_max);
}

# [ リスト表示部 ]
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
<NOBR><TT>$name<BR>さんの疑問</TT></NOBR>
</TD><TD BGCOLOR="$title_bgcolor" WIDTH=80%>
<FONT COLOR="$title_color" SIZE=+1><B><TT>$text</B></TT></FONT>
</FONT></TD></TR></TABLE>
<P><TT>
_EOF_
        if ($a ne '') {
            foreach (split(/<\$>/,$a)) {
                local($name,$text,$ipad,$rhost) = split(/<>/,$_);
                print "<!--$ipad $rhost-->・$text<FONT COLOR=\"$emb_color\"><I>[$name]</I></FONT><BR>\n";
            }
        } else {
            print "<FONT COLOR=\"$emb_color\"><B>誰か答えて下さい。</B></FONT>";
        }
        print<<"_EOF_";
</TT>
<DIV ALIGN="right">
<FORM ACTION="$cginame" METHOD=post>
<INPUT TYPE="hidden" NAME="no" VALUE="$no">
<TT>名前:</TT><INPUT TYPE="text" NAME="name" SIZE=16 MAXSIZE=16>
<TT>解答:</TT><INPUT TYPE="text" NAME="ans" SIZE=60>
<INPUT TYPE="submit" VALUE="書き込む">
</FORM>
</DIV>
_EOF_
    }
    print<<"_EOF_";
<HR>
<DIV ALIGN="right"><TT>
<A HREF="$cginame?edit=on">[管理人専用]</A>
</TT></DIV>
_EOF_
}

# [ 登録制限処理 ]
#

sub axs_limited {
    $ref_url = $ENV{'HTTP_REFERER'};
    s/\?(.|\n)*//ig;
    s/\%7E/\~/ig;
    if($check_url && ($ref_url !~ $check_url)){
        &error(1,"<B>不当なアクセスです。</B><BR>$ref_url<BR>\n");
    }
    $ipad = $ENV{'REMOTE_ADDR'};
    foreach (@check_ipad) {
        if ($ipad =~ /^$_/) {  &error(1,"$ipad からの投稿は拒否されてます。\n"); }
    }
    if ($check_proxy) {
        local($envkey,$envvalue) = ();
        while(($envkey,$envvalue) = each(%ENV)){
            if($envkey =~ /proxy/i || $envvalue =~ /proxy/i){
            &error(1,"プロクシ経由でのアクセスは禁止されてます。\n");
            }
        }
    }
    if ($FORM{'name'} eq $admin_name) { &error(1,"名前が不正です。書き換えて下さい。"); }
    if ($FORM{'name'} eq $admin_pass) { $FORM{'name'} = $admin_name; }
}

# [ クエスチョン登録 ]
#

sub regist_question {
    if ((length($FORM{'name'}) > 16) || (length($FORM{'qes'}) > 4000)) { &error(1,'名前またはメッセージが長すぎです。'); }
    $ipad = $ENV{'REMOTE_ADDR'};
    $rhost = $ENV{'REMOTE_HOST'};
    if ($gethostaddr) { $rhost = $rhost eq $ipad?gethostbyaddr(pack('C4',split(/\./,$ipad)),2)||'':$rhost; }
    $no = (split(/<>/,$logs[0]))[0] + 1;
    unshift(@logs,"$no<>$FORM{'name'}<>$FORM{'qes'}<>$ipad<>$rhost<#>\n");
    while ($#logs>$reg_max-1) { pop(@logs); }
    &write_file($logfile,@logs);
}

# [ アンサー登録 ]
#

sub regist_answer {
    if ((length($FORM{'name'}) > 16) || (length($FORM{'ans'}) > 4000)) { &error(1,'名前またはメッセージが長すぎです。'); }
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
                &error(1,'二重投稿はご遠慮ください。リロードはしないでください。');
            }
            $logs[$i] =~ s/\n//;
            $logs[$i] .= "$FORM{'name'}<>$FORM{'ans'}<>$ipad<>$rhost<\$>\n";
        }
    }
    &write_file($logfile,@logs);
}

# [ エディターメイン（画面の表示等） ]
#

sub editor_main {
    @logs = &write_file($logfile,&kiji_edit);
    &html_header;
    $kiji = @logs;
    $size = (stat($logfile))[7];
    if ($lock_flag) {
        if (-f $lock1 || -f $lock2) {
            $comment = "･ <FONT COLOR=\"$emb_color\"><B>ロックファイルが検出されました（ロック中）</B></FONT><BR>";
        } else {
            $comment = "･ ロック機構\は正常に動作しています。<BR>";
        }
    } else {
        $comment = "･ ロック機構\を使用していません<BR>";
    }
    print<<"_EOF_";
<DIV ALIGN="right"><TT>[<A HREF="$cginame">やめる</A>]</TT></DIV>
<FORM METHOD="post" ACTION="$cginame">
<INPUT TYPE="hidden" NAME="edit" VALUE="on">
<INPUT TYPE="hidden" NAME="pass" VALUE="$FORM{'pass'}">
<CENTER><H2>Ans.Q Editor</H2></CENTER>
<BLOCKQUOTE><TT>
<HR>
<I>[ Ans.Qの状態 ]</I><BR>
･ 現在 $kiji 件の疑問があり、ログファイルは $size バイトになってます<BR>
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

# [ エディタで編集 ]

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

# [ パスワード入力（エディター) ]
#

sub editor_password {
    print<<"_EOF_";
<HR>
<CENTER>
管理用パスワードを入力してください。<P>
<FORM ACTION="$cginame" METHOD="post">
<INPUT TYPE="hidden" NAME="edit" VALUE="on">
<INPUT TYPE="password" NAME="pass" SIZE=10>
<INPUT TYPE="submit" VALUE="起動する">
</FORM><P>
（管理用のエディタを使用するためには、管理用パスワードが必要です。）
</CENTER>
_EOF_
}

# [ フォームからデータ取得 ]
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

# [ 文字コード関連 ]
#

sub check_code {
    if (!(-r $jcode)) { &error(1,"jcode.pl がみつかりません。"); }
    require $jcode;
    local($text) = ord(substr("中澤重人＝じゃわ(^-^;;",0,1));
    if ($text == 0xc3) { $mojicode = "euc"; $charset_code = "x-euc-jp"; }
    elsif ($text == 0x92) { $mojicode = "sjis";$charset_code = "x-sjis"; }
    else { &error(1,"サポートしてない文字コードです"); }
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

# [ 記録ファイルの処理 ]
#

sub read_file {
    local($logfile) = $_[0];
    if (!open(IN,$logfile)) {
        &error(1,"記録ファイルの読み込み不可");
    }
    local(@files) = <IN>;
    close(IN);
    return @files;
}
sub write_file {
    local($logfile,@lines) = @_;
    &dubble_lock_file;
    if ($lock_error) { &error(1,"ロックファイルを検出しました。時間をおいてご利用下さい。"); }

    if (!$savetype) {
        # 標準タイプ 全 OS 共通
        if (!open(OUT,">$logfile")) {
            &dubble_unlock_file;
            &error(1,"記録ファイルの書き込み不可");
        }
        print OUT @lines;
        close(OUT);
    } else {
        # 改良タイプ chmod 使用
        $tmpfile = "$$\.tmp";
        if (!open(OUT,">$tmpfile")) {
            &dubble_unlock_file;
            &error(1,"Temp利用ログ記録方式に未対応です。");
        }
        close(OUT);
        chmod 0666,$tmpfile;
        if (!open(OUT,">$tmpfile")) {
            &dubble_unlock_file;
            &error(1,"Temp利用ログ記録方式に未対応です。");
        }
        print OUT @lines;
        close(OUT);
        rename($tmpfile,$logfile);
    }
    &dubble_unlock_file;
    return @lines;
}

# [ ロック機構 ]
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

# [ エラー処理 ]
#

sub error {
    ($err,$err_msg) = @_;
    if ($err) { print "Content-type: text/html\n\n<HTML><BODY>"; }
    print<<"_EOF_";
<HR>
<TABLE BGCOLOR="#FFEEEE" CELLPADDING=5 WIDTH=100%><TD ALIGN=center>
<FONT COLOR="red"><B>エラー:$err_msg</B></FONT>
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