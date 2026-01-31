"""
Estenda o programa anterior de modo a aceitar múltiplos valores introduzidos na linha de comandos
"""


import sys


def checar_numero(numero):
    return numero.isdigit



def e_primo(numero):
    return float(numero) > 0 and numero.isdecimal()


def main():
    for i in sys.argv:
        if not i == sys.argv[0]:
            if checar_numero(i):
                if e_primo(i):
                    print(f"{i} é primo")
                else:
                    print(f"{i} não é primo")


main()