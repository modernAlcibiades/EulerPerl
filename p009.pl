#!/usr/bin/perl


for (my $a= 500; $a >250; $a--){
  $lim = sqrt(2)+1;
  for (my $d = 1; $d < $a/$lim; $d++){
    $c_sq = ($a + $d)* ($a + $d);
    $b_sq = (1000-2*$a-$d)*(1000-2*$a-$d);
    if ($c_sq == (($a*$a)+$b_sq)){
      print "$c_sq, $b_sq\n";
      $c = $a+$d;
      $b = (1000-2*$a-$d);
      print "$c*$b*$a \n";
    } 
  } 
} 
