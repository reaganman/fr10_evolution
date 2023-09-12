genomes=/uufs/chpc.utah.edu/common/home/u6052680/fr10_evolution/hits
primers=/uufs/chpc.utah.edu/common/home/u6052680/fr10_evolution/primers.fna
while IFS= read -r line; do
  # Perform actions on each line here
  blastn -query  /uufs/chpc.utah.edu/common/home/u6052680/fr10_evolution/primers.fna -db "/scratch/general/nfs1/utu_4310/fr10_evolution_wd/fnas_dbs/$line.db" -evalue 0.001 -outfmt "6 stitle qtitle qseqid sseqid evalue sstart send sseq length pident mismatch frames" -out "$line.primer.results.txt"
done < "$file_path"
