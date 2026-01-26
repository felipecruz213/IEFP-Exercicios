"""
Faça um programa para validar um NIF (Número de Identifcação Fiscal).
 O programa deve aceitar o número através da linha de comandos.
  Se o utilizador não inserir nenhum número a partir da linha de
   comandos, então deve solicitar a introdução de um número ao utilizador.

 Conforme a Wikipedia (procurar por 'Número de identifcação fscal') as regras são as seguintes:

"O NIF tem 9 dígitos, sendo o último o digito de controlo. Para ser calculado o digito de controlo:
1. Multiplique o 8.º dígito por 2, o 7.º dígito por 3, o 6.º dígito por 4, o 5.º dígito por 5,
o 4.º dígito por 6,o 3.º dígito por 7, o 2.º dígito por 8, e o 1.º digito por 9
2. Adicione os resultados
3. Calcule o Módulo 11 do resultado, isto é, o resto da divisão do número por 11.
4. Se o resto for 0 ou 1, o dígito de controle será 0
5. Se for outro algarismo x, o dígito de controle será o resultado de 11 - x
"""
import sys


def verificarNIF(nif):
    nif_valido = False
    acumulador = 0
    if not nif.isdecimal() or (len(nif) != 9):
        nif_valido = False
    else:
        for i in range(8):
            acumulador += int(nif[i]) * (9 - i)

        resto = acumulador % 11
        if resto == 0 or resto == 1:
            digito_controlo = "0"
        else:
            digito_controlo = str(11 - resto)
        if nif[8] == digito_controlo:
            nif_valido = True

    return nif_valido


def main():
    if not len(sys.argv) > 1:
        entrada_nif = input("Insira um NIF: ")
    else:
        entrada_nif = sys.argv[1]
    if verificarNIF(entrada_nif):
        print(f"O NIF {entrada_nif} é valido")
    else:
        print(f"O NIF {entrada_nif} É INVALIDO!")
main()