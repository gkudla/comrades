# comrades

A program for folding RNA using constraints from proximity ligation experiments.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

UNAFold http://unafold.rna.albany.edu/?q=DINAMelt/software

hyb https://github.com/gkudla/hyb

perl version 5 (might work with other versions too)

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

fold RNA 1,000 times

```
qsub comradesFold -c testData.3324-4521_folding_constraints.txt -i Zika_3324-4521.fasta -s 1
```


## Authors

* **Grzegorz Kudla, Marta Gabryelska** 

## License

This project is licensed under the GNU General Public License v3 - see the [LICENSE.md](LICENSE.md) file for details
