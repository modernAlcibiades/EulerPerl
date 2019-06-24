#!/usr/bin/perl

=begin comment
Factorial Digit Sum
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
=cut

## Array Arithmatic
# Array product
sub arrnum_product {
  my ($a, $b) = @_;
  my $m = scalar @$a;
  my $n = scalar @$b;
  my @res = (0)*($m+$n);
  my $carry = 0;
  for (my $i = 0; $i<$m; $i++){
    for(my $j=0; $j<$n; $j++){
      @res[$i+$j] += @$a[$m-$i-1]* @$b[$n-$j-1];
    }
  }
  for ($s = 0; $s<$m+$n; $s++){
    my $new = $carry + @res[$s];
    $carry = int($new/10);
    @res[$s] = $new % 10;
  } 
  if (@res[-1] == '0'){
    pop @res;
  }
  @res = reverse @res;
  print "Product @$a X @$b = @res\n";
  return @res;
}

# sum of digits
sub sum_digits{
  my @num = @_;
  print "number @num\n";
  $val = 0;
  foreach (@num){
    print "$_ ";
    $val +=$_;
  }
  return $val;
}

# Convert to arrnum
sub convert_num_to_arrnum {
  my $num = @_[0];
  return split(//, "$num");
}

# Convert from arrnum
sub convert_arrnum_to_num {
  my @num = @_;
  return join('', @num);
}

# Factorial
sub arrnum_factorial {
  my ($n) = @_;
  @num = convert_num_to_arrnum($n);
  print "@num\n";
  @product = (1);
  for (my $i = 1; $i <=$n; $i++){
    @j = convert_num_to_arrnum($i);
    @product = arrnum_product(\@j, \@product);
  }
  return @product;
}

$res = sum_digits(arrnum_factorial(100));
print "Result $res\n";


