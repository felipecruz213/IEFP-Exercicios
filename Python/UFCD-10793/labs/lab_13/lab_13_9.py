"""
Faca um programa para exibir os códigos numéricos ()
 das letras de 'a' a 'z' e de 'A' a 'Z'. Poderá
 necessitar de utilizar as funções built-in ord e chr.
"""
TOTAL_LETRAS = 26

# A = 65 Z = 90 || a = 97 z = 122

def main ():
    contadorMaiusculas = 65
    contadorMinusculas = 97
    i = 0
    for x in range(TOTAL_LETRAS):
        print(f"{chr(contadorMaiusculas)} = {contadorMaiusculas} || {chr(contadorMinusculas)} = {contadorMinusculas}")
        contadorMinusculas += 1
        contadorMaiusculas += 1


main()