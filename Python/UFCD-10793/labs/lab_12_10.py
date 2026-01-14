"""
Faça um programa para calcular o preço de venda final de um produto.
    Para tal solicita, através da linha de comandos (shell),
    o preço do produto, o valor da taxa de IVA a aplicar e
    (opcionalmente) o valor de um desconto a aplicar ao valor final do produto.

    O programa deverá dar instruções ao utilizador de como deve ser invocado.
    O valor do IVA e do desconto deve ser dado em percentagem.
"""


from decimal import Decimal as dec

valor_produto = dec(input("Valor do Produto: "))
porcentagem_IVA = dec(input("Porcentagem do IVA (0 - 100): "))
porcentagem_desconto = dec(input("Porcentagem de desconto(0-100): "))

valor_IVA = (valor_produto * (porcentagem_IVA / 100))
valor_desconto = (valor_produto * (porcentagem_desconto / 100))

valor_final = valor_produto + valor_IVA - valor_desconto

print("\n\n" , "*" * 5, "TOTAL", "*" * 5)

print(f"Preço      : {valor_produto}")
print(f"IVA        : {valor_IVA}")
print(f"Desconto   : {valor_desconto}")
print("")
print("#" * 25)
print(f"Valor final: {valor_final}") 
