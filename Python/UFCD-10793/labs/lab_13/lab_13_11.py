"""
11. Vamos fazer um programa de adivinha.
 Este programa começa por solicitar
  um número ao utilizador e,
  caso este número seja igual a um número
  pré-defnido (o número mágico),
  o programa felicita o
  utlizador por ter acertado.
 Caso contrário, indica que o utilizador falhou.

"""

import random

def main():
    numCorreto = 13
    numEscolha = int(input("Escolha um numero inteiro: "))
    if numEscolha == numCorreto:
        print("ACERTOU!!!!")
    else:
        print("ERROOU!!")

main()