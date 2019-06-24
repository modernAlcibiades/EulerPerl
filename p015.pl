#!/usr/bin/perl

=begin comment
=cut

use Data::Dumper;
sub lattice_path{
  my ($n, $m) = @_;
  # Initialization
  @lattice = ();
  for (my $a=0; $a<=$n; $a++){
    $lattice[$a][0]=1;
  }
  for (my $a=0; $a<=$m; $a++){
    $lattice[0][$b]=1;
  }
  for(my $s=2; $s<$m+$n; $s++){
    for(my $i = 1; $i<=$s/2; $i++){
      $j = $s-$i;
      if ($i<=$n and $j<=$m){
        $lattice[$i][$j] = $lattice[$i-1][$j]+$lattice[$i][$j-1]; 
      }
      if ($i<=$m and $j<=$n){
        $lattice[$j][$i] = $lattice[$j-1][$i]+$lattice[$j][$i-1]; 
      }
    }
  }
  print Dumper(@lattice);
  print "\n $lattice[$n][$m]\n";
  #print "@$lattice\n";
  #return @lattice[$n];
}

#$res = lattice_path(4,4);

@res = lattice_path(21,21);
print "@res[20]\n";
