A estrutura de um programa **COBOL** é altamente organizada e **hierárquica**, baseada em quatro divisões obrigatórias que devem aparecer numa ordem específica. Esta estrutura foi projetada para tornar os programas autodescritivos e fáceis de ler.

---

## 1. IDENTIFICATION DIVISION (Divisão de Identificação)

Esta é a **primeira e mais básica** divisão. A sua função é fornecer metadados sobre o programa.

- **Finalidade:** Identificar e documentar o programa.
    
- **Item Obrigatório:** **`PROGRAM-ID.`** É a única cláusula verdadeiramente obrigatória dentro desta divisão e define o nome que será dado ao programa executável.
    
- **Exemplo:**
    
    
    ```
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
    ```
    
    _Outras cláusulas opcionais, como **AUTHOR** (Autor) ou **DATE-COMPILED** (Data de Compilação), podem ser incluídas aqui para documentação._
    

---

## 2. ENVIRONMENT DIVISION (Divisão de Ambiente)

Esta divisão serve como uma "ponte" entre o seu programa COBOL e o ambiente externo, como o sistema operativo (SO) e dispositivos de I/O (Entrada/Saída).

- **Finalidade:** Descrever os **ficheiros** que o programa usará (ligando os seus nomes internos a nomes externos do SO) e especificar quaisquer recursos de hardware ou software não padrão.
    
- **Estrutura Comum:** É tipicamente dividida em duas secções:
    
    - **CONFIGURATION SECTION:** Descreve o computador de origem (_SOURCE-COMPUTER_) e o computador de objeto (_OBJECT-COMPUTER_).
        
    - **INPUT-OUTPUT SECTION:** Contém o parágrafo **FILE-CONTROL**, onde os ficheiros lógicos são associados a dispositivos físicos ou nomes de ficheiros reais.
        
- **Exemplo:** O seu código não precisou dela, pois não lida com ficheiros, mas para um programa que usa um ficheiro de vendas, seria assim:
    
    ```
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SalesFile ASSIGN TO 'SALES.DAT'.
    ```
    

---

## 3. DATA DIVISION (Divisão de Dados)

Esta é a divisão onde **todos os dados** que o programa usará devem ser declarados e descritos. O COBOL é único por exigir que separe a lógica (o que fazer) dos dados (em que fazer).

- **Finalidade:** Definir e estruturar todas as variáveis, registos de ficheiros e constantes.
    
- **Secções Chave:**
    
    - **FILE SECTION:** Define a estrutura dos registos dos ficheiros que foram declarados na `ENVIRONMENT DIVISION`.
        
    - **WORKING-STORAGE SECTION:** A secção mais comum para variáveis. É aqui que declara todas as **variáveis internas, _flags_ e constantes** que o programa usa para processamento temporário (por exemplo, contadores, totais, _strings_ de ecrã).
        
- **Exemplo:**
    
    COBOL
    
    ```
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NOME     PIC X(20) VALUE SPACES.
       01 WS-IDADE    PIC 9(02) VALUE ZEROES.
    ```
    
    _O **`01`** define o nível do item, **`WS-NOME`** é a variável, e **`PIC X(20)`** é a cláusula **PICTURE**, que descreve o tipo e o tamanho dos dados (neste caso, 20 caracteres alfanuméricos)._
    

---

## 4. PROCEDURE DIVISION (Divisão de Procedimento)

Esta é a divisão que contém a **lógica de execução real** do programa. É o "motor" do COBOL, onde se colocam as instruções para manipulação de dados, I/O, cálculos e fluxo de controlo.

- **Finalidade:** Executar o programa. Contém **Parágrafos** (_Paragraphs_) e **Secções** (_Sections_) que organizam as instruções do código.
    
- **Instruções Comuns:**
    
    - **`DISPLAY`:** Exibe dados no ecrã (como no seu exemplo).
        
    - **`ACCEPT`:** Lê dados do teclado (entrada do utilizador).
        
    - **`MOVE`:** Atribui um valor a uma variável.
        
    - **`COMPUTE`:** Realiza cálculos matemáticos.
        
    - **`PERFORM`:** Usado para chamar ou executar rotinas/parágrafos de código.
        
- **Exemplo:**
    
    COBOL
    
    ```
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY 'Olá, Mundo!'.
           STOP RUN.
    ```
    
    _O **`MAIN-PROCEDURE`** é um **Parágrafo** que contém as instruções a serem executadas. **`STOP RUN`** é a instrução final que encerra o programa._
    

---

### Resumo da Ordem

A ordem é **rigidamente imposta** pelo compilador. Pense nela como uma pirâmide estruturada:

1. **IDENTIFICATION** (Quem sou eu?)
    
2. **ENVIRONMENT** (Onde estou a correr e o que estou a usar?)
    
3. **DATA** (Com o que vou trabalhar?)
    
4. **PROCEDURE** (O que vou fazer?)
    


```
// IDENTIFICATION (Nome do programa)
IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO.

// DATA (Variáveis internas, etc.)
DATA DIVISION.
WORKING-STORAGE SECTION.

// PROCEDURE (A lógica)
PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Olá, Mundo!'.
    STOP RUN.
```

