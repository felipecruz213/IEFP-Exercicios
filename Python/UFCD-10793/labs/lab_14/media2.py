import sys

if len(sys.argv) < 3:
    print ("Utilização: python3", __file__, "num1 num2 [num3 ... numN]", file=sys.stderr)
    sys.exit(3)

nums = []
i = 1
for num_txt in sys.argv[1:]:
    nums.append(float(num_txt))
print("Numeros lidos com sucesso!")

soma = 0
i = 0
for num in nums:
    soma += num

print(f"Soma: {soma}")
print(f"Media: {soma/len(nums)}")