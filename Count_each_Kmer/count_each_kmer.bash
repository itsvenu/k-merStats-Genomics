#!/bin/bash

for f in *.fasta

do

perl count_k_mer.pl $f 7 | awk '{h[$1]++};END{for(k in h)print k,h[k]}' | sort -r -n -k2 > kmer_count_result.txt

done
