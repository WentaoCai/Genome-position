#!/usr/bin/perl -w
###########################################################################
# Author: Wentao Cai <wtaocai@gmail.com>
# Created: 18 Dec 2018
#Usage: perl Get_keyword_fasta.pl keyword your.fa > keyword.fa

use strict;
my $usage = "\nUsage: \n\n perl $0 keyword your.fa > keyword.fa\n\n";
@ARGV == 2 or die $usage;;
my $words = $ARGV[0];
my $genome = $ARGV[1];

open (my $InRef,$genome) or die "Cannot open $genome.\n$usage";
my %sequence;
my $seq;
my $name;
while (<$InRef>){
	chomp;
    if (m/>(.*)/) # header line
    {
	$name = $1;
	$sequence{$name} = "";
    }
    else 
    {
	$sequence{$name} .= $_;
    }
}
close ($InRef);
foreach my $chr  (keys %sequence){
if($chr =~/$words/o ){
	#$sequence{$chr} =~ s/(.{60})/$1\n/gs;
  print ">".$chr."\n".$sequence{$chr}."\n";
  }
}




