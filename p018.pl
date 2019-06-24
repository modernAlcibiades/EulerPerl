#!/usr/bin/perl

use Data::Dumper;

sub read_tree_from_file {
  my ($filename) = @_;
  @arr = ();
  $size= 0;
  open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open '$filename' $!";

  # Loop over lines
  while ( my $line = <$fh>){
    #Some processing $grid{$i} = [split( / /, $line)];
    my @row = split( / /,$line);
    push @arr, [@row]; 
    $size++;
  }
  close $fh; # Not necessary, but nice to do
  return @arr, $size;
}

sub max {
  return $_[0]>=$_[1]? $_[0]: $_[1];
}


sub calc_max_path {
  my ($arr, $size) = @_;
  my @max_path = ();
  print"Last row @{$arr[$size-1]} \n";
  #print Dumper($arr[$size-1]);
  #$max_path[$size-1] = $arr[$size-1];
  for (my $i = 0; $i<$size; $i++){ 
    $max_path[$size-1][$i] = $arr[$size-1][$i];
  }
  for (my $i = $size-2; $i >=0; $i--){
    for (my $j =0; $j <=$i; $j++){
      $max_path[$i][$j] = max($max_path[$i+1][$j], $max_path[$i+1][$j+1]) + $arr[$i][$j]; 
    }
  }
  print Dumper(@max_path);
  print "\nmax\n";
  print "$max_path[0][0]\n";
  return $max_path[0][0];
}

@arr, $size = read_tree_from_file('p018_tree.txt');

$res = calc_max_path(\@arr, $size);
