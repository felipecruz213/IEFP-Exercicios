"""
Faça um programa para converter euros para dólares e vice-versa.
 Pesquise o câmbio actual ou utilize o seguinte:
    €1 → $1,39. O programa deverá por começar por perguntar
 qual o sentido da conversão, apresentando
depois a conversão. Exemplo:
Escolha o sentido da conversao
1. Euros -> Dolares
2. Dolares -> Euros
T. Terminar
> 2
Montante em dólares: 2000
Euros -> 1438.85
"""
from decimal import Decimal as dec

EUR = dec(1)
USD_EUR = dec(1.18)
EUR_USD = dec(0.85)


def converterMoeda(eur, usd, invertido):
    if not invertido:
        conversao = eur * usd
    else:
        conversao = eur / usd

    return dec(conversao)


def main():
    print("1. Euro > Dolar")
    print("2. Dolar > Euro")
    print("0. Sair")
    escolha = int(input("Escolha: "))

    match escolha:
        case 0:
            print("Obrigado Volte Sempre!!!!!!!")
        case 1:
            valor_inserido = dec(input("Insira o valor em EUR"))
            print(f"EUR > USD: : {converterMoeda(valor_inserido, USD_EUR, False):.2f}")
        case 2:
            valor_inserido = dec(input("Insira o valor em EUR: "))
            print(f"EUR > USD: : {converterMoeda(EUR_USD, valor_inserido, True):.2f}")

main()