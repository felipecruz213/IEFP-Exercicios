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

IVA = dec(0.23)
TAXA_EMPREGADO = dec(0.10)
PRECO_MENU = dec(15.00)

num_pessoas = int(input("Quantidade de Pessoas: "))
total_conta_sem_taxas = 0
total_conta = 0
total_iva = 0
total_iva_taxa_empregado = 0

for x in range(num_pessoas):
    total_conta_sem_taxas += PRECO_MENU
    total_iva_taxa_empregado += PRECO_MENU * TAXA_EMPREGADO
    total_iva += PRECO_MENU * IVA
    total_conta += PRECO_MENU + (PRECO_MENU * IVA) + (PRECO_MENU * TAXA_EMPREGADO)


print(f"\n\n", "-" * 10, " TOTAL ", "-" * 10)

print(f"Total sem taxas: {total_conta_sem_taxas}")
print(f"IVA: {total_iva}")
print(f"Taxa Empregado: {total_iva_taxa_empregado}")
print(f"Valor Total: {total_conta}")