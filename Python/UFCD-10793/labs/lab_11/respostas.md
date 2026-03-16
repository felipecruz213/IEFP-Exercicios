## Respostas Lab 2.2 - Funções e Ambitos
---

**1. O que é um “identifcador”?**

São nomes utilizados para identificar funções, variáveis, classes, módulos ou objetos.

---

**2. Quais os tipos de dados primitivos do Python?**

Boolean, int, string, float.

---

**3. Indique o que fazem os seguintes operadores: (%, -= , /=)**

**%  :** É o operador módulo, calcula o resto de uma divisão

```python
dividendo % divisor = quociente
```
<br>

**-= :** Subtrai o valor de uma variável, e atribui o valor diretamente a ela

```python
minuendo -= subraendo
```
<br>

**/= :** Divide uma variável e atribui o valor diretamente a ela

```python
dividendo /= divisor
```

---

**5. Considerando que inicialmente '```nome = FERNANDO MANUEL```', indique os valores das seguinte expressões:**

**5.1**  ```nome[3]```
&nbsp;&nbsp;&nbsp;&nbsp;'N'
**5.2**  ```nome[3:6]```
&nbsp;&nbsp;&nbsp;&nbsp;'NAN'
**5.3**  ```nome[3:]```
&nbsp;&nbsp;&nbsp;&nbsp;'NANDO MANUEL'
**5.4**  ```nome[-3]```
&nbsp;&nbsp;&nbsp;&nbsp;'U'
**5.5**  ```nome[-3:]```
&nbsp;&nbsp;&nbsp;&nbsp;'UEL'
**5.6**  ```nome[0:-3]```
&nbsp;&nbsp;&nbsp;&nbsp;'FERNANDO MAN'
**5.7**  ```nome[:-3]```
&nbsp;&nbsp;&nbsp;&nbsp;'FERNANDO MAN'
**5.8**  ```nome[-5:-3]```
&nbsp;&nbsp;&nbsp;&nbsp;'AM'
**5.9**  ```nome[len(nome)-1]```
&nbsp;&nbsp;&nbsp;&nbsp;14
**5.10**  ```nome[-1]```
&nbsp;&nbsp;&nbsp;&nbsp;'L'
**5.11**  ```nome[-len(nome)]```
&nbsp;&nbsp;&nbsp;&nbsp;'F'
**5.12**  ```nome[-len(nome) + 2]```
&nbsp;&nbsp;&nbsp;&nbsp;'R'
**5.13**  ```nome[-10:10]```
&nbsp;&nbsp;&nbsp;&nbsp;'NDO M'


---

**6. Quais das seguintes condições são sempre verdadeiras?**

**6.1**  ```(x < y) or (x >= y)```
&nbsp;&nbsp;&nbsp;&nbsp; É sempre verdadeira, porque esta checando se x é menor que y ou se é maior ou igual.
**6.2**  ```(x == y) and (x != y)```
&nbsp;&nbsp;&nbsp;&nbsp; Não pode ser verdadeira, pois está verificando se x é igual a y **e** x é diferente de y.
**6.3**  ```not ((x == y) and (x != y))``` 
&nbsp;&nbsp;&nbsp;&nbsp;É sempre verdadeira, porque está invertendo uma condição que nunca será verdadeira.
**6.4**  ```(x <= 1) and (x >= 1)```
&nbsp;&nbsp;&nbsp;&nbsp;É sempre falsa, porque está verificando se x é menor ou igual a 1 **e** se x é maior ou igual a 1.


---

**7. Os seguintes programas ou fragmentos apresentam alguns erros.**

|Programa com Erros|Programa Corrigido|
|---|---|
|```x = 2 + "2"```<br>```y = "abc".len()```|```x = 2 + 2```<br>```y = len("abc")```|
|```x = 19.0```<br>```#...```<br>```print("Valor de X:"  x, "Dobro X:"  2*x )```|```x = 19.0```<br>```#...```<br>```print("Valor de X:",  x, "Dobro X:",  2*x )```|
|```x = 2.9```<br>```print(str[x] + ' 19')```|```x = 2.9```<br>```print(x + 19)```|
|```Import Decimal```<br>```x = 10```<br>```1+=x```<br>```y = x + '1'```<br>```input(y)```|```import decimal```<br>```x = 10```<br>```x += 1```<br>```y = x + 1```<br>```print(y)```|


---

**8. O que é exibido pelas seguntes instruções(se executadas através de um script):**


|Programa|Saída|
|---|---|
|```x, y = 2 , 3```<br>```print("XY -> " + str(x) + str(y))```<br>```print("X+Y ->", x+y)```<br>```x *= 6; y *= 2```<br>```print("X/Y ->", x/y)```|```XY -> 23```<br>```X + Y -> 5```<br>```X/Y -> 2```|
|```x = 'Alberto'```<br>```print(x[0], x[3], x[-1], sep='/', end='$')```<br>```print(x[2], x[4])```||