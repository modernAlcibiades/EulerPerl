#!/usr/bin/perl

# single line comment
=begin comment
multi
line
comment
=cut


# Using "" around string expands variables and special characters
# Using '' produces string verbatim

$var = <<'EOF';
$var = <<'EOF';
Multi line printing
If we replace ' with " we will can interpolate variables and special characters
print "$var\n"
EOF
print "$var\n";

$var = <<'EOF';
A Perl identifier is a name used to identify a variable, function, class, module, or other object. A Perl variable name starts with either $ (variable), @ (array) or % (hash / dict) followed by zero or more letters, underscores, and digits (0 to 9). Perl is case sensitive.
EOF
print "$var\n";


$var = <<"EOF";
String Literals
\\\\   \\
\\\'   \'
\\\"   \"
\\a   \a
\\b   \b
\\f   \f
\\n   newline
\\r   carriage return
\\t   tab
\\v   vertical tab
\\0nn Octal formatted numbers
\\xnn Hex formatted numbers
\\cX  Control chracters
\\u   Next character uppercase
\\l   Next character lowercase
\\U   Capslock
\\L   All next lowercase
\\Q   Backslash all following non-alphanumeric characters
\\E   End \\U, \\L, \\Q
EOF
print "$var\n";

# Variable Context
@names = ('John Paul', 'Lisa', 'Kumar');

@copy = @names;
$size = @names;

print "Given names are : @copy\n";
print "Number of names are : $size\n";


# String Operations
$str = "hello" . "world";       # Concatenates strings.
$num = 5 + 10;                  # adds two numbers.
$mul = 4 * 5;                   # multiplies two numbers.
$mix = $str . $num;             # concatenates string and number.

print "\nString Operations\n";
print "str = $str\n";
print "num = $num\n";
print "mul = $mul\n";
print "mix = $mix\n";

# V-strings
$smile  = v9786;
$foo    = v102.111.111;
$name = v77.101.104.117.108;

print "smile = $smile\n";
print "foo = $foo\n";
print "name = $name\n";
print "coffee = \x{2615}\n";

# Special Keywords
print "print __FILE__ __LINE__ __PACKAGE__ cannot be interpolated. Use .\n";
print "File name ". __FILE__ . "\n";
print "Line Number " . __LINE__ ."\n";
print "Package " . __PACKAGE__ ."\n";

# Arrays
print "Array Indexing same as python\n";
print "\@array = (1 , 2) \n";
print 'array[0] = "something" #'."is a valid initialization.\n";

$var = <<'EOF';

Array operations
push(@ARRAY, LIST)    #Pushes the values LIST onto the end of @ARRAY
pop(@ARRAY)           #Pops last value of @ARRAY and returns it
shift(@ARRAY)         #Chops off 1st value of @ARRAY
unshift(@ARRAY, LIST) #Prepends LIST to @ARRAY

other useful operations - join, split, qw, sort
EOF
print "$var\n";


$var = <<'EOF';
 
Declaring Hashes - 3 methods
%data = ('John Paul', 45, 'Lisa', 30, 'Kumar', 40);
%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);
%data = (-JohnPaul => 45, -Lisa => 30, -Kumar => 40); #can only be accessed with -

To access
%data{$key};
@keys = keys %data;  # List of all keys
@values = @data{@keys);  # Values for a list of keys
EOF
 print "$var\n";


