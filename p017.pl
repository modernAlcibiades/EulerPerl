#!/usr/bin/perl
=begin comment
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
=cut

use Lingua::EN::Numbers qw(num2en num2en_ordinal);
sub most_useless_problem{
  my $n = @_[0];
  $len = 0;
  for (my $i= 1; $i< $n; $i++){
    my $val = num2en($i);
    $val =~ s/[^a-zA-Z0-9,]//g;
    print "$val\n";
    $len += length $val;
  }
  return $len;
}

$res = most_useless_problem(1001);
print "Number of letters $res\n";
