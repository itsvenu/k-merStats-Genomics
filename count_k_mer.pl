#!/usr/bin/perl -w

use strict;
use warnings;

unless($#ARGV==1){
	print "\n\nUSAGE: perl count_k_mer.pl file.faa size_of_kmer\n\n";
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
	
	my $number_of_kmers = ($seq_length) - ($kmer_size) + 1;

	for(my $i=0; $i <= $seq_length; $i++){
		my $k_mer = substr($string_seq, $i, $kmer_size);
		if(length($k_mer)==$kmer_size){
			print $k_mer;
			print "\n";
		}

	}	

}
