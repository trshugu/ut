#! perl
# use utf8;
=pod
=cut




=pod
# ファイルopen + csv
my $persons = [];
while (my $line = <>)
{
  #print $line;
  chomp $line;
  my @person = split(',', $line);
  push @$persons, \@person;
}

for my $person (@$persons) {
  print join(",", @$person)."\n";
}
=cut


=pod
# 二次元配列のループ処理
$persons = [
  ['Ken', 'Japan', 19],
  ['Taro', 'USA', 45]
];

# forでもforeach・・・
for my $person (@$persons) {
  for my $column (@$person) {
    print "$column\n";
  }
}

# csvで出力
for my $person (@$persons) {
  print join(",", @$person)."\n";
}


while(0){};
=cut


=pod
# 二次元配列
@person1 = ('Ken', 'Japan', 19);
@person2 = ('Taro', 'USA', 45);
#@persons = (\@person1, \@person2);
$persons = [
  ['Ken', 'Japan', 19],
  ['Taro', 'USA', 45]
];
print $persons->[0]->[2];
print $persons->[1][0];#これでもよい
=cut


=pod
# 配列のリファレンス
@nums = (1, 2, 3, 5);
#$nums = @nums; # これは個数を渡す
$nums = \@nums; # リファレンスの作成
print $nums->[2]."\n";
=cut


=pod
# 無名配列のリファレンス
$nums = [1, 2, 3];
print $nums->[1]."\n";
foreach $i ($nums)
{
  print $i;
}
=cut

=pod
# whileでforearch
%hash=("one"=>"iti","tow"=>"nini","three"=>"sansan");

while ( ($k, $v) = each %hash )
{
  print $k . "→" . $v ."\n";
}
=cut

=pod
# 連想配列
#%hash=("one","iti","tow","nini","three","sansan");
%hash=("one"=>"iti","tow"=>"nini","three"=>"sansan");

print $hash{one}."\n";
foreach $k (keys(%hash))
{
  print $k . "→" . $hash{$k}."\n";
}
=cut



=pod
# 配列とインデックス
$wee[0]="sdf";
$wee[1]="dfdfds";
print @wee;
=cut

=pod
# 配列
@arra = ("sdfa","dfdf","efef");
print @arra[1] . "\n";
@co = @arra; # 値渡し
@arra[1] = "fooooo";
print @co[1] . "\n";
push @arra, "forafora";
print "\n";
print "\n";
print $#arra;
print "\n";
print $#co;
print "\n";
print "\n";
foreach $str (@arra)
{
  print $str . "\n";
}
=cut

=pod
# printfは文字表示後、boolを返却 sprintfはstringを返却
$number = 907;
print sprintf("%04d\n", $number);
print printf("%04d\n", $number);
=cut

=pod
# foreach
foreach my $i (1..20)
{
  printf "%2d\n", $i;
}
=cut

=pod
# 出力成功時に真
if (printf("なにがし%s", "asfd\n"))
{
  print "true\n";
}
else
{
  print "false\n";
}
=cut

=pod
# printf関数
printf("なにがし%s", "asfd");
=cut

=pod
# 地獄世界
print "hell world\n";

=cut

__END__
print "ここもコードとして扱われない";
