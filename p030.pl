#!/usr/bin/perl

=begin comment
Digit fifth powers
Problem 30

Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

    1634 = 14 + 64 + 34 + 44
    8208 = 84 + 24 + 04 + 84
    9474 = 94 + 44 + 74 + 44

As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=cut

sub digit_pow_sum {
  my $pow = @_[0];
  %powmap = ();
  @valid_nums = ();
  for(my $i =0; $i<10; $i++){
    $powmap{$i} = $i**$pow;
    print "$i^$pow = $powmap{$i}\n";
  }
  $max_len = 2;
  while(10**($max_len) < $max_len*($powmap{9})){
    $max_len++;
  }
  print "Max digits $max_len\n";


  for($num=11; $num < 10**($max_len); $num++){
    @arr = split(//,"$num");
    $sum = 0;
    foreach $j (@arr){
      $sum += $powmap{int($j)};
    } 
    if ($sum == $num){
      push @valid_nums, $num;
    }
  }
  print "@valid_nums\n";
  $num_sum = 0;
  foreach $n (@valid_nums){
    $num_sum+=$n;
  }
  return $num_sum;
}

$res = digit_pow_sum(5); 
print "Sum $res\n";
