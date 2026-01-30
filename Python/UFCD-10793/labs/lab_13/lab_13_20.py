"""
Investigue o módulo datetime e faça um programa
 que quando chamado sem argumentos indica a
 data/hora actual. Alternativamente, pode receber
 uma ou duas datas, indicando o número de dias entre
 estas datas. Se apenas receber uma data,
 utiliza como segunda data a data actual

"""


import datetime
import sys

def converter_data(string_data: str) -> datetime.date:
    return datetime.datetime.strptime(string_data, "%d/%m/%Y").date()


def calcular_diferenca_data(data_1: datetime.date, data_2: datetime.date) -> int:
    return (data_1 - data_2).days


def main():
    data_hoje = datetime.date.today()


    if len(sys.argv) < 2:
        hora_agora = datetime.datetime.now()
        print(f"Hoje é {data_hoje.day}/{data_hoje.month}/{data_hoje.year}")
        print(f"E são {hora_agora.hour} Horas e {hora_agora.minute} Minutos")
        match sys.platform:
            case 'win32':
                print("E Está Executando o Programa em um Sistema Windows")
            case 'darwin':
                print("E Está Executando o Programa em um Sistema MacOS")
            case 'linux':
                print(f"E Está Executando o Programa em um Sistema Linux {chr(0x1F427)}")

    else:
        data_string = []
        datas_convertidas = []
        for data in sys.argv[1::]:
            try:
                datas_convertidas.append(converter_data(data))
            except ValueError:
                print(f"A data {data} é invalida!!!!")


        if len(datas_convertidas) == 1:
            diferenca_dias = int(calcular_diferenca_data(datas_convertidas[0], data_hoje))
            data_string = [datas_convertidas[0].strftime('%d/%m/%Y'), data_hoje.strftime('%d/%m/%Y')]
            if diferenca_dias < 0:
                print(f"A Diferença de Dias Entre {data_string[0]} e Hoje é de {abs(diferenca_dias)} Dias a Menos!")
            elif diferenca_dias == 0:
                print(f"As Datas São Iguais!!!!")
            elif diferenca_dias > 0:
                print(f"A Diferença de Dias Entre {data_string[0]} e Hoje é de {abs(diferenca_dias)} Dias a Mais!")


        elif len(datas_convertidas) == 2:
            diferenca_dias = int(calcular_diferenca_data(datas_convertidas[0], datas_convertidas[1]))
            data_string = [datas_convertidas[0].strftime('%d/%m/%Y'), datas_convertidas[1].strftime('%d/%m/%Y')]
            if diferenca_dias < 0:
                print(f"A Diferença de Dias Entre {data_string[0]} e {data_string[1]} é de {abs(diferenca_dias)} Dias a Menos!")
            elif diferenca_dias == 0:
                print(f"As Datas São Iguais!!!!")
            elif diferenca_dias > 0:
                print(f"A Diferença de Dias Entre {data_string[0]} e {data_string[1]} é de {abs(diferenca_dias)} Dias a Mais!")

        else:
            print(f"Insira até duas datas validas, foram inseridas {len(datas_convertidas)}!!!")




if __name__ == '__main__':
    main()

