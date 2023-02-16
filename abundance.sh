#!/bin/bash

# folder containing emu database
db=$1
# output directory
outdir=$2
# input directory (working directory from preprocessing pipeline)
indir=$3/length_filtered/


for i in $(ls ${indir} | grep barcode); do
  emu abundance --type map-ont --db ${db} \
  --keep-counts --keep-files --keep-read-assignments --output-unclassified --threads 10 \
  --output-dir ${outdir} ${indir}/${i}
done
