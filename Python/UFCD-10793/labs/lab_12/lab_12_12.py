"""
    Pretende-se calcular a idade em anos em função do dia,
     mês e ano de nascimento e dia, mês e ano atual.
    Tenha em atenção o seguinte: em condições normais a
     idade é a diferença entre o ano atual e ano de
     nascimento, porém, se o mês actual for inferior ao
      mês de nascimento ou o mês atual igual ao mês de
     nascimento e o dia atual inferior ao dia de nascimento
     a idade é o ano atual menos o ano de nascimento
     menos um.
"""


from datetime import date
from dateutil.relativedelta import relativedelta

def calcularData(data_entrada):
    diferenca_data = relativedelta(date.today(), data_entrada)
    return diferenca_data.years


def main():
    ano = int(input("Ano: "))
    mes = int(input("Mês: "))
    dia = int(input("Dia: "))
    data = date(ano, mes, dia)
    print(f"A pessoa tem {calcularData(data)} anos.")



main()
