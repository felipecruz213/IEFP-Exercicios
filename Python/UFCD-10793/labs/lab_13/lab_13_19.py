"""
Agora faça um programa que utiliza parte do anterior e devolve todos os números primos até ao
número introduzido pelo utilizador na linha de comandos.
"""


import sys


def checar_numero(numero):
    return numero.isdigit



def e_primo(numero):
    return numero > 0


def main():
    if len(sys.argv) < 2:
        print("Insira um argumento !!!!!!!")
    else:
        if len(sys.argv) > 2 or not sys.argv[1].isnumeric():
            print("Argumento invalido!")
        else:
            i = 0
            while i < int(sys.argv[1]) + 1:
                if e_primo(i):
                    print(i)
                i = i + 1



main()