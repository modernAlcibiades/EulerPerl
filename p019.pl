#!/usr/bin/perl


my @month = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
my @leap_month = (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
my $year = 1901;
my $day = 2;
my $count = 0;

while ($year < 2001){
  if (($year%4 ==0 and $year%100!=0) or $year%400 ==0){
    @mon = @leap_month;
  } else {
    @mon = @month;
  }
  foreach $dom (@mon){
    $day = ($day+$dom)%7;
    if ($day == 0){
      $count++;
    }
  }
  $year++;
} 

print "Months starting at Sunday = $count\n";
