#!/usr/bin/perl -w
###########################################################################
# Author: Wentao Cai <wtaocai@gmail.com>
# Created: 18 Dec 2018
#Usage: perl Get_keyword_fasta.pl keyword your.fa > keyword.fa

use strict;
my $usage = "\nUsage: \n\n perl $0 keyword your.fa > keyword.fa\n\n";
@ARGV == 2 or die $usage;;
my $ids = $ARGV[0];
my $genome = $ARGV[1];
open (my $Inid,$ids) or die "Cannot open $ids.\n$usage";
my %readids;
	while(<$Inid>){
	chomp;
	my @A =split (/\s+/ ,$_);
	$readids{$A[0]} = '';
	}
close ($Inid);
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
if ( exists( $readids{$chr} ) ){
	#$sequence{$chr} =~ s/(.{60})/$1\n/gs;
  print ">".$chr."\n".$sequence{$chr}."\n";
  }
}




