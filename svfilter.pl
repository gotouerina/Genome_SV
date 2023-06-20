#! /usr/bin/perl
use strict;
use warnings;
## input are from output of grep.pl
my $min = 50; ##define of sv
my $max = 1000000; ##1mb can be modified
my $input = shift;
my $output = shift;

open I ,"<$input" or die "perl $0 input output";
open O ,">$output" or die "perl $0 input output";

while (<I>) 
{
	my @line = split (/\t/);
	my $start = $line[1];
	$line[3] =~ /\bEND=(\w+?)\b/;
	
	my $end = $1;
	my $length = $end - $start; 
	if ( $length <= $max && $length >= $min)
	{
	print O "$_";
	}
}
