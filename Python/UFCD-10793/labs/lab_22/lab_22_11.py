"""
Pretendemos implementar a nossa biblioteca de funções. Várias destas funções já
existem na biblioteca padrão do Python, porém agora queremos implementar as nossas
versões. Deve evitar utilizar a biblioteca padrão do Python e, principalmente,
não pode utilizar as versões equivalentes da biblioteca do Python. Não pode
utilizar funções/métodos como split, find/index, partition, etc. Apenas pode
utilizar join, len e outras impossíveis de contornar.
"""

import abc
from collections.abc import Sequence

"""
11.1 is_digit(val: str) ->: Devolve True se val é uma string apenas com dígitos.
"""
def is_digit(val : str) -> bool:
    only_digits = False
    valid_chars = ('1', '2', '3', '4', '5', '6', '7', '8', '9', '0', ',', '.')

    for i in val:
        if i == ',' and i == ',':
            continue
        if i not in valid_chars:
            only_digits = False
            break
        else:
            only_digits = True

    return only_digits


"""
11.2 is_alpha(val: str) -> bool: Devolve True se val é uma string apenas com 
 letras dos alfabetos ocidentais. Além das letras em string.ascii_letters
  (string é um módulo da biblioteca padrão do Python),
   considere também os seguintes caracteres:

'ñáàáäåãèéêëōîïíìũüûùćńšžŽČdsžňljjdZ℮' +
'ÑÁÀÁÄÅÃÈÉÊËŌÎÏÍÌŨÜÛÙĆŃŠŽŽČDSŽNJLJDZ℮'
"""


def is_alpha(val: str) -> bool:
    only_alphabet = False
    valid_char = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' \
                 'ñáàáäåãèéêëōîïíìũüûùćńšžŽČdsžňljjdZ℮' \
                 'ÑÁÀÁÄÅÃÈÉÊËŌÎÏÍÌŨÜÛÙĆŃŠŽŽČDSŽNJLJDZ℮'

    for i in val:
        if i not in valid_char:
            only_alphabet = False
            break
        else:
            only_alphabet = True

    return only_alphabet



"""
11.3 is_alphanum(val: str) -> bool: Devolve True se val é uma string apenas 
 com letras (como em is_alpha) ou dígitos (como em is_digit).
"""

def is_alphanum(val: str) -> bool:
    only_alphanum = False
    valid_char = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' \
                 'ñáàáäåãèéêëōîïíìũüûùćńšžŽČdsžňljjdZ℮' \
                 'ÑÁÀÁÄÅÃÈÉÊËŌÎÏÍÌŨÜÛÙĆŃŠŽŽČDSŽNJLJDZ℮' \
                 '1234567890,.'

    for i in val:
        if i not in valid_char:
            only_alphanum = False
            break
        else:
            only_alphanum = True

    return only_alphanum


"""
11.4 is_int(val) -> bool: Devolve True se é um objecto que possa ser 
transformado num número inteiro, positivo ou negativo.
"""

def is_int(val) -> bool:
    try:
        int(val)
    except ValueError:
        return False
    else:
        return True


"""
11.5 is_float(val) -> bool: Devolve True se val é um objecto que possa ser transformado num
float inteiro ou positivo. Aqui aplicam-se se as mesmas considerações acerca da utilização de
excepções (mas não é necessário suportar o parâmetro base). O separador de casa decimais
deve ser o . (ponto).
"""

def is_float(val) -> bool:
    try:
        float(val)
    except ValueError:
        return False
    else:
        return True


"""
11.7 find(seq: Sequence, val) -> int: Devolve a posição do item val
    na sequência seq, caso este elemento exista na sequência.
   Devolve -1 caso val não esteja presente na sequência seq. 
   O tipo de dados Sequence está de nido no módulo collections.abc e abrange
    tipos de dados como list, tuple, str e outros tipos de sequência.
"""


def find(seq: Sequence, val) -> int:
    position = 0

    if val not in seq:
        position = -1

    else:
        for index, element in enumerate(seq):
            if element == val:
                position = index
                break

    return position


"""
11.8 rfind(seq: Sequence, val) -> int : Idêntico a find mas procura a
 partir da direita 
 (a posição, no entanto, deve ser a posição do elemento na sequência).
  Ou seja, começa a pesquisa na última posição.
  """

def rfind(seq: Sequence, val) -> int:
    position = 0

    if val not in seq:
        position = -1

    else:
        for index, element in enumerate(seq[::-1]):
            if element == val:
                position = index
                break

    return position


"""
11.9 find_if(seq: Sequence, fn) -> int: Devolve a posição na sequência seq do primeiro item
para o qual a função fn devolve True. Exemplos:
nums = [15, 25, 7, 44, 0]
print(find_if(nums, lambda num: num > 30)) # mostra 3, posição do 44
txt = 'Amanhã vai chover'
print(find_if(txt, lambda ch: ch == ' ')) # mostra 6, posição do primeiro ' '
"""

def find_if(seq: Sequence, fn) -> int:
    found_index = -1
    for index, i in enumerate(seq):
        if fn(i):
            found_index = index

    return found_index


"""
11.10 rfind_if(seq: Sequence, fn) -> int: Pesquisa começando pela direita.
"""

def rfind_if(seq: Sequence, fn) -> int:
    found_index = -1
    negative_counter = -1
    positive_counter = 0

    while positive_counter < (len(seq) - 1):
        if fn(seq[negative_counter]):
            found_index = positive_counter

        positive_counter =+ 1
        negative_counter =- 1

    return found_index


"""
11.11 count_words(txt: str) -> int: Indica quantas palavras estão presentes numa string. Uma
palavra é uma sequência de caracteres não brancos. Caracteres brancos podem ser o espaço,
mudança de linha, tabulação, etc. Não utilize métodos de str como split, partition, find e
similares.
"""

def count_words(txt : str) -> int:
    temp_string = ""
    word_list = []
    text_splitting_chars = ('.', ',', ' ')

    #added an char to the evaluation so it doesnt ignore the last word
    for i in txt + " ":
        if i not in text_splitting_chars:
            temp_string += i

        else:
            if temp_string:
                word_list.append(temp_string)
                temp_string = ""

            else:
                continue

    return len(word_list)



"""
11.12 all_words(txt: str) -> list[str]: Devolve uma lista com todas as palavras presentes numa
string.
"""

def all_words(txt : str) -> list[str]:
    temp_string = ""
    word_list = []
    text_splitting_chars = ('.', ',', ' ')

    #added an char to the evaluation so it doesnt ignore the last word
    for i in txt + " ":
        if i not in text_splitting_chars:
            temp_string += i

        else:
            if temp_string:
                word_list.append(temp_string)
                temp_string = ""

            else:
                continue

    return word_list


"""
11.13 reversed(seq: Sequence) -> list: Devolve uma lista com os elementos da sequência por
ordem inversa. Caso já tenha dado iteradores e geradores, pode devolver um gerador para
aceder aos elementos por ordem inversa.
"""

def reversed(seq : Sequence) -> list:
