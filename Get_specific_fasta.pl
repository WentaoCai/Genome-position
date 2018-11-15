#!/usr/bin/perl -w
###########################################################################
# Author: Wentao Cai <wtaocai@gmail.com>
# Created: 15 Nov 2018
#Usage: perl Get_specific_fasta.pl idname your.fa > id.fa

use strict;
my $usage = "Usage: \n\n perl $0 idname your.fa > yourid.fa\n\n";
@ARGV == 2 or die $usage;;
my $id = $ARGV[0];
my $genome = $ARGV[1];

open (my $InRef,$genome) or die "Cannot open $genome.\n$usage";
my %sequence;
my $seq;
my $name;
while (<$InRef>){
	chomp;
    if (m/>(\S+)/) # header line
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
if($chr eq $id){
	$sequence{$chr} =~ s/(.{60})/$1\n/gs;
  print ">".$chr."\n".$sequence{$chr}."\n";
  }
}




