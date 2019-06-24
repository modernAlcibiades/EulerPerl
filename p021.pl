#!/usr/bin/perl

use Data::Dumper;

sub divisors_upto {
  my ($n) = @_;
  %div = ();
  %divsum = ();
  for (my $i = 1; $i < $n; $i++){
    $div{$i} = [(1)];
    $divsum{$i} = 1;
  } 
  for (my $i = 2; $i < $n; $i++){
    $j = 2*$i;
    while($j < $n){
      push(@{$div{$j}}, $i);
      $divsum{$j} += $i;
      $j+=$i;
    }
    print "@{$div{$i}}\n";
    print "Sum $divsum{$i}\n";
  }
  print "$divsum{220}, $divsum{284}\n";
  return \%div, \%divsum;
}

sub get_amicable_nums {
  my %map = %{@_[0]};
  @ami = ();
  $sum = 0;
  foreach $key (keys %map){
    $val = %map {$key};
    print "$key, $val\n";
    if (exists( $map {$val}) and (%map{$val} == $key) and $key !=$val){
      push @ami, $key;
      $sum += $key;
    } 
  }
  print "\nAmicable numbers \n @ami\n";
  print "$map{220}, $map{284}\n";
  print "Sum = $sum\n";
  return @ami;
}


$div, $divsum = divisors_upto(10000);
@ami = get_amicable_nums($divsum);

