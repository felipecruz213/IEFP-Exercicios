"""
    Remova a opção 'T' para terminar o programa. Agora, no fnal de uma conversão, o programa
     questiona o utilizador se pretende realizar nova conversão:
    Escolha o sentido da conversao
    1. Euros -> Dolares
    2. Dolares -> Euros
    > 2
    Montante em dólares: 2000
    Euros -> 1438.85
    Pretende efectuar mais conversões (S/N)? n
    Fim do programa

    Como respostas válidas a esta pergunta, apenas devem ser aceites os seguintes valores: s, n, sim, nao
     e não, com qualquer combinação de "capitalização"/"case" (ou seja, deve aceitar, s, S, sim, SIM,
    Sim, etc.). Qualquer outro valor deve levar a uma mensagem de erro e a nova pergunta. Exemplo:

    Pretende efecturar mais conversões (S/N)? x
     ERRO: opção <x> é inválida.
    Pretende efecturar mais conversões (S/N)? n
    Fim do programa
"""

from decimal import Decimal as dec

EUR = dec(1)
USD_EUR = dec(1.18)
EUR_USD = dec(0.85)



def validarSaida(entrada_escolha):
    entrada_escolha = entrada_escolha.lower()
    escolha_valida = False
    escolha_sair = False
    if not (entrada_escolha.startswith(("s", "n"))):
        escolha_valida = False
        escolha_sair = False
    else:
        if entrada_escolha.startswith("n"):
            escolha_valida = True
            escolha_sair = True
        else:
            escolha_valida = True
            escolha_sair = False

    return escolha_valida, escolha_sair



def converterMoeda(eur, usd, invertido):
    if not invertido:
        conversao = eur * usd
    else:
        conversao = eur / usd

    return dec(conversao)


def main():
    escolha_sair = False
    while True:
        if escolha_sair:
            print("Obrigado, tenha um bom dia!")
            break
        else:
            print("1. Euro > Dolar")
            print("2. Dolar > Euro")
            escolha = int(input("Escolha: "))
            match escolha:
                case 1:
                    valor_inserido = dec(input("Insira o valor em EUR: "))
                    print(f"EUR > USD: : {converterMoeda(valor_inserido, USD_EUR, False):.2f}")
                case 2:
                    valor_inserido = dec(input("Insira o valor em USD: "))
                    print(f"USD > EUR: : {converterMoeda(EUR_USD, valor_inserido, True):.2f}")

            while True:
                escolha = input("Deseja continuar? [S]im / [N]ão: ")
                escolha_valida, escolha_sair = validarSaida(escolha)
                if not escolha_valida:
                    print("Escolha [S]im / [N]ão!")
                else:
                    break


main()