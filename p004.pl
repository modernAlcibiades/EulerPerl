#!/usr/bin/perl

sub check_palindrome{
  my $num=@_[0];
  if ($num == reverse $num){
    return true;
  }
  return false;
}

$res = false;
for($j=2; $j<999; $j++){
  for($i = int($j/2); $i>=1;$i--){
    $num1 = (1000 - $i);
    $num2 = (1000-($j-$i));
    $res = check_palindrome($num1*$num2);
    if ($res == true){
      print "$num1 X $num2 = $res\n";
    }
  } 
}
