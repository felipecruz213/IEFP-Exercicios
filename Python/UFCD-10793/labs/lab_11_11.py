"""
Desenvolva um programa a solicitar a entrada de horas, minutos e segundos,
 calculando depois o tempo total em segundos.
"""


horas = int(input("Horas: "))
minutos = int(input("Minutos: "))
segundos = int(input("Segundos: "))

total_Segundos = 0

total_Segundos += segundos
total_Segundos += (minutos * 60)
total_Segundos += (horas * 3600)

print(f"\n\nO total de segundos em {horas}:{minutos}:{segundos} é: {total_Segundos}")