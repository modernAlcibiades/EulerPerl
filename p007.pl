#!/usr/bin/perl

=begin comment
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10 001st prime number?
=cut


sub get_n_primes{
  my ($count) = @_;
  local @primes = (2);
  local $pc = 1;
  local $val = 3;
  while ($pc < $count){
    #print "val $val, $pc\n";
    $sqrt_val = sqrt($val);
    foreach $p (@primes){
      if($p > $sqrt_val){
        push @primes, $val;
        $pc++;
        last;
      } elsif ($val%$p == 0){
        last;
      }
    }
    $val +=2;
  }
  return @primes;
}

@a = get_n_primes(6);
print "@a\n";
@b = get_n_primes(10001);
print "@b[-1]\n";

