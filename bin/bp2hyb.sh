#!/bin/bash

sort -k1,1n | awk -v nm="RNA" 'BEGIN{OFS="\t"}{print NR,".",$3,nm,".",".",$1,$1,".",nm,".",".",$2,$2,"."}' | combine_hyb_merge_touching.pl | awk 'BEGIN{OFS="\t"}{$3=$3*(1+$8-$7);print $0}' | sort -k3,3nr
