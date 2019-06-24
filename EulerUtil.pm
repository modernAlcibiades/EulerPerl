#!/usr/bin/perl
package EulerUtil;
# All useful functions created while solving Euler Project
use strict;
use warnings;
use PDL;
use Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw( power get_prime_factors check_palindrome gcd);
our @EXPORT_OK = qw( power get_prime_factors check_palindrome gcd);


## Structs
use Class::Struct;
# Graph node
struct( Node => {
    val => '$', #value of node
    parents => '@',
    children => '@',
  });


# Fast Matrix Exponent
# p2
sub power{
  my ($m, $p)= @_;
  if ($p < 0){
    local $q = -1*$p;
    return power(inv($w), $q);
  }
  elsif ($p == 1){
    local $w = $m;
  } elsif ($p == 0){
    return identity($m);
  }else {
    local $q = int($p/2);
    local $r = $p%2;
    return (power(($m x $m), $q) x power($m, $r));
  }
}


# Get primes and prime factorization
# p3
sub get_prime_factors{
  my ($num) = @_;
  local @primes = (2);
  local $val = 1;
  local $sqrt_num = sqrt($num);
  local $max_prime = 1;
  local @factors = (1);
  while (true){
    $val +=1;
    $sqrt_val = sqrt($val);
    foreach $p (@primes){
      if($p > $sqrt_val){
        push @primes, $val;
        if($num % $val == 0){
          while($num % $val == 0){
            $num = $num/$val;
          }
          $max_prime = $val;
          push @factors, $val;
          #print "Factor @factors\n";
        }
        last;
      } elsif ($val%$p == 0){
        last;
      }
    }
    if($val > $sqrt_num){
      #print "Primes @primes\n";
      #print "Factors @factors\n";
      if ($num > 1) {push @factors,$num;}
      return (@factors, @primes);
    }
  }
}


# Check if a number is a palindrome
# p4
sub check_palindrome{
  my $num=@_[0];
  if ($num == reverse $num){
    return true;
  }
  return false;
}

# gcd
sub gcd{
  local $r = @_[0] % @_[1];
  if ($r==0){
    return @_[1];
  } else {
    return gcd(@_[1], $r);
  }
}


# Add next n primes to given list of primes
# p12
sub find_next_n_primes {
  my ($primes, $n) = @_;
  print "Primes @$primes\n";
  $val = @$primes[-1];
  while ($n > 0){
    $val +=2;
    my $sqrt_val = sqrt($val);
    foreach my $p (@$primes){
      if($p > $sqrt_val){
        push @$primes, $val;
        $n--;
        last;
      } elsif ($val%$p == 0){
        last;
      }
    }
  }
  print "Last prime @$primes[-1]\n";
  write_array_to_file('primes.txt', @$primes);
}


# Array from File Input Output
# p12
sub write_array_to_file {
  my ($filename, @arr) = @_;
  print "@arr\n";
  print "$filename\n";
  open my $fh, '>', $filename or die "Cannot open $filename: $!";

  # Loop over the array
  foreach (@arr)
  {
      print $fh "$_\n"; # Print each entry in our array to the file
  }
  close $fh; # Not necessary, but nice to do
}

sub read_array_from_file {
  my ($filename) = @_;
  open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open '$filename' $!";

  # Loop over lines
  @arr = ();
  while ( my $line = <$fh>){
    #Some processing $grid{$i} = [split( / /, $line)];
    push @arr, int($line);
  }
  close $fh; # Not necessary, but nice to do
  return @arr;
}



## Array Arithmatic
# problem 16, 20
# Array product
sub array_prod {
  my ($a, $b) = @_;
  my $m = scalar @$a;
  my $n = scalar @$b;
  my @res = (0)*($m+$n);
  my $carry = 0;
  my $s = 0;
  for (my $i = 0; $i<$m; $i++){
    for(my $j=0; $j<$n; $j++){
      @res[$i+$j] += @$a[$m-$i-1]*@$b[$n-$j-1];
    }
  }
  #print "Intermediate product @$a, @$b = @res\n";
  while ($s < ($m+$n) or $carry >0){
    my $new = $carry + @res[$s];
    $carry = int($new/10);
    @res[$s] = $new % 10;
    $s++;
    #print "Int @res, new $new, carry $carry, s $s\n";
  } 
  if (@res[-1] == 0 and scalar @res > 1){
    pop @res;
  }
  #print "Product @$a, @$b = @res\n";
  return reverse @res;
}

# Array sum
sub array_sum {
  my ($a, $b) = @_;
  my $m = scalar @$a;
  my $n = scalar @$b;
  my $carry = 0;
  my $min = $m < $n? $m :$n;
  my $s = 0;
  my @res = ();
  #print "Input @{$a}, @{$b}, carry $carry\n";
  for (my $i = 0; $i<$min; $i++){
    @res[$i] = @$a[$m-$i-1]+@$b[$n-$i-1];
  }
  while($min < $m){
    @res[$min] = @$a[$m-$min-1];
    $min++;
  }
  while($min < $n){
    @res[$min] = @$b[$n-$min-1];
    $min++;
  }
  #print "Intermediate sum @$a, @$b = @res\n";
  for ($s = 0; $s<$min; $s++){
    my $new = $carry + @res[$s];
    $carry = int($new/10);
    @res[$s] = $new % 10;
    #print "Int @res, new $new, carry $carry, s $s\n";
  } 
  while ($carry > 0){
    @res[$s] = $carry%10; 
    $carry = int($carry/10); 
    #print "Here Int @res, new $new, carry $carry, s $s\n";
    $s++;
  }
  if (@res[-1] == 0 and scalar @res > 1){
    pop @res;
  }
  #print "Sum @$a @$b = @res\n";
  return reverse @res;
}

# matrix multiplication
sub matmul{
  my %a = %{@_[0]};
  my %b = %{@_[1]};

  if ($a{cols} != $b{rows}) {
    print "Bad matrices\n";
    return %a;
  }
  %res = ();
  $res{rows} = $a{rows};
  $res{cols} = $b{cols};
  for (my $i =0; $i < $a{rows}; $i++){
    for (my $j =0; $j < $b{cols}; $j++){
      $res{$i,$j} = [0];
      for (my $k =0; $k < $a{cols}; $k++){
        @local = array_prod(\@{$a{$i,$k}}, \@{$b{$k,$j}});
        #print "$i, $k, $j: @{$a{$i,$k}} * @{$b{$k,$j}} = @local\n";
        @{$res{$i,$j}} = array_sum(\@{$res{$i,$j}}, \@local);
      } 
      #print "arr $i, $j = @{$res{$i,$j}}\n";
    } 
  }
  return %res;
}

# matrix sum
sub matsum{
  my %a = %{@_[0]};
  my %b = %{@_[1]};
  #print Dumper(%a);

  if (($a{rows} != $b{rows}) or ($a{cols} != $b{cols})) {
    print "Bad matrices\n";
    return %a;
  }
  %res = ();
  $res{rows} = $a{rows};
  $res{cols} = $b{cols};
  for (my $i =0; $i < $a{rows}; $i++){
    for (my $j =0; $j < $a{cols}; $j++){
      #print "vals $i, $j, @{$a{$i,$j}} + @{$b{$i,$j}}\n";
      @{$res{$i,$j}} = array_sum(\@{$a{$i,$j}}, \@{$b{$i,$j}});
      #print "arr $i, $j = @{$res{$i,$j}}\n";
    } 
  }
  return %res;
}

# Test code
sub mat_test{
%m = ();
$m{rows} = 2;
$m{cols} = 2;
$m{0,0} = [5];
$m{0,1} = [3];
$m{1,0} = [3];
$m{1,1} = [2];

#%a = matsum(\%m, \%m);
%b = matmul(\%m, \%m);
print Dumper(%m);
#print Dumper(%a);
print Dumper(%b);
}
