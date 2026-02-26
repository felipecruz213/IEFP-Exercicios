"""
Exercício 1:

1) Função que soma todos os valores de uma lista de números (float) e devolve o
resultado (num float)

soma([10, 15, 20]) => 45.0
print(soma([10, 15, 20]))  # mostra 45.0

2) Função para indicar o valor mais alto (máximo) presente num tuplo
de valores inteiros:

maximo((10, 15, 20)) => 20
maximo((10, 15, 20, 20)) => 20
maximo((5, 5, 5, 5, 5)) => 5
maximo((14)) => 14
maximo(tuple()) => ERRO

3) Função para indicar o máximo e o mínimo de um tuplo de valores
"""
from idlelib.debugobj_r import remote_object_tree_item


def soma(numeros : list) -> float:
    soma_total = 0.0
    for i in numeros:
        soma_total =+ i

    return float(soma_total)

def maximo(numeros : tuple[int,...]) -> int:
    numeros_ordenados = sorted(numeros)
    return numeros_ordenados[-1]

def maximo_minimo(numeros : tuple[int,...]) -> tuple:
    numeros_ordenados = sorted(numeros)
    return numeros_ordenados[0], numeros_ordenados[-1]

def filtra_positivos(numeros: list[int]):
    numeros_positivos = []
    for i in numeros:
        if i >= 0:
            numeros_positivos.append(i)

    return tuple(numeros_positivos)

print(soma([1, 5, 10]))
print(maximo((0, 3, 40, 30)))
print(maximo_minimo((0, 3, 40, 30, 70, -1)))
print(filtra_positivos([0, -3, 40, -30, 70, -1]))