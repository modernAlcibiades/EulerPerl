#!/usr/bin/perl


sub read_array_from_file {
  my ($filename) = @_;
  open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open '$filename' $!";

  # Loop over lines
  $val = 0;
  while ( my $line = <$fh>){
    #Some processing $grid{$i} = [split( / /, $line)];
    $val += $line;
  }
  print "Result $val\n";
  close $fh; # Not necessary, but nice to do
}

$res = read_array_from_file('p013_number.txt')
