#!/usr/bin/perl


=begin comment
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
=cut

sub divisors_upto {
  my ($n) = @_;
  %div = ();
  %divsum = ();
  for (my $i = 1; $i < $n; $i++){
    $div{$i} = [(1)];
    $divsum{$i} = 1;
  } 
  for (my $i = 2; $i < $n; $i++){
    $j = 2*$i;
    while($j < $n){
      push(@{$div{$j}}, $i);
      $divsum{$j} += $i;
      $j+=$i;
    }
    print "@{$div{$i}}\n";
    print "Sum $divsum{$i}\n";
  }
  return \%div, \%divsum;
}


sub get_non_abundant_nums {
  my %map = %{@_[0]};
  @abn = ();
  foreach $key (keys %map){
    $val = %map {$key};
    if (%map{$key} > $key){
      push @abn, $key;
    } 
  }
  @abn = sort { $a <=>$b} @abn;
  #print "Abundant numbers = @abn\n";

  %nabn = ();
  for (my $i =0; $i<28124; $i++){
    $nabn{$i} = true;
  }
  $len = scalar @abn;
  #print "Length abn = $len\n";
  for (my $j = 0; $j<$len; $j++){
    my $i = $j;
    while((@abn[$i] + @abn[$j]) < 28124){
      #print "@abn[$i] + @abn[$j]\n";
      if(exists($nabn{@abn[$i] + @abn[$j]})) {
          delete($nabn{@abn[$i] + @abn[$j]});
      }
      $i++;
    }
  }
  return (keys%nabn);
}

$div, $divsum = divisors_upto(28124);
@keys = get_non_abundant_nums($divsum);
print "Non-abundant numbers = @keys\n";
$sum = 0;
foreach $k (@keys){
  $sum += $k;
}
print "Sum Non-abundant numbers = $sum\n";

