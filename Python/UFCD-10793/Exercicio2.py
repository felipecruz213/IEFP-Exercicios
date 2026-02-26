"""
EXERCÍCIOS 2:

1. Definindo critérios com LAMBDAS, escrever expressões para:
   1.1 filtrar números entre 1 e 20
   1.2 filtrar números começados por 1
   1.3 filtrar números terminados em 0
   1.4 filtrar nomes que comecem numa vogal
   1.5 filtrar nomes que terminem numa consoante

2. Desenvolver função MAPEIA. Transforma um iterável (uma lista,
   um tuplo, uma string) noutro iterável por uma função.
   Exemplos:

   nums = (10, 20, 30, 100)
   mapeia(nums, lambda num: 2 * num) # [20, 40, 60, 200]
   mapeia(nums, lambda num: num + 1) # [11, 21, 31, 101]
   mapeia(nums, lambda num: len(str(num))) # [2, 2, 2, 3]

   nomes = ['ana', 'alberto', 'henriqueta']
   mapeia(nomes, lambda nome: nome[-1]) # ['a', 'o', 'a']
   mapeia(nomes, len) # [3, 7, 10]
"""