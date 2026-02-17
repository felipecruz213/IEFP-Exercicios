       IDENTIFICATION DIVISION.
       PROGRAM-ID. exercicio02.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL FICHEIRO-VENDAS ASSIGN TO "VENDAS.DAT"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FICHEIRO-VENDAS.
       01  REGISTO-VENDAS.
           05 REG-NOME-FILIAL          PIC X(30).
           05 REG-VALOR-VENDAS         PIC 9(7)V99.

       WORKING-STORAGE SECTION.
       77  ESCOLHA-MENU                PIC 9 VALUE 9.
       77  NOME-EMPRESA                PIC X(22) VALUE 
           "Empresa VendeTudo, S.A".
       77  TITULO-MENU-LISTAGEM        PIC X(40).

       77  LINHA                       PIC 99.
       77  TOTAL-GERAL                 PIC 9(8)V99 VALUE 0.
       77  MAIOR-VALOR                 PIC 9(7)V99 VALUE 0.
       77  IDX-MAIOR                   PIC 9 VALUE 0.
       77  TECLA-PAUSA                 PIC X.

       01  DADOS-FILIAIS.
           05 FILIAL OCCURS 3 TIMES INDEXED BY IDX-FILIAL.
               10 NOME-FILIAL          PIC X(30).
               10 VALOR-VENDAS         PIC 9(7)V99.

       01  DATA-AGORA.
           02 ANO                      PIC 9(4).
           02 MES                      PIC 99.
           02 DIA                      PIC 99.

       SCREEN SECTION.
       01  CLS BLANK SCREEN.

       01  MENU-PRINCIPAL.
           05 LINE 1 COL 1 PIC X(22) USING NOME-EMPRESA.
           05 LINE 1 COL 70 PIC 99 USING DIA.
           05 LINE 1 COL 72 VALUE "/".
           05 LINE 1 COL 73 PIC 99 USING MES.
           05 LINE 1 COL 75 VALUE "/".
           05 LINE 1 COL 76 PIC 9999 USING ANO.
           05 LINE 2 COL 1 VALUE "Vendas" HIGHLIGHT.
           05 LINE 2 COL 7 VALUE "(" HIGHLIGHT.
           05 LINE 2 COL 8 USING ANO HIGHLIGHT.
           05 LINE 2 COL 12 VALUE ")" HIGHLIGHT.
           05 LINE 3 COL 1 VALUE 
           "---------------------------------------------------------"&
           "-------------------------".
           05 LINE 4 COL 35 VALUE "MENU PRINCIPAL" HIGHLIGHT.
           05 LINE 5 COL 1 VALUE
           "---------------------------------------------------------"&
           "-------------------------".
           05 LINE 7 COL 25 VALUE "1 - Registo de Dados.". 
           05 LINE 8 COL 25 VALUE "2 - Listagem de Dados.".
           05 LINE 9 COL 25 VALUE "3 - Listagem com Total Final.".
           05 LINE 10 COL 25 VALUE "4 - Filial com Maior Venda".
           05 LINE 11 COL 25 VALUE "5 - Guardar em Ficheiro".
           05 LINE 12 COL 25 VALUE "6 - Ler do Ficheiro".
           05 LINE 14 COL 25 VALUE "0 - Terminar o Programa".
           05 LINE 18 COL 25 VALUE "Escolha: [ ]".

       01  LAYOUT-LISTAGEM-DADOS.
           05 LINE 1 COL 1 PIC X(22) USING NOME-EMPRESA.
           05 LINE 1 COL 70 PIC 99 USING DIA.
           05 LINE 1 COL 72 VALUE "/".
           05 LINE 1 COL 73 PIC 99 USING MES.
           05 LINE 1 COL 75 VALUE "/".
           05 LINE 1 COL 76 PIC 9999 USING ANO.
           05 LINE 2 COL 1 VALUE "Vendas" HIGHLIGHT.
           05 LINE 2 COL 7 VALUE "(" HIGHLIGHT.
           05 LINE 2 COL 8 USING ANO HIGHLIGHT.
           05 LINE 2 COL 12 VALUE ")" HIGHLIGHT.
           05 LINE 3 COL 1 VALUE ALL "-".
           05 LINE 4 COL 30 PIC X(40) USING TITULO-MENU-LISTAGEM 
              HIGHLIGHT.
           05 LINE 5 COL 1 VALUE ALL "-".
           05 LINE 6 COL 5 VALUE "FILIAL" HIGHLIGHT.
           05 LINE 6 COL 45 VALUE "VENDAS (EUR)" HIGHLIGHT.

       PROCEDURE DIVISION.
       INICIO-PROGRAMA.
           MOVE FUNCTION CURRENT-DATE TO DATA-AGORA.
           MOVE 9 TO ESCOLHA-MENU.

           PERFORM INICIO-MENU UNTIL ESCOLHA-MENU = 0.
           STOP RUN.

       INICIO-MENU.
           DISPLAY CLS.
           DISPLAY MENU-PRINCIPAL.
           ACCEPT ESCOLHA-MENU AT LINE 18 COL 35.

           EVALUATE ESCOLHA-MENU
               WHEN 1 
                   PERFORM OPCAO-01-REGISTO
               WHEN 2
                   PERFORM OPCAO-02-LISTAGEM
               WHEN 3
                   PERFORM OPCAO-03-TOTAL
               WHEN 4
                   PERFORM OPCAO-04-MAIOR
               WHEN 5
                   PERFORM OPCAO-05-GUARDAR
               WHEN 6
                   PERFORM OPCAO-06-LER
               WHEN 0
                   CONTINUE
               WHEN OTHER
                   DISPLAY "Opcao Invalida!" AT LINE 22 COL 25
                   ACCEPT TECLA-PAUSA AT LINE 22 COL 45
           END-EVALUATE.

       OPCAO-01-REGISTO.
           MOVE "REGISTO DE DADOS" TO TITULO-MENU-LISTAGEM.
           DISPLAY CLS.
           DISPLAY LAYOUT-LISTAGEM-DADOS.
           MOVE 8 TO LINHA.

           PERFORM VARYING IDX-FILIAL FROM 1 BY 1 UNTIL IDX-FILIAL > 3
               DISPLAY IDX-FILIAL AT LINE LINHA COL 2
               DISPLAY "-" AT LINE LINHA COL 3
               
               ACCEPT NOME-FILIAL(IDX-FILIAL) AT LINE LINHA COL 5 
               ACCEPT VALOR-VENDAS(IDX-FILIAL) AT LINE LINHA COL 45 
               
               ADD 2 TO LINHA
           END-PERFORM.
           
           DISPLAY "Dados Registados! Enter p/ Voltar." 
                   AT LINE 20 COL 20.
           ACCEPT TECLA-PAUSA.

       OPCAO-02-LISTAGEM.
           MOVE "LISTAGEM DE DADOS" TO TITULO-MENU-LISTAGEM.
           DISPLAY CLS.
           DISPLAY LAYOUT-LISTAGEM-DADOS.
           MOVE 8 TO LINHA.

           PERFORM VARYING IDX-FILIAL FROM 1 BY 1 UNTIL IDX-FILIAL > 3
               DISPLAY NOME-FILIAL(IDX-FILIAL) AT LINE LINHA COL 5
               DISPLAY VALOR-VENDAS(IDX-FILIAL) AT LINE LINHA COL 45
               ADD 2 TO LINHA
           END-PERFORM.
           
           DISPLAY "Pressione ENTER para voltar." AT LINE 20 COL 20.
           ACCEPT TECLA-PAUSA.

       OPCAO-03-TOTAL.
           MOVE "LISTAGEM COM TOTAL" TO TITULO-MENU-LISTAGEM.
           DISPLAY CLS.
           DISPLAY LAYOUT-LISTAGEM-DADOS.
           MOVE 8 TO LINHA.
           MOVE 0 TO TOTAL-GERAL.

           PERFORM VARYING IDX-FILIAL FROM 1 BY 1 UNTIL IDX-FILIAL > 3
               DISPLAY NOME-FILIAL(IDX-FILIAL) AT LINE LINHA COL 5
               DISPLAY VALOR-VENDAS(IDX-FILIAL) AT LINE LINHA COL 45
               
               COMPUTE TOTAL-GERAL = TOTAL-GERAL + 
                                     VALOR-VENDAS(IDX-FILIAL)
               ADD 2 TO LINHA
           END-PERFORM.

           DISPLAY "------------------------" AT LINE LINHA COL 40.
           ADD 1 TO LINHA.
           DISPLAY "TOTAL:" AT LINE LINHA COL 35.
           DISPLAY TOTAL-GERAL AT LINE LINHA COL 44 HIGHLIGHT.
           
           DISPLAY "Pressione ENTER para voltar." AT LINE 22 COL 20.
           ACCEPT TECLA-PAUSA.

       OPCAO-04-MAIOR.
           MOVE "FILIAL COM MAIOR VENDA" TO TITULO-MENU-LISTAGEM.
           DISPLAY CLS.
           DISPLAY LAYOUT-LISTAGEM-DADOS.
           
           MOVE 0 TO MAIOR-VALOR.
           MOVE 0 TO IDX-MAIOR.

           PERFORM VARYING IDX-FILIAL FROM 1 BY 1 UNTIL IDX-FILIAL > 3
               IF VALOR-VENDAS(IDX-FILIAL) > MAIOR-VALOR THEN
                   MOVE VALOR-VENDAS(IDX-FILIAL) TO MAIOR-VALOR
                   MOVE IDX-FILIAL TO IDX-MAIOR
               END-IF
           END-PERFORM.

           IF IDX-MAIOR > 0 THEN
               DISPLAY "Vencedora:" AT LINE 10 COL 10
               DISPLAY NOME-FILIAL(IDX-MAIOR) AT LINE 10 COL 25
                       HIGHLIGHT
               DISPLAY "Valor:" AT LINE 12 COL 10
               DISPLAY MAIOR-VALOR AT LINE 12 COL 25 HIGHLIGHT
           ELSE
               DISPLAY "Sem dados registados." AT LINE 10 COL 10
           END-IF.
           
           DISPLAY "Pressione ENTER para voltar." AT LINE 20 COL 20.
           ACCEPT TECLA-PAUSA.

       OPCAO-05-GUARDAR.
           OPEN OUTPUT FICHEIRO-VENDAS.
           PERFORM VARYING IDX-FILIAL FROM 1 BY 1 UNTIL IDX-FILIAL > 3
               MOVE NOME-FILIAL(IDX-FILIAL) TO REG-NOME-FILIAL
               MOVE VALOR-VENDAS(IDX-FILIAL) TO REG-VALOR-VENDAS
               WRITE REGISTO-VENDAS
           END-PERFORM.
           CLOSE FICHEIRO-VENDAS.
           
           DISPLAY "Ficheiro VENDAS.DAT gravado!" AT LINE 22 COL 25 
                   BLINK.
           ACCEPT TECLA-PAUSA.

       OPCAO-06-LER.
           OPEN INPUT FICHEIRO-VENDAS.
           PERFORM VARYING IDX-FILIAL FROM 1 BY 1 UNTIL IDX-FILIAL > 3
               READ FICHEIRO-VENDAS
                   AT END 
                       MOVE SPACES TO NOME-FILIAL(IDX-FILIAL)
                       MOVE 0 TO VALOR-VENDAS(IDX-FILIAL)
                   NOT AT END
                       MOVE REG-NOME-FILIAL TO NOME-FILIAL(IDX-FILIAL)
                       MOVE REG-VALOR-VENDAS TO 
                            VALOR-VENDAS(IDX-FILIAL)
               END-READ
           END-PERFORM.
           CLOSE FICHEIRO-VENDAS.
           
           DISPLAY "Dados carregados com sucesso!" AT LINE 22 COL 25 
                   BLINK.
           ACCEPT TECLA-PAUSA.
