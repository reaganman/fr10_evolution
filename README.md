# fr10_evolution
Exploring the evolution and function of fr10 across organisms

# Research Question:
How and from where has fr10 evolved

# Hypotheses
Searching avalaible frog genomes will show where orthologs of fr10 are present in the frog tree of life
Comparing these orthologs in the context of their phylogenetic position and geographic distibution will give insight to the evolution and function of fr10

Searching avalable genomes will show that orthologs of fr10 are only found within certain clades of the frog TOL

# Scripts/Methods

* get_refs - script for downloading genomes

* various BLAST scripts - for searching genomes with tools like blastn and blastx - `blast_scripts.sh`

* scripts to process blast results, creating fasta files with hit and query sequence to align - `process_blast.sh`

* method to pull hit sequences from genome file - `pull_seq.py`
