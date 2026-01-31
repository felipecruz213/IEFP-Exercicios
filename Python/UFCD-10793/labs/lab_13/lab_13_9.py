"""
Faca um programa para exibir os códigos numéricos ()
 das letras de 'a' a 'z' e de 'A' a 'Z'. Poderá
 necessitar de utilizar as funções built-in ord e chr.
"""


TOTAL_LETRAS = 26

# A = 65 Z = 90 || a = 97 z = 122

def main ():
    contador_maiusculas = 65
    contador_minusculas = 97
    i = 0
    for x in range(TOTAL_LETRAS):
        print(f"{chr(contador_maiusculas)} = {contador_maiusculas} || {chr(contador_minusculas)} = {contador_minusculas}")
        contador_minusculas += 1
        contador_maiusculas += 1


main()