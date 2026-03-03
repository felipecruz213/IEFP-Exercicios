## Respostas Lab 2.2 - Funções e Ambitos
---

**1. Defina função, parâmetro, argumento, argumento com nome e parâmetro opcional.**

Função: Um bloco de código que pode ser "chamado" através de um nome.

Parâmetro: Um espaço reservado, para receber o argumento.

Argumento: Um dado que é passado para função, que é definido pelo parâmetro, dependendo da sua posição na chamada da função.

Argumento com Nome: O mesmo que o argumento, mas que pode ser definido através de um nome ao inves de somente por uma posição.

Parâmetro opcional: O mesmo que o parâmetro, mas não é necessario o preencher para chamar a função.

---

**2. Suponha que pretende utilizar a função math.pow mas pretende invocá-la com o nome elevado_a. 
Como é que poderia proceder para atingir esse objectivo?**

``` python
def elevado_a(a, b):
    return math.pow(a, b)
```

---

**3. O que é exibido pelas seguinte instruções (se executadas através de um script):**

13
23

15
60


---

**4. O que é uma função anónima e qual a finalidade da palavra-reservada lambda?  Quantas instruções ou 
comandos podem pertencer a uma lambda?**

Função anónima é uma função que não tem um nome, tipicamente usada para tarefas simples, ou passada como argumento para uma função de ordem maior.

A palavra-chave lambda serve para declarar uma função anónima, e não há limite de instruções, mas pode ter apenas um argumento.

---

**7. No laboratório, definimos a função interna filtra_alfanum para filtrar os caracteres alfanuméricos de 
uma string. Como poderia definir esta função em termos de filter?**

```python
filter(lambda x: return x.isalnum(), string)
```

---

**8. Dada o tuplo  vals = (2, 0, 1, 3, 2, 0, 1, 5) e a string txt = 'Dinamarca', com que valores ficam
as variáveis nas atribuições seguintes:**

<sub>**8.1** a = list(filter(lambda x: x > 2, vals))</sub>

[3, 5]

<sub>**8.2** b = list(map(lambda x: x > 2, vals))</sub>

[False, False, False, True, False, False, False, True]

<sub>**8.3** c = tuple(filter(lambda ch: ch in 'aeiou', txt))</sub>

('i','a','a','a')

<sub>**8.4** d = '/'.join(filter(lambda ch: ch in 'aeiouAEIOU', map(lambda ch: chr(ord(ch)+1), txt)))</sub>

"E/o"
