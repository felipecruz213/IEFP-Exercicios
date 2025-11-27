      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RAMALHO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 TABELAS.
           05 TAB-INGREDIENTES  PIC X(10)   OCCURS 10.
           05 TAB-PRECOS        PIC 9V99    OCCURS 10.
       77 NUMERO-INGREDIENTES   PIC 9.
           88 VALIDAR-NUMERO-INGREDIENTES VALUES 0 THRU 5.
       77 CODIGO-INGREDIENTE    PIC 99.
           88 VALIDAR-CODIGO-INGREDIENTE  VALUES 1 THRU 10.
       77 LINHA                 PIC 99 VALUES 15.
       77 SAIDA-PRECO           PIC 9.99.
       SCREEN SECTION.
       01 CLS                  BLANK SCREEN.
       01 LAYOUT.
           05 COL 1 VALUE "PIZZARIA RAMALHO, GESTPEDIDOS BETA-1" LINE 1.
           05 COL 1 VALUE "PIZZAS E DERIVADOS, LDA."             LINE 2.
           05 COL 1 VALUE "------------------------------------" LINE 3.
           05 COL 1  VALUE "N. PEDIDO:" LINE 5.
           05 COL 40 VALUE "  CLIENTE:" LINE 5.
           05 COL 1  VALUE "     DATA:" LINE 6.
           05 COL 40 VALUE " CONTACTO:" LINE 6.
           05 COL 1  VALUE "[1] PEQUENA [2] MEDIA [3] GRANDE" LINE 8.
           05 COL 1  VALUE "TIPO DE PIZA PRETENDIDO:"         LINE 9.
           05 COL 1  VALUE "N. INGREDIENTES:"                 LINE 11.
           05 COL 40 VALUE "(1) FIAMBRE (0.5), (2) ATUM (0.7), " &
           "(3) ANCHOVAS (0.4), (4) CAMARAO (0.8), (5) BACON (0.9)"
           LINE 12.
           05 COL 40 VALUE "(6) BANANA (0.3), (7) ANANAS (0.4), " &
           "(8) AZEITONAS (0.3) " &
           "(9) COGUMELOS (0.6), (10) MILHO (0.5)"            LINE 13.
           05 COL 1 VALUE "--------------------------------"    LINE 12.
           05 COL 1 VALUE "COD. INGREDIENTE           PRECO"    LINE 13.
           05 COL 1 VALUE "--------------------------------"    LINE 14.
       PROCEDURE DIVISION.
       CARREGA-TABELAS.
           MOVE "FIAMBRE"       TO TAB-INGREDIENTES(1).
           MOVE 0.50            TO TAB-PRECOS(1).
           MOVE "ATUM   "       TO TAB-INGREDIENTES(2).
           MOVE 0.70            TO TAB-PRECOS(1).
           MOVE "ANCHOVAS"      TO TAB-INGREDIENTES(3).
           MOVE 0.40            TO TAB-PRECOS(3).
           MOVE "CAMARAO"       TO TAB-INGREDIENTES(4).
           MOVE 0.80            TO TAB-PRECOS(4).
           MOVE "BACON"         TO TAB-INGREDIENTES(5).
           MOVE 0.90            TO TAB-PRECOS(5).
           MOVE "BANANA"        TO TAB-INGREDIENTES(6).
           MOVE 0.30            TO TAB-PRECOS(6).
           MOVE "ANANAS"        TO TAB-INGREDIENTES(7).
           MOVE 0.40            TO TAB-PRECOS(7).
           MOVE "AZEITONAS"     TO TAB-INGREDIENTES(8).
           MOVE 0.30            TO TAB-PRECOS(8).
           MOVE "COGUMELOS"     TO TAB-INGREDIENTES(9).
           MOVE 0.60            TO TAB-PRECOS(9).
           MOVE "MILHO"         TO TAB-INGREDIENTES(10).
           MOVE 0.50            TO TAB-PRECOS(10).
       MAIN-PROCEDURE.
           DISPLAY LAYOUT.
           ACCEPT NUMERO-INGREDIENTES AT 1117.
           PERFORM NUMERO-INGREDIENTES TIMES
               ACCEPT CODIGO-INGREDIENTE LINE LINHA COL 3
               DISPLAY TAB-INGREDIENTES(CODIGO-INGREDIENTE) LINE LINHA
               COL 6
               MOVE TAB-PRECOS(CODIGO-INGREDIENTE) TO SAIDA-PRECO
               DISPLAY SAIDA-PRECO LINE LINHA COL 28
               ADD 1 TO LINHA
           END-PERFORM.
           STOP RUN.
       END PROGRAM RAMALHO.