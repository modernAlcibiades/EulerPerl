#!/usr/bin/perl

=begin comment
Names Scores

Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

=cut

# setting alphabet value as 'a' = 1, 'b' =2, etc
sub get_word_value{
  @str = split(//,$_[0]);
  print "@str\n";
  $val = 0;
  foreach $char (@str){
    $val += ord($char)-ord('A')+1
    }
  return $val;
}

# Find total score for all words in the file
sub get_score_for_file {
  my ($filename) = @_;
  open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open '$filename' $!";

  # Loop over lines
  %scores = ();
  my $s = <$fh>;
  $s=~ s/[\"]+//g;
  my @lines = split(/,/, $s);
  foreach $line (@lines){
    #Some processing $grid{$i} = [split( / /, $line)];
    $scores{$line} = get_word_value($line);
  }
  print "$scores{'COLIN'}\n";
  close $fh; # Not necessary, but nice to do
  my $i = 0;
  my $sum = 0;
  foreach $k (sort(keys%scores)) {
    $i++;
    $sum += $i*$scores{$k};
  }
  return $sum;
}

$res = get_score_for_file('p022_names.txt');
print "Sum $res\n";
