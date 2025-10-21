      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG05.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 IDADE                PIC 9(2).
           88 VALIDAR-IDADE VALUES 18 THRU 66.
       77 ANTIGUIDADE          PIC 9(2).
           88 VALIDAR-ANTIGUIDADE VALUES 0 THRU 48.
       77 LIMITES              PIC 9(2).
       77 FILHOS               PIC 9(2).
           88 VALIDAR-FILHOS VALUES 0 THRU 99.
       77 PREMIO               PIC 9(4).
       77 SAIDA                PIC Z,ZZ9.
       77 REPETIR              PIC A.
       77 TEMP                 PIC X(2).
       SCREEN SECTION.
       01 CLS BLANK SCREEN.

       PROCEDURE DIVISION.
       INICIO.
           MOVE 0 TO PREMIO.
           DISPLAY CLS.
       LER-IDADE.
           DISPLAY "DIGITE A IDADE:" AT 0301.
           ACCEPT TEMP AT 0316.
           MOVE FUNCTION NUMVAL(TEMP) TO IDADE.
           IF(NOT VALIDAR-IDADE) THEN
               DISPLAY "A IDADE NAO E VALIDA."
               FOREGROUND-COLOR 4
               HIGHLIGHT AT 0319
               GO LER-IDADE
           ELSE
               DISPLAY " " ERASE EOL AT 0319
           END-IF.
       CALCULO.
           COMPUTE LIMITES=(IDADE - 18).
       LER-ANTIGUIDADE.
           DISPLAY "DIGITE A ANTIGUIDADE:" AT 0501.
           ACCEPT TEMP AT 0522.
           MOVE FUNCTION NUMVAL(TEMP) TO ANTIGUIDADE.
           IF(NOT VALIDAR-ANTIGUIDADE) OR (ANTIGUIDADE>LIMITES) THEN
               DISPLAY "ANTIGUIDADE INVALIDA"
               FOREGROUND-COLOR 4
               HIGHLIGHT AT 0526
               GO LER-ANTIGUIDADE
           ELSE
               DISPLAY " " ERASE EOL AT 0526
           END-IF.
       LER-FILHOS.
           DISPLAY "DIGITE O NUMERO DE FILHOS:" AT 0701.
           ACCEPT TEMP AT 0727
           MOVE FUNCTION NUMVAL(TEMP) TO FILHOS.
           IF(NOT VALIDAR-FILHOS) THEN
               DISPLAY "NUMERO DE FILHOS INVALIDO" FOREGROUND-COLOR 4
               HIGHLIGHT AT 0730
               GO LER-FILHOS
           ELSE
               DISPLAY " " ERASE EOL AT 0730
           END-IF.
       CALCULAR-PREMIO-IDADE.
           IF(IDADE>45) THEN
               COMPUTE PREMIO=(IDADE - 45)*5
           END-IF.
       CALCULO-PREMIO-ANTIGUIDADE.
           IF(ANTIGUIDADE<=10) THEN
               COMPUTE PREMIO=PREMIO+(ANTIGUIDADE*10)
           ELSE
               COMPUTE PREMIO=PREMIO+(ANTIGUIDADE - 10)*20 + 100
           END-IF.
       CALCULO-PREMIO-FILHOS.
           IF(FILHOS<=3) THEN
               COMPUTE PREMIO=PREMIO + FILHOS * 25
           ELSE
               COMPUTE PREMIO=PREMIO + 100
           END-IF.
       SAIDA-PREMIO.
           MOVE PREMIO TO SAIDA.
           DISPLAY FUNCTION CONCATENATE("O VALOR DO PREMIO E ",
           SAIDA) AT 1001.
           DISPLAY "PRETENDE CONTINUAR (S/N):" AT 1301.
           ACCEPT REPETIR AT 1326.
           IF(REPETIR="S" OR REPETIR="s") THEN
               GO INICIO
           ELSE
               DISPLAY "OBRIGADO. VOLTE SEMPRE" AT 1501
               ACCEPT OMITTED AT 1601
           END-IF.
           STOP RUN.
       END PROGRAM PROG05.