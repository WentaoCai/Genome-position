#!/usr/bin/perl -w
###########################################################################
# Author: Wentao Cai <wtaocai@gmail.com>
# Created: 15 Nov 2018
#Usage: perl Get_fasta_length.pl genome.fa > genome.length.txt

use strict;
my $usage = "Usage: \n\n perl $0 genome.fa > genome.length.txt\n\n";
@ARGV == 1 or die $usage;;
my $genome = $ARGV[0];
open (my $InRef,$genome) or die "Cannot open $genome.\n$usage";
my %sequence;
my $seq;
my $name;
while (<$InRef>){
	chomp;
    if (m/>(\S+)/) # header line
    {
	$name = $1;
	$sequence{$name} = 0;
    }
    else 
    {
	$sequence{$name} += length($_);
    }
}
close ($InRef);
foreach my $chr  (sort keys %sequence){
  print $chr."\t".$sequence{$chr}."\n";
}




