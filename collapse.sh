#!/bin/bash

#output dir emu abundance.sh
indir=$1
# collapse taxonomy to Accepted ranks: 'species', 'genus', 'family', 'order', 'class', 'phylum', 'clade', 'superkingdom'
rank=$2


for i in $(ls ${indir} | grep barcode); do
  emu collapse-taxonomy ${indir}/${i} ${rank}
done
