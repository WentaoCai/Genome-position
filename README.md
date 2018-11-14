These scripts were used for dealing with bed, fastq and fasta file.

1. Convert bed to fasta

perl bedtofasta.pl genome.fa your.bed > output.fa


2. Extract fastq file based on read name

perl filter_fastq_by_id.pl id.file fastq.file> output.fastq


3. convert fastq to fasta

perl fastq2fasta.pl input.fastq>output.fa
