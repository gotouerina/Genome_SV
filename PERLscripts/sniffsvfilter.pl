#! /usr/bin/perl
use strict;
use warnings;

my $input = shift;
my $output = shift;

open I, "<$input" or die "perl $0 input output > lengthfile";
open O, "> $output" or die "perl $0 input output > lengthfile";

while (<I>)
{
	if (/^#/)
	{
		print O $_;
	}
	
	else
	{
		chomp;
		my @line = split(/\t/);
		my $all = join ",",@line;
		$line[7] =~ m/SVLEN=(.*?);/;
		my $size = $1;
		my $abs_size = abs($size);
		$line[7] =~ m/SVTYPE=(.*?);/;
	        my $type = $1;
		$line[7] =~ m/END=(.*?);/;
		my $end = $1;	
		if( $all =~ m/PASS/ )
		{
			if ($abs_size == 0)
			{
				if (/BND|TRA/)
				{
					print O "$_\n";
					print "$line[0]\t$line[1]\t$type\t$abs_size\n";
				}
			}
			else
			{
			if ( $abs_size >=  50 )
			{
				print O "$_\n";
				print "$line[0]\t$line[1]\t$end\t$type\t$abs_size\n";
			}
			}
		}		
	}
}


close I;
close O;
