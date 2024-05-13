# emu_tax_class
Commands to use Emu taxonomic classifier (Curry et al., Nat Methods 2022; https://doi.org/10.1038/s41592-022-01520-4) on preprocessed Nanopore FASTQ reads.
https://gitlab.com/treangenlab/emu

Emu abundance command obtains species-level taxonomic classification for the whole dataset;

Emu collapse command collapses the classification to the desired taxonomical rank ('species', 'genus', 'family', 'order', 'class', 'phylum', 'clade', 'superkingdom').

## Activate conda environment for emu
```
conda activate full/path/to/emu-3.0
```

## Command parameters for emu_abundance
```
bash abundance.sh /path/to/emu/db/ /output/directory/ /input/directory/is/wd/of/preprocessing/pipeline
```

## Command parameters for abundance_sbatch

Note: the sbatch command incorporates both abundance and collapsing to all ranks of the emu default database.

```
sbatch abundance_sbatch.sh /path/to/emu/db/ /output/directory/ /input/directory/is/wd/of/preprocessing/pipeline
```
