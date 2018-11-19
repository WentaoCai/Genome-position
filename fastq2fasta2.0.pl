#!/usr/bin/perl -w
use strict;
use File::Basename;
my $usage = "Usage: \n\n perl $0 fastqfile > output.fa\n\nSupport suffix with\:\n\.fq\.gz\n\.fastq\.gz\n\.fq\n\.fastq\n\nWritten by Wentao Cai\n\nEmail\:  wtaocai\@gmail.com\n\n";
my $fastq_file = $ARGV[0] or die $usage;
my ($name,$path,$suffix) = fileparse("$fastq_file",qr"\..[^.]*$");
my $input_fq="";
#print "$suffix\n";
if($suffix eq ".gz"){
$input_fq="zcat $fastq_file |";
}
else{
$input_fq= $fastq_file;
}
open (my $InFastFile,$input_fq) or die "Cannot open $fastq_file\nCheck your fastq file\n$usage";

while (<$InFastFile>)
{
    # retrieve the 4 lines of each read
    my $IDLine = $_;
    my $SeqLine = <$InFastFile>;
    my $BlankLine = <$InFastFile>;
    my $BQLine = <$InFastFile>;
    
    my $ID = "";
    chomp ($IDLine);
    chomp ($SeqLine);

    # delete the prefix "@" of the ID line
   if ($IDLine =~ /^\@/) 
   {
	$IDLine =~ s/\@//;
	print ">$IDLine\n$SeqLine\n";
   }
}
close($InFastFile)