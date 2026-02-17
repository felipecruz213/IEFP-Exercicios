import sys

if len(sys.argv) != 2:
    print("Utilização: python3", sys.argv[0], "FICH", file=sys.stderr)
    sys.exit(2)

fich =  open(sys.argv[1], 'r')

for linha in fich:
    print(linha, end='')
fich.close()