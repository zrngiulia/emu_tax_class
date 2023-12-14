# emu_tax_class
Commands to use Emu taxonomic classifier (Curry et al., Nat Methods 2022; https://doi.org/10.1038/s41592-022-01520-4) on preprocessed Nanopore FASTQ reads.

Emu abundance command obtains species-level taxonomic classification for the whole dataset;

Emu collapse command collapses the classification to the desired taxonomical rank (e.g., phylum; class etc.).

## Activate conda environment for emu
conda activate emu-3.0

## Command parameters for emu_abundance
bash abundance.sh /path/to/emu/db/ /output/directory/ /input/directory/is/wd/of/preprocessing/pipeline



