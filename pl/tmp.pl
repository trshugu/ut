#! perl
# use utf8;
=pod
=cut




# perl -le 'print $~^" !#64:"'
# print $~^" !#64:"

=pod
# �p�����̃����_��������
$length = 6;

@char_tmp=();

# �z��Ƀ����_����������Ώۂ̕�������i�[
push @char_tmp, ('a'..'z');
push @char_tmp, ('A'..'Z');
push @char_tmp, (0..9);

# �w�蕶�������A�����_��������𐶐�����
$rand_str_tmp = '';
for ($i=1; $i<=$length; $i++) {
  $rand_str_tmp .= $char_tmp[int(rand($#char_tmp+1))];
}

print $rand_str_tmp;
=cut


=pod
# �N���[�W��
sub func
{
  #�_�C�i�~�b�N�X�R�[�v�ł͒l���擾�ł��Ȃ�
  #local $xxx = $_[0];
  my $xxx = $_[0];
  my $ff = sub
  {
    my $ret = $xxx + $_[0];
    return $ret;
  };
  
  return $ff;
};

$clo = &func(4);
print $clo->(3);
=cut

=pod
# �����֐�
$func = sub { return $_[0] + 2; };
print $func->(3);
=cut


=pod
# �T�u���[�`��
sub func
{
  print "sususb". $_[0];
}

&func("value");
=cut


=pod
# �t�@�C��open + csv
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
# �񎟌��z��̃��[�v����
$persons = [
  ['Ken', 'Japan', 19],
  ['Taro', 'USA', 45]
];

# for�ł�foreach�E�E�E
for my $person (@$persons) {
  for my $column (@$person) {
    print "$column\n";
  }
}

# csv�ŏo��
for my $person (@$persons) {
  print join(",", @$person)."\n";
}


while(0){};
=cut


=pod
# �񎟌��z��
@person1 = ('Ken', 'Japan', 19);
@person2 = ('Taro', 'USA', 45);
#@persons = (\@person1, \@person2);
$persons = [
  ['Ken', 'Japan', 19],
  ['Taro', 'USA', 45]
];
print $persons->[0]->[2];
print $persons->[1][0];#����ł��悢
=cut


=pod
# �z��̃��t�@�����X
@nums = (1, 2, 3, 5);
#$nums = @nums; # ����͌���n��
$nums = \@nums; # ���t�@�����X�̍쐬
print $nums->[2]."\n";
=cut


=pod
# �����z��̃��t�@�����X
$nums = [1, 2, 3];
print $nums->[1]."\n";
foreach $i ($nums)
{
  print $i;
}
=cut

=pod
# while��forearch
%hash=("one"=>"iti","tow"=>"nini","three"=>"sansan");

while ( ($k, $v) = each %hash )
{
  print $k . "��" . $v ."\n";
}
=cut

=pod
# �A�z�z��
#%hash=("one","iti","tow","nini","three","sansan");
%hash=("one"=>"iti","tow"=>"nini","three"=>"sansan");

print $hash{one}."\n";
foreach $k (keys(%hash))
{
  print $k . "��" . $hash{$k}."\n";
}
=cut



=pod
# �z��ƃC���f�b�N�X
$wee[0]="sdf";
$wee[1]="dfdfds";
print @wee;
=cut

=pod
# �z��
@arra = ("sdfa","dfdf","efef");
print @arra[1] . "\n";
@co = @arra; # �l�n��
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
# printf�͕����\����Abool��ԋp sprintf��string��ԋp
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
# �o�͐������ɐ^
if (printf("�Ȃɂ���%s", "asfd\n"))
{
  print "true\n";
}
else
{
  print "false\n";
}
=cut

=pod
# printf�֐�
printf("�Ȃɂ���%s", "asfd");
=cut

=pod
# �n�����E
print "hell world\n";

=cut

__END__
print "�������R�[�h�Ƃ��Ĉ����Ȃ�";
