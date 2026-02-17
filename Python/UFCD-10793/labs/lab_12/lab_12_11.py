"""
Faça um programa para indicar se um determinado ano
 introduzido pelo utilizador é bissexto ou não. 
 Um ano é bissexto se for múltiplo de 4. 
 No caso dos anos centenários, apenas são
   bissextos os anos múltiplos de 400. 
   Não aceite anos negativos. 
 Pode utilizar o operador % (resto ou módulo) para determinar se um 
  número é múltiplo de outro (ou, dito de outra forma,
  se um número é divisível por outro).
"""


def CalcularAnoBissexto(ano):
    return (ano % 4 == 0) or (ano % 400 == 0)

def main():
    while True:
      entrada_ano = int(input("Introduza o ano: "))
      if entrada_ano < 0:
          print("Insira Um ano positivo!!!!")
      else:
        if CalcularAnoBissexto(entrada_ano):
            print(f"O ano {entrada_ano} é bissexto")
        else:
            print(f"O ano {entrada_ano} não é bissexto")


main()