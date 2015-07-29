#!/usr/bin/perl -w

use strict;
use warnings;

unless($#ARGV==1){
	print "\n\nUSAGE: perl count_kmer_repetition.pl file.faa K-mer (Ex: ATGCC)\n\n";
	exit;
}

my $in = $ARGV[0];
my $kmer = $ARGV[1];

open(IN, $in);
$/ = "\n>";

while(<IN>){
	s/>//g;
	my($header, @seq) = split(/\n/, $_);
	my $string_seq = join "",@seq;
	my $kmer_number = () = $string_seq =~ /$kmer/g;	
	print "\n";
	print $header,"\n";
	print "The number of times the given kmer found is: $kmer_number\n\n";

}
