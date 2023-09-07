import sys

def get_seqs(file_in, file_out):
    with open(file_in, "r") as file:
        lines = file.readlines()
        seqs = []
        for line in lines:
            line = line.strip().replace("\t","").split(",")
            seq = ">"+"_".join(line[:-1])+"\n"+line[-1]+"\n"
            seq = seq.strip()
            print(seq)
            seqs.append(seq)
    with open(file_out, "w") as out:
        for i in seqs:
            out.write(i)

if __name__ == "__main__":
    file_in = sys.argv[1]
    file_out = sys.argv[2]
    get_seqs(file_in, file_out)

