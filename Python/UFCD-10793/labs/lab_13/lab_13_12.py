"""
Investigue o módulo random e acrescente
possibilidade de o número mágico ser um número (pseudo)
aleatório entre 1 e 20.
"""


import random

def gerar_numero_aleatorio():
    random.seed() # inicializa a seed conforme a hora atual do sistema
    numero_gerado = random.randint(1, 20)
    return numero_gerado

def main():
    numero_escolha = int(input("Escolha um numero inteiro de 1 a 20: "))
    numero_correto = gerar_numero_aleatorio()
    if numero_escolha == numero_correto:
        print("ACERTOU!!!!")
    else:
        print(f"ERROOU!!, O numero correto era {numero_correto}")

main()