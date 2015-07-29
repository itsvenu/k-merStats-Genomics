#!/usr/bin/perl -w

use strict;
use warnings;

unless($#ARGV==1){
	print "\n\nUSAGE: perl position_of_kmer.pl file.faa kmer (Ex: ATGGC)\n\n";
	exit;
}

my $in = $ARGV[0];
my $kmer = $ARGV[1];
my $kmer_length = length($kmer);
my $sequence;
open(IN, $in);
$/ = "\n>";
while(<IN>){
	s/>//g;
	my($header, @seq) = split(/\n/, $_);
	$sequence = join "",@seq;
	print "Sequence ID - $header\n";
	print "K-mer - $kmer\n";

}
print "K-mer positions on sequence\n";
while($sequence =~ /$kmer/g){
	my $position = pos($sequence);
	#print "K-mer positions on sequence\n";
	print $position-$kmer_length;
	print "  "
}

print "\n\n";
print "\(If nothing is printed after \"k-mer positions on sequence\" means k-mer is not found in sequence\)\n";
