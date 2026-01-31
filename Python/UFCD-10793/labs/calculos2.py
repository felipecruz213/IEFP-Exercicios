"""
- Exercício: script (calculos1.py que pede número (float) ao utilizador e 
   que exibe:
     . dobro
     . triplo
     . quadrado
     . cubo
     . resultado de 2.5x + 10, onde x é o número pedido ao utilizador

   $ python3 calculos1.py
   Introduza um número: 3
   Dobro     : 6.0
   Triplo    : 9.0
   Quadrado  : 9.0
   Cubo      : 27.0
   2.5x + 10 : 17.5
   $ 
"""


from decimal import Decimal as dec

numero = dec(input("Introduza um número: "))
print(f"Dobro        : {(numero * 2):.2f}")
print(f"Triplo       : {(numero * 3):.2f}")
print(f"Quadrado     : {(numero ** 2):.2f}")
print(f"Cubo         : {(numero ** 3):.2f}")
print(f"2.5x + 10    : {((numero * dec("2.5")) + 10):.2f}")
