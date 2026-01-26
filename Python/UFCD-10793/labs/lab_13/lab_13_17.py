"""
Desenvolva um programa para indicar se um número é primo. Um número N é primo se for um número
natural maior do que um.
O número deve ser introduzido através da linha de comandos (utilizar sys.argv). O programa deve
aceitar um e um só argumento. Uma quantidade de argumentos da linha de comandos diferente de um
deve levar ao fm imediato do programa com uma mensagem de erro apropriada. O mesmo deve
suceder caso o argumento introduzido não seja um número inteiro > 1 (pode utilizar o método
str.isdigit para verifcar se uma string pode ser convertida para int antes de tentar uma conversão).
Desenvolva a função e_primo que recebe um número inteiro e devolve True caso o número seja um
número primo, False caso contrário. O programa deve utilizar esta função para indicar ao utilizador se
o valor introduzido na linha de comandos é um número primo. O cabeçalho da função deve ser

def e_primo(num: int) -> bool:

Esta função não deve validar se o número é inteiro ou não (aliás, para já, esta função não deve efectuar
qualquer validação, apenas deve devolver True se o número for primo, False em qualquer outro caso).
"""
import sys


def checar_numero(numero):
    return numero.isdigit



def e_primo(numero):
    return numero > 0 and numero.isdecimal()


def main():
    if not len(sys.argv) > 2:
        print("Insira apenas um argumento!!!!!")
    else:
        if checar_numero(sys.argv[1]):
            if e_primo(sys.argv[1]):
                print(f"O numero {sys.argv[1]} é primo")
            else:
                print(f"O numero {sys.argv[1]} não é primo")


main()