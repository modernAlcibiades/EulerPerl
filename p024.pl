#!/usr/bin/perl

=begin comment
Lexicographic Permutation

A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
=cut


sub lexicographic_perm{
  $count = @_[0];
  $index = @_[1];
  #%factorial = ();
  $factorial{1} = 1;
  for(my $i = 2; $i<=$count; $i++){
    $factorial{$i} = $factorial{$i-1} * $i;
  }

  @perm = (0 .. ($count-1));
  print "Number @perm\n";
  if($index >= $factorial{$count}){
    return reverse @perm;
  }
  for(my $i = 0; $i<$count; $i++){
    my $fac = $factorial{$count-$i-1}; 
    my $loc = int($index/$fac); 
    if ($loc > 0){
      $index -= $loc*$fac;
      my $val = @perm[$i+$loc];
      splice @perm, $i+$loc, 1;
      splice @perm, $i, 0, $val;
      print "$i $index $loc Number @perm\n";
      if ($index ==0){
      #  splice @perm, $i, 0, $val;
        last;
      }
    }
  }
  return @perm;
}


#@res = closest_perm(4, 12);
@res = closest_perm(10, 999999);
print "Value @res\n";
