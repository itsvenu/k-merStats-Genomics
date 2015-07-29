#!/usr/bin/perl -w

# possible k-mers of the given sequence
# user can provide k-mer length

use strict;
use warnings;

unless($#ARGV==1){
	print "\n\nUSAGE: perl all_kmers.pl file.faa size_of_kmer (Ex: 5)\n\n";
	exit;
}


my $in = $ARGV[0];
my $kmer_size = $ARGV[1];

open(IN, $in);
$/ = "\n>";
my @kmers;

while(<IN>){
	s/>//g;
	my($header, @seq) = split(/\n/, $_);
	my $string_seq = join "",@seq;
	my $seq_length = length($string_seq);
	
	print "\n\n$header\n\n";

	print "\n\nLength of given sequence is - $seq_length\n\n";

	# Number of possible K-mers

	my $number_of_kmers = ($seq_length) - ($kmer_size) + 1;
	print "Total number of possible $kmer_size-mers for given sequence - $number_of_kmers\n\n";

	#printing all the k-mers

	print "All the possible K-mers are:\n\n";

	for(my $i=0; $i <= $seq_length; $i++){
		my $k_mer = substr($string_seq, $i, $kmer_size);
		if(length($k_mer)==$kmer_size){
			print $k_mer;
			print "  ";
		}

	}	

}
