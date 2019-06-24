#!/usr/bin/perl

=begin comment
Power Digit Sum
215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 21000?

=cut

sub array_prod {
  my ($a, $b) = @_;
  my $m = scalar @$a;
  my $n = scalar @$b;
  my @res = (0)*($m+$n);
  my $carry = 0;
  for (my $i = 0; $i<$m; $i++){
    for(my $j=0; $j<$n; $j++){
      @res[$i+$j] += @$a[$m-$i-1]* @$b[$n-$j-1];
    }
  }
  for ($s = 0; $s<$m+$n; $s++){
    my $new = $carry + @res[$s];
    $carry = int($new/10);
    @res[$s] = $new % 10;
  } 
  if (@res[-1] == '0'){
    pop @res;
  }
  print "Product @$a @$b = @res\n";
  return reverse @res;
}

sub fast_power{
  my ($p, @a) = @_;
  print "Fast power @a ** $p\n";
  if ($p == 0){
    return 1;
  } elsif ($p == 1){
    return @a;
  } elsif($p%2 == 0){
    return fast_power(int($p/2), array_prod(\@a,\@a));
  } elsif($p%2 != 0){
    @tmp = fast_power(int($p/2), array_prod(\@a, \@a));
    return array_prod(\@tmp, \@a);
  }
}

sub sum_digits{
  my @num = @_;
  print "number @num\n";
  $val = 0;
  foreach (@num){
    print "$_ ";
    $val +=$_;
  }
  return $val;
}





my @a = split(//,"2");
my @b = split(//,"543");
#$res = sum_digits(fast_power(15, @a));
#print "2**15 = $res\n"; 
#my @res = array_prod(\@a, \@b);
#print "@a * @b = @res\n"; 
$res = sum_digits(fast_power(1000, @a));
print "2**1000 = $res\n"; 
