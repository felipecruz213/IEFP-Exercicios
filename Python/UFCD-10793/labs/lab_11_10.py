"""
Fazer um programa para calcular a contribuição para Segurança Social, IRS e o sindicato a partir do
salário bruto, que é um atributo de entrada.
    • SS – 11,5%
    • IRS - 25%
    • Sindicato – 0,5 %
O programa deve imprimir o valor das contribuições e o valor do salário líquido.
"""

from decimal import Decimal as dec


TAXA_SS = dec(11.5)
TAXA_IRS = dec(25)
TAXA_SINDICATO = dec(5)

salario_bruto = dec(input("Salario Bruto: "))

total_SS = dec(salario_bruto * (TAXA_SS / 100))
total_IRS = dec(salario_bruto * (TAXA_IRS / 100))
total_SINDICATO = dec(salario_bruto * (TAXA_SINDICATO / 100))
salario_liquido = dec(salario_bruto - (total_SS + total_IRS + total_SINDICATO))

print("-" * 5, " CALCULA SALARIO ", "-" * 5)
print("")
print(f"Segurança Social: {total_SS:.2f}")
print(f"IRS             : {total_IRS:.2f}")
print(f"Sindicato       : {total_SINDICATO:.2f}")
print("")
print("*" * 20)
print(f"Salario Bruto   : {salario_bruto:.2f}")
print(f"Salario Liquido : {salario_liquido:.2f}")
