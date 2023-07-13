##Need to download fr10/scratch/general/nfs1/utu_4310/fr10_evolution_wd/reference_genome.fasta
##Need to make a directory for all the dbs

#download the genomes
module load blast/2.11.0
cd ~/fr10_evolution
bash /uufs/chpc.utah.edu/common/home/u6052680/fr10_evolution/get_refs.sh -d /scratch/general/nfs1/utu_4310/fr10_evolution_wd/reference_genomes -l ref_list_genbank.txt 

#make blast db for each genome
cd /scratch/general/nfs1/utu_4310/fr10_evolution_wd/blast_db
for genome in /uufs/chpc.utah.edu/common/home/u6052680/fr10_evolution/refs; do makeblastdb -in $genome -dbtype nucl -out $genome.db
done

#blast each genome for fr10
cd /scratch/general/nfs1/utu_4310/fr10_evolution_wd/blast_outputs
for db in /scratch/general/nfs1/utu_4310/fr10_evolution_wd/blast_db; do blastn -query fr10.fasta -db $db -evalue 0.001 -outfmt 6 -out $db.results.txt
done
