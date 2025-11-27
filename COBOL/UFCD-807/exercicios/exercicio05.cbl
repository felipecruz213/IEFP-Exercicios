       IDENTIFICATION DIVISION.
       PROGRAM-ID. exercicio05.
       AUTHOR. .
       INSTALLATION.  where.
       DATE-WRITTEN.  25/11/2025.
       DATE-COMPILED. 25/11/2025.
       SECURITY.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
        FILE SECTION.
        WORKING-STORAGE SECTION.
       77 ID-PEDIDO                PIC 9(1).
       77 TOTAL-PEDIDO             PIC 9(6)V99.
       77 SAIDA-PRECO              PIC 9.99.

       77 ESCOLHA-LANCHE           PIC 9(1) VALUE 1.

       01 PRODUTOS.
           05 NOME-LANCHE          PIC X(20)       OCCURS 6.
           05 PRECO-LANCHE         PIC 9(5)V99     OCCURS 6.


       77 LINHA                    PIC 9(2) VALUE 5.
       77 CONTADOR                 PIC 9(2).
       
       SCREEN SECTION.
       01 LAYOUT.
           05 COL 01 LINE 01 "EMPRESA DOS BIFES".
           
           05 COL 25 LINE 3 "Digite o N do menu: ".
           05 COL 01 LINE 4 "N".
           05 COL 03 LINE 4 "MENU".

       PROCEDURE DIVISION.
           MOVE "Hamburguer Peq."  TO NOME-LANCHE(1).
           MOVE  5.15              TO  PRECO-LANCHE(1).

           MOVE "Hamburguer Med."  TO NOME-LANCHE(2).
           MOVE  6.05              TO  PRECO-LANCHE(2).

           MOVE "Hamburguer Gra."  TO NOME-LANCHE(3).
           MOVE  7.10              TO  PRECO-LANCHE(3).
           
           MOVE "Hamburguer Sup."  TO NOME-LANCHE(4).
           MOVE  8.20              TO  PRECO-LANCHE(4).

           MOVE "Batata"           TO NOME-LANCHE(5).
           MOVE  4.50              TO  PRECO-LANCHE(5).
           
           MOVE "Salada"           TO NOME-LANCHE(6).
           MOVE  5.00              TO  PRECO-LANCHE(6).     
       DISPLAY LAYOUT.
       
       MOVE 1 TO CONTADOR.
       PERFORM 7 TIMES
           IF (NOT (CONTADOR = 7))
               DISPLAY FUNCTION CONCATENATE
               (CONTADOR," ", NOME-LANCHE(CONTADOR))
               AT COL 01 LINE LINHA
               MOVE PRECO-LANCHE(CONTADOR) TO SAIDA-PRECO
               DISPLAY SAIDA-PRECO AT COL 25 LINE LINHA
               ADD 1 TO LINHA
               ADD 1 TO CONTADOR
           ELSE
               DISPLAY "0  SAIR" AT COL 01 LINE LINHA
       END-PERFORM.

       

       PERFORM WITH TEST AFTER UNTIL (ESCOLHA-LANCHE = 0)
           ACCEPT ESCOLHA-LANCHE AT COL 45 LINE 3
           
       END-PERFORM.
       
             ACCEPT OMITTED AT 2001.
             STOP RUN.
