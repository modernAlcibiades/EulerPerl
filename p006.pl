#!/usr/bin/perl

sub cauchy_df {
  my $n = @_[0];
  $sq_sum = 0;
  $sum_sq = 0;
  for ($i=1; $i<=$n; $i++){
    $sq_sum +=$i*$i;
    $sum_sq +=$i;
  }
  $sum_sq = $sum_sq*$sum_sq;
  $res = $sum_sq - $sq_sum;
  return $res;
}

$res1 = cauchy_df(10);
$res2 = cauchy_df(100);
print "$res1, $res2\n";

