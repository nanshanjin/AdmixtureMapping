#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o relatedness-stdout-%j.txt
#SBATCH -e relatedness-stderr-%j.txt
#SBATCH -J relatedness


cd ~/admixture_mapping/analysis/gwas/

#for i in af.bc af bc cb ac N_S.remove; do

for i in cb; do

~/bin/gemma -g ~/admixture_mapping/variants/gwas/${i}.bimbam.geno \
-gk 1 -p ~/admixture_mapping/phenotypes/pchl_mass_${i}.pheno -o ${i}


done

for i in cb.all; do

~/bin/gemma -g ~/admixture_mapping/variants/gwas/${i}.bimbam.geno \
-gk 1 -p ~/admixture_mapping/phenotypes/mo2_mass_cb.pheno -o ${i}

done


