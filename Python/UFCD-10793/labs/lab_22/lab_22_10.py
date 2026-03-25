"""
Desenvolva uma função para calcular a fórmula resolvente. A função deve chamar-se
resolvente, deve possuir três parâmetros de entrada, a, b e c, e deve devolver
um tuplo com os dois resultados.

NOTA: Dada uma equação do segundo grau ax² + bx + c = 0, podemos determinar
o valor de x que verifica a igualdade fazendo:
x = (-b ± sqrt(b² - 4ac)) / 2a
"""

import math

def resolvente(a, b, c) -> tuple:
    delta = b**2 - 4*a*c

    raiz_delta = math.sqrt(delta)

    x1 = (-b + raiz_delta) / (2 * a)
    x2 = (-b - raiz_delta) / (2 * a)

    return x1, x2

print(resolvente(1, 1, 5))