"""
Investigue o módulo random e acrescente
possibilidade de o número mágico ser um número (pseudo)
aleatório entre 1 e 20.
"""

import random

def gerarNumeroAleatorio():
    random.seed() # inicializa a seed conforme a hora atual do sistema
    numero_gerado = random.randint(1, 20)
    return numero_gerado

def main():
    numEscolha = int(input("Escolha um numero inteiro de 1 a 20: "))
    numCorreto = gerarNumeroAleatorio()
    if numEscolha == numCorreto:
        print("ACERTOU!!!!")
    else:
        print(f"ERROOU!!, O numero correto era {numCorreto}")

main()