#download the genomes
cd /scratch/general/nfs1/utu_4310/fr10_evolution_wd
bash get_refs.sh -d ref_list_genbank.txt -l refs

#make blast db for each genome
cd /scratch/general/nfs1/utu_4310/fr10_evolution_wd/blast_db
for genome in /scratch/general/nfs1/utu_4310/fr10_evolution_wd/refs; do makeblastdb -in $genome -dbtype nucl -out $genome.db
done

#blast each genome for fr10
cd /scratch/general/nfs1/utu_4310/fr10_evolution_wd/blast_outputs
for db in /scratch/general/nfs1/utu_4310/fr10_evolution_wd/blast_db; do blastn -query fr10.fasta -db $db -evalue 0.001 -outfmt 6 -out $db.results.txt
done
