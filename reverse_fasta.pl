#!/usr/bin/perl
use strict;
my $usage = "Usage: \n\n perl $0 -i [fastafile] -p [0 or 1]> output.fa\n\nParameters\:\n-i: Input fasta file;\n-p: Chosen results, 0 for reverse fasta, 1 for reverse and complementary fasta\n\nWritten by Wentao Cai\n\nEmail\:  wtaocai\@gmail.com\n\n";
my $fastq_file = $ARGV[0];
my $parameter = $ARGV[1];
foreach my $i (0 ..scalar(@ARGV)-1) {
  if($ARGV[$i] eq '-i') {
    $fastq_file = $ARGV[++$i];
  }elsif($ARGV[$i] eq '-p') {
    $parameter = $ARGV[++$i];
  }
}
if(@ARGV ==0) {
    die $usage;
}
open (my $InFastFile,$fastq_file);
while (<$InFastFile>)
{
 my $IDLine = $_;
   my $SeqLine = <$InFastFile>;
     chomp ($IDLine);
    chomp ($SeqLine);
        my $rev = reverse($SeqLine);
		if($parameter ==0)
		{
		print ">$IDLine\n$rev\n";
		}
		elsif($parameter ==1) 
		{
		$rev =~ tr/ACGTacgt/TGCAtgca/;
		print ">$IDLine\n$rev\n";
		}
		else{
		print "Error for -p, please choose 0 or 1!\n";
		exit;
		}
		}	
			
close($InFastFile);