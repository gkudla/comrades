# comrades
A program for folding RNA using constraints from proximity ligation experiments

# generate folding constraints
comradesMakeConstraints -i testData.hyb -f Zika.fasta -b 3324 -e 4521

# fold RNA using constraints
comradesFold -c testData.3324-4521_folding_constraints.txt -i Zika_3324-4521.fasta

# fold RNA 1,000 times
qsub comradesFold -c testData.3324-4521_folding_constraints.txt -i Zika_3324-4521.fasta -s 1


# write script names and descripton of what they do
# main scripts
# accessory scripts
# hybrid-min
# perl version

