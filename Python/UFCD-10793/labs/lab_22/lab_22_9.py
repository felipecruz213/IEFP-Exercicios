"""
Desenvolva a função dobro que recebe um valor e devolve o dobro desse valor.
De seguida, desenvolva as funções triplo, quadrado e cubo.
"""

def dobro(x):
    return x * 2


def triplo(x):
    return x * 3


def cubo(x):
    return x ** 3



def main():
    numero = 5
    print(f"Dobro: ", dobro(numero))
    print(f"Triplo: ", triplo(numero))
    print(f"Cubo: ", cubo(numero))

main()