"""
    Um grupo de pessoas participou num jantar em que todos
        encomendaram o menu turístico e pretende fazer 
    um programa para calcular a conta. 
    Para tal, o programa deve começar por ler o número de pessoas 
        envolvidas no jantar e, de seguida, calcular o valor da conta.
    O menu custa 15,00 € + IVA por pessoa. 
    Assuma que o IVA é 23%  e a gorjeta para o empregado 
        é de 10% sobre o montante total com IVA.
    O programa deve exibir a despesa total sem IVA e sem gorjeta,
        o montante de IVA, o valor da gorjeta e a despesa total final.
"""
from decimal import Decimal as dec
import sys



IVA = dec(0.23)
TAXAEMPREGADO = dec(0.10)
PRECOMENU = dec(15.00)

numPessoas = int(sys.argv[1])
totalContaSemTaxas = 0
totalConta = 0
totalIVA = 0
totalTaxaEmpregado = 0

for x in range(numPessoas):
    totalContaSemTaxas += PRECOMENU
    totalTaxaEmpregado += PRECOMENU * TAXAEMPREGADO
    totalIVA += PRECOMENU * IVA
    totalConta += PRECOMENU + (PRECOMENU * IVA) + (PRECOMENU * TAXAEMPREGADO)


print(f"\n\n", "-" * 10, " TOTAL ", "-" * 10)

print(f"Total sem taxas: {totalContaSemTaxas}")
print(f"IVA: {totalIVA}")
print(f"Taxa Empregado: {totalTaxaEmpregado}")
print(f"Valor Total: {totalConta}")