#! /usr/bin/perl -w
## 从volcanno注释的文件中提取跨越基因的sv信息
use warnings;
use strict;
my $file = shift;
my $output = shift;
my $gff = shift;
open I,"<$file" or die "Usage :: perl $0 vcfinput output gff";
open O,">$output" or die "Usage :: perl $0 vcfinput output gff";
open G,"<$gff" or die "Usage :: perl $0 vcfinput output gff";
my %data;
while(<G>)
{
	if(/\tgene\t/)
	{
	my @line = split(/\t/);
	my ($chr,$source,$type,$start,$end,$score,$strand,$phase,$attributes) = @line;
	$attributes =~ m/ID=(.*);Name=(.*);NameSource/;
	my $id = $1;
	my $name = $2;
	$data{$id} = $name;
	}

}
print STDERR "$gff loaded..\n";

while(<I>)

{
	unless(/^#/){
	my($chr,$pos,$id,$ref,$alt,$qual,$flt,$info,$format,$sample) = split(/\t/);
	my @array =  split(/;/,$info);
	if(/\bGenes=(\w+)/)
	{
	$array[1] =~ s/END=//g;
	$info =~ m/Genes=(.*);?/;
	my $id = $1;
	if($data{$id} ne "" && $data{$id} ne "Unknown")
		{
		print O "$chr\t$pos\t$array[1]\t$array[0]\t$data{$id}\n";
		}
	else
		{
		print O "$chr\t$pos\t$array[1]\t$array[0]\t$id\n";
		}
}
}
}
close I;
close G;
