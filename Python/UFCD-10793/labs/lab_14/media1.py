import sys

if len(sys.argv) < 3:
    print ("Utilização: python3", __file__, "num1 num2 [num3 ... numN]", file=sys.stderr)
    sys.exit(3)

nums = []
i = 1
while i < len(sys.argv):
    # Acrescenta o float na i-ésima posição de argv
    nums.append((float(sys.argv[i])))
    i += 1

print("Numeros lidos com sucesso!")

soma = 0
i = 0
while i < len(nums):
    soma += nums[i]
    i += 1

print(f"Soma: {soma}")
print(f"Media: {soma/len(nums)}")