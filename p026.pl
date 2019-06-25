#!/usr/bin/perl

=begin comment
Reciprocal Cycles

A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

    1/2	= 	0.5
    1/3	= 	0.(3)
    1/4	= 	0.25
    1/5	= 	0.2
    1/6	= 	0.1(6)
    1/7	= 	0.(142857)
    1/8	= 	0.125
    1/9	= 	0.(1)
    1/10	= 	0.1

Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
=cut


# Returns length of reciprocal cycle
# Based on the fact that a quotient, remainder pair cannot repeat 
# without the following numbers repeating
sub reciprocal_cycle_len {
  my $n = shift;
  my $m = 1;
  my @q = ();
  my $i = 0;
  my %match = ();
  while($m>0){
    $m *=10;
    push @q, int($m/$n);
    $m = $m%$n;
    if ($m == 0){
      return $n, 0;
    }
    if (exists($match{$q, $m})){
      return $n, $i - $match{$q, $m}; 
    }
    else {
      $match{$q, $m} = $i;
      $i++;
    }
  }
}

$max = (0,0);
for (my $i = 1; $i < 1000; $i++){
  @res = reciprocal_cycle_len($i);
  if (@max[1] < @res[1]){
    @max = @res;
  }
  print "Reciprocal cycle len @res\n";
}
print "Max @max\n";
