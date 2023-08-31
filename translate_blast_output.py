#! /Users/r_klabacka/anaconda3/bin/python

from Bio.Seq import Seq
import sys

def get_reading_frames(blast_line):
    seq_hit_original = blast_line.split("\t")[4]
    seq_hit = seq_hit_original.replace("-","").strip()
    print("Seq hit:",seq_hit)
    seq1 = seq_hit
    seq1 = addN(seq1)
    print("seq1",seq1)
    seq2 = seq_hit[1:]
    seq2 = addN(seq2)
    print("seq2",seq2)
    seq3 = seq_hit[3:]
    seq3 = addN(seq3)
    print("seq3",seq3,"\n")
    seq_list = [seq1, seq2, seq3]
    return str(seq_list)

def addN(sequence):
    N_to_add = len(sequence) % 3
    sequence = sequence + 'N' * N_to_add
    return sequence

def write_seqs_to_file(name, sequence, index, outfile):
    outfile.write(">" + name + str(index) + "\n") 
    outfile.write(str(Seq(sequence).translate()))

if __name__ == "__main__":
    with open(sys.argv[1], "r") as infile:
        with open(sys.argv[2], "w") as outfile:
            for line in infile:
                name = line.split("\t")[0]
                print(name)
                seq_list = get_reading_frames(line)
                seq_list


