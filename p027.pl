#!/usr/bin/perl

=begin comment
Quadratic Primes

Euler discovered the remarkable quadratic formula:
n2+n+41

It turns out that the formula will produce 40 primes for the consecutive integer values 0≤n≤39
. However, when n=40,402+40+41=40(40+1)+41 is divisible by 41, and certainly when n=41,412+41+41

is clearly divisible by 41.

The incredible formula n2−79n+1601
was discovered, which produces 80 primes for the consecutive values 0≤n≤79

. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

    n2+an+b

, where |a|<1000 and |b|≤1000

where |n|
is the modulus/absolute value of n
e.g. |11|=11 and |−4|=4

Find the product of the coefficients, a
and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n=0.
=cut

sub read_primes_from_file {
  my ($filename) = @_;
  open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open '$filename' $!";

  # Loop over lines
  %primes = ();
  while ( my $line = <$fh>){
    #Some processing $grid{$i} = [split( / /, $line)];
    $primes{int($line)} = 1;
  }
  close $fh; # Not necessary, but nice to do
  return %primes;
}

sub num_quad_primes{
  my ($a, $b, $primes) = @_;
  my @res = (1, $a, $b);
  my $n= 1;
  while(exists($primes->{($n*$n+$a*$n+$b)})){
    $n++;
    @res[0] = @res[0]+1;
  }
  #print "@res\n";
  return @res;
}

sub quadratic_primes{
  my ($lim) = @_[0];
  my %primes = read_primes_from_file('primes.txt');

  my $max = (39, 1, 41);
  foreach $b (sort{ $a <=>$b}(keys%primes)){
    if($b > $lim){
      last;
    }
    if($b > 41){
      for ($a=1; $a <$lim; $a+=2){
        my @res = num_quad_primes($a, $b, \%primes);
        if (@max[0] < @res[0]){
          @max = @res;
          print "@max\n";
        }
        my @res = num_quad_primes(-$a, $b, \%primes);
        if (@max[0] < @res[0]){
          @max = @res;
          print "@max\n";
        }
      }
    }
  }
  print "Best @max\n";
  return @max[1]*@max[2];
}

$res = quadratic_primes(1000);
print "Product $res\n";

