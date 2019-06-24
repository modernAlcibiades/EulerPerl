#!/usr/bin/perl

use PDL;


sub power{
  my ($m, $p)= @_;
  if ($p < 0){
    local $q = -1*$p;
    return power(inv($w), $q);
  }
  elsif ($p == 1){
    local $w = $m;
  } elsif ($p == 0){
    return identity($m);
  }else {
    local $q = int($p/2);
    local $r = $p%2;
    return (power(($m x $m), $q) x power($m, $r));
  }
}


sub Even_fibonacci_sum{
  $max = $_[0];
  $m=pdl([[1,1], [1,0]]);
  $inc = power($m,3);
  $fib = power($m,2);
  print "$fib\n";
  print "$inc\n";
  $res = $fib->slice('(0),(0)');
  $sum = 0;
  while ($res < $max){
    print "$res\n";
    $sum += $res;
    $fib = $fib x $inc; 
    $res = $fib->slice('(0),(0)');
  }
  print "Final Sum = $sum\n";
  return $sum;
}  

$res = Even_fibonacci_sum(4000000);

#$m=pdl([[1,1], [1,0]]);
#$w = power($m, 3);
##$p = $w->slice('(0),(0)');#->index(1,1);
###$w=$m**3;
###$w = $m x$n;
#print "$w \n";
