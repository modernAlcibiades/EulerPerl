#!/usr/bin/perl

=begin comment
Number spiral diagonals

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
=cut

sub sum_spirit_diagonal {
  my $n = @_[0];
  if ($n ==1){
    return 1;
  } elsif ($n == 2){
    return 10;
  } else {
    return (sum_spirit_diagonal($n-2) + 4*$n*$n - 6*($n-1));
  }
}

for (my $n = 1; $n < 10; $n++){
  my $res = sum_spirit_diagonal($n);
  print "$n - $res\n";
}

$res = sum_spirit_diagonal(1001);
print "1001 - $res\n";




