use strict;
use feature qw(say);
@ARGV == 2 or die "Usage: \n\n perl $0 genome.fa your.bed > outputfile\n";
my $genome = $ARGV[0];
my $bedfile = $ARGV[1];
#my $count=0;
my %genome_hash = ();
my $name = "";
my $seq = "";
my $sequence;
open (my $Ref,$genome);


while (<$Ref>) 
{
    chomp;
    
    if (m/>(\S+)/) 
    {
	$genome_hash{$name} = $seq if ($name ne "");
	$name = $1;
	$seq = "";
    }
    else 
    {
	$seq .= $_;
    }
}
$genome_hash{$name} = $seq if ($name ne "");

close ($Ref);

open (my $bedin, $bedfile);


while (<$bedin>)
{
    chomp;
    my $line = $_;
    
    my @Fields = split;

   # $count ++;
	print ">"."@Fields[3]\n";
	$sequence = uc (substr($genome_hash{$Fields[0]},$Fields[1]-1,$Fields[2]-$Fields[1]+1));
	print "$sequence\n";
	}
 close($bedin);
 #say $count"sequence finished!!!"
