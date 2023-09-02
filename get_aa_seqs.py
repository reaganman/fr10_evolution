import sys

def get_seqs(filename):
    with open(filename, "r") as file:
        lines = file.readlines()
        for line in lines:
            line = line.strip().replace("\t","").split(",")
            seq = ">"+line[0]+"\n"+line[-1]
            print(seq)

if __name__ == "__main__":
    file_in = sys.argv[1]
    get_seqs(file_in)

