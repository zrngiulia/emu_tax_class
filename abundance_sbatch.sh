#!/bin/bash
#SBATCH --account giuz
#SBATCH --time 24:00:00
#SBATCH -c 4
#SBATCH --mem 64g

source /home/giuz/.bashrc
conda activate emu-3.0

# folder containing emu database
db=$1
# output directory
outdir=$2
# input directory (working directory from preprocessing pipeline)
indir=$3/length_filtered/


# run emu abundance for each barcode group of reads in the "length_filtered" folder
for i in $(ls ${indir} | grep barcode); do
  emu abundance --type map-ont --db ${db} \
  --keep-counts --keep-files --keep-read-assignments --output-unclassified --threads 10 \
  --output-dir ${outdir} ${indir}/${i}
done
