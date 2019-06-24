#!/usr/bin/perl

# Project Euler
$var = <<'EOF';
Problem 1

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
EOF
print "$var\n";

$n1 = 3;
$n2 = 5;
$nm = $n1*$n2;
$m1 = $n1;
$m2 = $n2;
$mm = $nm;
$sum = 0;
# Add multiples of 3
#until ($m1 > 1000){
while ($m1 < 1000){
  $sum += $m1;
  $m1 +=$n1;
}
print "Required value for $n1 and $n2 is $sum\n";
# Add multiples of 5
#until ($m2 > 1000){
while ($m2 < 1000){
  $sum += $m2;
  $m2 +=$n2;
}
print "Required value for $n1 and $n2 is $sum\n";
# Remove double counted multiples of 3*5
#until ($mm > 1000){
while ($mm < 1000){
  $sum -= $mm;
  $mm +=$nm;
}
print "Required value for $n1 and $n2 is $sum\n";

