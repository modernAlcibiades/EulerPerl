#!/usr/bin/perl

=begin comment


The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=cut


sub collatz_step {
  if (@_[0] % 2==0){
    return (@_[0]/2);
  } else {
    return (3*@_[0] + 1);
  }
}

sub max_collatz_len {
  my ($lim) = @_[0];
  my %collatz_hash = (1=>1);
  my $max_len = 1; 
  my $max_num = 1; 
  for (my $i = 2; $i < $lim; $i++){
    my @chain = ();
    my $j = $i;
    my $inc = 0;
    until(exists($collatz_hash{$j})){
      push @chain, $j;
      #print "$j -> ";
      $j = collatz_step($j);
    }

    #print("1\n");
    $len = scalar @chain;
    for (my $k = 0; $k< $len; $k++){
      $collatz_hash{@chain[$k]} = $collatz_hash{$j}+$len-$k;
      #print "Collatz_chain length @chain[$k], $collatz_hash{@chain[$k]}\n";
    }
    if ($collatz_hash{$i} > $max_len){
      $max_len = $collatz_hash{$i};
      $max_num = $i;
      print "New max num $max_num, len $max_len\n";
    }
  } 
return $max_num, $max_len;
}


@res = max_collatz_len(20);
print "Max Collatz under 20 = @res\n";
@res = max_collatz_len(1000000);
print "Max Collatz under 1000000 = @res\n";
