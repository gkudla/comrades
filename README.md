# comrades

A program for folding RNA using constraints from proximity ligation experiments.

## Background

RNA proximity ligation methods such as CLASH, HiC, PARIS, SPLASH, and COMRADES generate chimeric reads that represent RNA-RNA interactions.

Comrades inputs a set of mapped chimeric reads (produced by hyb, https://github.com/gkudla/hyb), and outputs a ranked list of predicted basepairs. It then combines these basepairs into short structural elements, ranks the elements by number of supporting chimeric reads, and uses the ranked elements as constraints for RNA folding. The output is an RNA structure or set of structures in UNAFold .ct format or vienna dot-bracket format.

### Prerequisites

UNAFold http://unafold.rna.albany.edu/?q=DINAMelt/software

Perl version 5

### Installation

```
# download package:
wget https://github.com/gkudla/comrades/archive/master.zip
unzip master.zip
mv comrades-master/ comrades

# or clone using git:
git clone https://github.com/gkudla/comrades.git
```

Add installation location to your PATH:

```
export PATH=comrades/bin:$PATH
```

## Running the scripts

generate folding constraints

```
comradesMakeConstraints -i testData.hyb -f Zika.fasta -b 3324 -e 4521
```

fold RNA using constraints

```
comradesFold -c testData.3324-4521_folding_constraints.txt -i Zika_3324-4521.fasta
```

fold RNA 1,000 times (requires computer cluster running qsub)

```
qsub comradesFold -c testData.3324-4521_folding_constraints.txt -i Zika_3324-4521.fasta -s 1
```


## Authors

* **Grzegorz Kudla, Marta Gabryelska 2017-2018** 

## License

This project is licensed under the GNU General Public License v3 - see the [LICENSE.md](LICENSE.md) file for details
