#!/usr/bin/perl

# Perl
sub get_primes{
  my ($num) = @_;
  local @primes = (2);
  local $val = 1;
  local $sqrt_num = sqrt($num);
  local $max_prime = 1;
  local @factors = (1);
  while (true){
    $val +=1;
    #print "$val\n";
    $sqrt_val = sqrt($val);
    foreach $p (@primes){
      if($p > $sqrt_val){
        push @primes, $val;
        if($num % $val == 0){
          while($num % $val == 0){
            $num = $num/$val;
          }
          $max_prime = $val;
          push @factors, $val;
          #print "Factor @factors\n";
        }
        last;
      } elsif ($val%$p == 0){
        last;
      }
    }
    if($val > $sqrt_num){
      print "Primes @primes\n";
      print "Factors @factors\n";
      if ($num > 1) {return $num;}
      else {return $max_prime;}
    }
  }
}


$res = get_primes(600851475143);
#$res = get_primes(324712);
print "$res\n";
