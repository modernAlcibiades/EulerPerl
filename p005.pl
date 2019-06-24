#!/usr/bin/perl

sub gcd{
  local $r = @_[0] % @_[1];
  if ($r==0){
    return @_[1];
  } else {
    return gcd(@_[1], $r);
  }
}

sub even_multiple {
  my ($start, $end) = @_;
  $res = $start;
  for ($i = $start; $i <= $end; $i++){
    $res = ($res*$i)/gcd($i,$res);
    print "$i, $res\n";
  }
  return $res;
}


$a = gcd(28, 348);
$b = even_multiple(1,20);

print "a $a\n";
print "b $b\n";

