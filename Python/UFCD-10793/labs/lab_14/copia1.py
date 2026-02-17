import sys
if not 1 <= len(sys.argv) <= 3:
    print("Utilização: python3", sys.argv[0], "[FICH] | [FICH1 FICH2]")
    sys.exit(2)

if len(sys.argv) >= 2:
    fich1 = open(sys.argv[1], 'r')
else:
    fich1 = sys.stdin

if len(sys.argv) == 3:
    fich2 = open(sys.argv[2], 'w')
else:
    fich2 = sys.stdout

for line in fich1:
    fich2.write(line)

fich1.close()
fich2.close()