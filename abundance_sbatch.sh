#!/bin/bash
#SBATCH --account giuz
#SBATCH --time 36:00:00
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


# create folders to move all file types in separate folders
mkdir ${outdir}/emu_alignments
mkdir ${outdir}/read_assignments_distribution
mkdir ${outdir}/rel_abundance
mkdir ${outdir}/unclassified

# move all file types in separate folders
mv ${outdir}/*emu_alignments.sam ${outdir}/emu_alignments
mv ${outdir}/*read-assignment-distributions.tsv ${outdir}/read_assignments_distribution
mv ${outdir}/*rel-abundance.tsv ${outdir}/rel_abundance
mv ${outdir}/*unclassified.fq ${outdir}/unclassified

# collapse taxonomy to Accepted ranks: 'species', 'genus', 'family', 'order', 'class', 'phylum', 'clade', 'superkingdom'

#species
for i in $(ls ${outdir}/rel_abundance | grep barcode); do
  emu collapse-taxonomy ${outdir}/rel_abundance/${i} species
done

#genus
for i in $(ls ${outdir}/rel_abundance | grep barcode); do
  emu collapse-taxonomy ${outdir}/rel_abundance/${i} genus
done

#family
for i in $(ls ${outdir}/rel_abundance | grep barcode); do
  emu collapse-taxonomy ${outdir}/rel_abundance/${i} family
done

#order
for i in $(ls ${outdir}/rel_abundance | grep barcode); do
  emu collapse-taxonomy ${outdir}/rel_abundance/${i} order
done

#class
for i in $(ls ${outdir}/rel_abundance | grep barcode); do
  emu collapse-taxonomy ${outdir}/rel_abundance/${i} class
done

#phylum
for i in $(ls ${outdir}/rel_abundance | grep barcode); do
  emu collapse-taxonomy ${outdir}/rel_abundance/${i} phylum
done

#clade
for i in $(ls ${outdir}/rel_abundance | grep barcode); do
  emu collapse-taxonomy ${outdir}/rel_abundance/${i} clade
done

#superkingdom
for i in $(ls ${outdir}/rel_abundance | grep barcode); do
  emu collapse-taxonomy ${outdir}/rel_abundance/${i} superkingdom
done
