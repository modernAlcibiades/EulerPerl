#!/usr/bin.perl
use strict;
use warnings;

#=begin comment
#The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
#
#73167176531330624919225119674426574742355349194934
#96983520312774506326239578318016984801869478851843
#85861560789112949495459501737958331952853208805511
#12540698747158523863050715693290963295227443043557
#66896648950445244523161731856403098711121722383113
#62229893423380308135336276614282806444486645238749
#30358907296290491560440772390713810515859307960866
#70172427121883998797908792274921901699720888093776
#65727333001053367881220235421809751254540594752243
#52584907711670556013604839586446706324415722155397
#53697817977846174064955149290862569321978468622482
#83972241375657056057490261407972968652414535100474
#82166370484403199890008895243450658541227588666881
#16427171479924442928230863465674813919123162824586
#17866458359124566529476545682848912883142607690042
#24219022671055626321111109370544217506941658960408
#07198403850962455444362981230987879927244284909188
#84580156166097919133875499200524063689912560717606
#05886116467109405077541002256983155200055935729725
#71636269561882670428252483600823257530420752963450
#
#Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
#=cut
#

sub max_adj_prod {
  my $str = $_[0]; #string of numbers
  my $adj = $_[1]; #adjacent number to multiply
  my $len =length($str);
  print "Length $len\n";
  my @str = split '',$str;
  my %logmap = ();
  for (my $i = 1; $i<10; $i++){
    $logmap{"$i"} = log($i);
    print "$i : $logmap{$i}\n";
  }
  my $cnt = 0;
  my $adj_cnt = 0;
  my $sum = 0;
  my $max_sum = 0;
  my $max_loc = 0;
  while($cnt < $len){
    if (int(@str[$cnt]) == 0){
      print "Encountered Zero = $cnt\n";
      $adj_cnt = 0;
      $sum = 0;
    } else{
      if ($adj_cnt == $adj) {
        $sum = $sum + $logmap{@str[$cnt]} - $logmap{@str[$cnt-$adj]};
      } else {
        $sum = $sum + $logmap{@str[$cnt]};
        $adj_cnt++;
      }
      if ($adj_cnt == $adj && $sum > $max_sum){
        $max_sum = $sum;
        $max_loc = $cnt;
        print "Next max = $max_loc\n";
      }
    }
    $cnt++; 
  }
  $max_sum =1; 
  print"Final max $max_loc\n";
  for (my $i=0; $i<$adj; $i++){
    print "@str[$max_loc - $i]*";
    $max_sum *= int(@str[$max_loc - $i]);
  }
  return $max_sum;
}


# Exception handling
sub solve{
  my $filename='p008_number.txt';
  open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open '$filename' $!";
  my $number = <$fh>;
  return max_adj_prod($number, 13);
}
#print "$number\n";
my $res = solve();
print "Out $res\n";
