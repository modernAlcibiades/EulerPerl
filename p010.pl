#!/usr/bin/perl

=begin comment
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
=cut


sub get_prime_sum_upto{
  my ($maxval) = @_;
  local @primes = (2);
  local $val = 3;
  local $sum = 2;
  while ($val < $maxval){
    #print "val $val, $pc\n";
    $sqrt_val = sqrt($val);
    foreach $p (@primes){
      if($p > $sqrt_val){
        push @primes, $val;
        $sum += $val;
        last;
      } elsif ($val%$p == 0){
        last;
      }
    }
    $val +=2;
  }
  return $sum;
}

$a = get_prime_sum_upto(14);
print "Sum upto 14 = $a\n";
$b = get_prime_sum_upto(2000000);
print "Sum upto 2 million = $b\n";
