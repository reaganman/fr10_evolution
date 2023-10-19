# fr10_evolution
Exploring the evolution and function of fr10 across organisms

# Research Question:
How and from where has fr10 evolved

# Hypotheses
* Searching avalaible frog genomes will show where orthologs of fr10 are present in the frog tree of life. Comparing these orthologs in the context of their phylogenetic position and geographic distibution will give insight to the evolution and function of fr10

* Searching avalable genomes will show that orthologs of fr10 are only found within certain branches of the frog TOL

# Scripts/Methods

* Script for downloading genomes - `get_refs.sh`
  * these genomes will be searched for sequences similar to fr10  

* Various BLAST scripts - for searching genomes with tools like blastn and blastx - `blast_scripts.sh`
  * BLAST hits will indicate the presence of paralogs and orthologs within genomes searched 

* Scripts to process blast results, creating fasta files with hit and query - `process_blast.sh`
  * this allows each hit to be individually aligned with the query to better visualize evolution  

* Method to pull hit sequences from genome file - `pull_seq.py`
  * aligning the hit regions will show conservance beyond fr10 which may indicate the presence of isoform or paralogs 
