##Need to download fr10.fasta
##Need to make a directory for all the dbs

#download the genomes 
bash get_refs.sh -d ref_list_genbank.txt -l refs

#make blast db for each genome
## move to scratch directory for databases
for genome in refs; do makeblastdb -in $genome -dbtype nucl -out $genome.db
done

#blast each genome for fr10
## move to scratch directory for blast outputs
for db in dbs; do blastn -query fr10.fasta -db $db -evalue 0.001 -outfmt 6 -out $db.results.txt
done
