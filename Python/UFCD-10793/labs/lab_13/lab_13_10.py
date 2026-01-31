"""
10. Faça um programa para calcular a raiz quadrada de um número de acordo com o seguinte algoritmo:

Algoritmo: Cálculo da Raiz Quadrada
Entrada(s): N → número
Saída(s): r → número tal que r * r ~= N

Passos:
    1. Escolher um número arbitrário r entre 1 e N.
    2. Se N - e e ≤ r * r ≤ N + e, com e muito pequeno (ex: 0.000001),
       então o resultado é r.
    3. Senão, fazer r = (r + N / r) / 2
    4. Voltar ao passo 2.

Observação: Utilize a função uniform do módulo random para obter um número float entre 1 e N.
"""


import random



def calcular_raiz_quadrada(num):
    resultado = 0
    tolerancia = 0.000001
    raiz_aproximada: float = random.uniform(1, num)

    # N - e <= r * r <= N + e
    while not (num - tolerancia <= raiz_aproximada * raiza_proximada <= num + tolerancia):
        raiz_aproximada = (raiz_aproximada + num / raiz_aproximada) / 2

    return raiz_aproximada

def main():
    entrada = float(input("Insira um numero: "))
    print(f"{calcular_raiz_quadrada(entrada):.3f}")

main()