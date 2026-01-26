"""
Acrescente a possibilidade de repetição
  ao programa anterior enquanto o utilizador não acertar.
 O programa deve dar pistas ao utilizador.
 Se este estiver a três valores de distância, então o programa
  indica que "está próximo", se estiver a um valor,
  o programa diz que "está muito próximo".
"""

import random

def validarNumero(num_min, num_max, numero):
    return (numero >= num_min) and (numero <= num_max)


def gerarNumeroAleatorio(num_min, num_max):
    random.seed() # inicializa a seed conforme a hora atual do sistema
    numero_gerado = random.randint(num_min, num_max)
    return numero_gerado

def verificarNumeroProximo(a, b, proximidade):
    distancia = abs(a - b)
    esta_proximo = (distancia == proximidade)
    esta_muito_proximo = (distancia == 1)

    return esta_proximo, esta_muito_proximo

def main():
    numero_minimo = 1
    numero_maximo = 20
    numero_correto = gerarNumeroAleatorio(numero_minimo, numero_maximo)
    numero_acertado = False
    while True:
        while True:
            escolha_numero = int(input(f"Escolha um numero de [{numero_minimo}] a [{numero_maximo}]: "))
            if not validarNumero(numero_minimo, numero_maximo, escolha_numero):
                print("Numero Invalido !!!!")
                continue
            else:
                break

        if not (escolha_numero == numero_correto):
            proximo, muito_proximo = verificarNumeroProximo(escolha_numero, numero_correto, 3)
            if muito_proximo:
                print("Esta muito proximo")
            elif proximo:
                print("Estão proximos.")
        else:
            print("Numero Correto!!!!")
            break


main()