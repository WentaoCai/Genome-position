#!/usr/bin/perl
use strict;
use feature qw(say);
@ARGV == 2 or die "Usage: \n\n perl $0 id.file fastq.file > outputfile\n";
#my $samfile = $ARGV[0];
#my $fastq_file = $ARGV[1];
my %readids;
	open (T1,"$ARGV[0]");
	while(<T1>){
	chomp;
	@A =split (/\s+/ ,$_);
	$readids{$A[0]} = '';
	}
open (my $fastqfile, "$ARGV[1]");
while (<$fastqfile>)
{
chomp();
my $name=$_;
my @B= split(/\s+/,$_);
my $line = $B[0];
		#my $line = $_;
	if ( $line =~ /^@/ ) {
		$line =~ s/^@//;
		#my $output = *STDOUT;
		if ( exists( $readids{$line} ) ) {
		print "$name\n";
		$line = <$fastqfile>;
		print $line;
		$line = <$fastqfile>;
		print $line;
		$line = <$fastqfile>;
		print $line;
	}
}
}