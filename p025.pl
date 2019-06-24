#!/usr/bin/perl

use Data::Dumper;

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

sub fibonacci_num{
  my $max_n = @_[0]; 
  # Fibonacci matrix
  %m = ();
  $m{rows} = 2;
  $m{cols} = 2;
  $m{0,0} = [1];
  $m{0,1} = [1];
  $m{1,0} = [1];
  $m{1,1} = [0];

  $i = 1;
  %fib=%m;
  while((scalar @{$fib{0,0}}) < $max_n/2){
    %fib = matmul(\%fib, \%fib);
    $len = scalar @{$fib{0,0}};
    $i*=2;
    print "Fibonacci $i, @{$fib{0,0}}, $len\n";
  }
  while(scalar @{$fib{0,0}} < $max_n){
    %fib = matmul(\%m, \%fib);
    $i++;
    print "$i @{$fib{1,0}} \n";
  }
  print "next $i @{$fib{0,0}} \n";
  return $i+1;
}  
#
#mat_test();
$num_digits = 13;
$res = fibonacci_num($num_digits);
print "Index of first fibonacci number with $num_digits digits = $res\n";
