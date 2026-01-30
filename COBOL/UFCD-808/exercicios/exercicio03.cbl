      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AGUIAR.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL FVIATURA ASSIGN "AGUIAR.TXT"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD FVIATURA.
       01 REGISTO.
           05 DATA-VENDA.
               10 DIA-VENDA                        PIC 9(2).
               10 MES-VENDA                        PIC 9(2).
               10 ANO-VENDA                        PIC 9(4).
           05 MARCA                                PIC X(15).
           05 MODELO                               PIC X(15).
           05 MATRICULA                            PIC X(8).
           05 NOME-CLIENTE                         PIC X(30).
           05 CONTATO-CLIENTE                      PIC 9(9).
           05 ANO-FABRICO                          PIC 9(4).
           05 KMS-ATUAL                            PIC 9(7).
           05 PRECO-VENDA                          PIC 9(6)V99.
       WORKING-STORAGE SECTION.
           77 WRK-OPCAO                            PIC 9 VALUE 1.
           77 WRK-CONFIRMA                         PIC A.
               88 VALIDAR-WRK-CONFIRMA            VALUE "S","s","N","n".
           77 WRK-SAIDA-KMS                        PIC Z(6)9.
           77 WRK-SAIDA-PRECO                      PIC Z(6),99.
           77 WRK-LINHA                            PIC 9(2).
       SCREEN SECTION.
       01 CLS BLANK SCREEN.
       01 MENU.
           05 COL 1 VALUE "STAND AGUIAR, LDA."               LINE 1.
           05 COL 1 VALUE "------------------"               LINE 2.
           05 COL 1 VALUE "1-NOVA VENDA"                     LINE 4.
           05 COL 1 VALUE "2-PESQUISA POR MATRICULA"         LINE 5.
           05 COL 1 VALUE "3-MOSTRAR TODAS AS VIATURAS"      LINE 6.
           05 COL 1 VALUE "4-MOSTRAR VIATURAS POR MARCA"     LINE 7.
           05 COL 1 VALUE "5-LISTAGEM GERAL COM IVA E TOTAL" LINE 8.
           05 COL 1 VALUE "6-LISTAGEM ANO FABRICO<2023"      LINE 9.
           05 COL 1 VALUE "7-CONTAGEM POR MARCA"             LINE 10.
           05 COL 1 VALUE "8-TOTAIS POR MARCA"               LINE 11.
           05 COL 1 VALUE "9-MAIOR VENDA"                    LINE 12.
           05 COL 1 VALUE "0-SAIR"                           LINE 13.
           05 COL 1 VALUE "DIGITE A SUA ESCOLHA:"            LINE 15.
       01 FORM-VENDA.
           05 COL 1 VALUE "NOVA VENDA                     "  LINE 1.
           05 COL 1 VALUE "-------------------------------"  LINE 2.
           05 COL 1 VALUE "                  DATA:  -  -  "  LINE 4.
           05 COL 1 VALUE "                 MARCA:        "  LINE 5.
           05 COL 1 VALUE "                MODELO:"          LINE 6.
           05 COL 1 VALUE "             MATRICULA:"          LINE 7.
           05 COL 1 VALUE "          NOME CLIENTE:"          LINE 8.
           05 COL 1 VALUE "       CONTATO CLIENTE:"          LINE 9.
           05 COL 1 VALUE "           ANO FABRICO:"          LINE 10.
           05 COL 1 VALUE "                   KMS:"          LINE 11.
           05 COL 1 VALUE "                 PRECO:"          LINE 12.
       01 LAYOUT-LISTAGEM.
           05 COL 1 VALUE "LISTAGEM DE VIATURAS"                LINE 1.
           05 COL 1 VALUE "MARCA           MODELO         MATRICULA " &
           "    KMS         PRECO" LINE 3.
           05 COL 1 VALUE "-----------------------------------------" &
           "---------------------" LINE 4.
       PROCEDURE DIVISION.
       PARAGRAFO-INICIAL.
           PERFORM PARAGRAFO-INICIO THRU PARAGRAFO-FIM UNTIL
           (WRK-OPCAO=0).
       FIM.
           STOP RUN.
       PARAGRAFO-INICIO.
           DISPLAY CLS.
           DISPLAY MENU.
           ACCEPT WRK-OPCAO AT 1522.
           EVALUATE WRK-OPCAO
               WHEN 1
                   PERFORM NOVA-VENDA
               WHEN 3
                   PERFORM LISTAR-VIATURAS
           END-EVALUATE.
       PARAGRAFO-FIM.
           EXIT.
       NOVA-VENDA.
           DISPLAY CLS.
           DISPLAY FORM-VENDA.
           ACCEPT DIA-VENDA    AT 0424.
           ACCEPT MES-VENDA    AT 0427.
           ACCEPT ANO-VENDA    AT 0430.
           ACCEPT MARCA        AT 0524 PROMPT.
           ACCEPT MODELO       AT 0624 PROMPT.
           ACCEPT MATRICULA    AT 0724 PROMPT.
           ACCEPT NOME-CLIENTE AT 0824 PROMPT.
           ACCEPT CONTATO-CLIENTE AT 0924 PROMPT.
           ACCEPT ANO-FABRICO     AT 1024.
           ACCEPT KMS-ATUAL       AT 1124.
           ACCEPT PRECO-VENDA     AT 1224.
      *CONFIRMAR A GRAVACAO NO FICHEIRO
           DISPLAY "CONFIRMA OS DADOS DIGITADOS (S/N):" AT 1401.
           PERFORM WITH TEST AFTER UNTIL VALIDAR-WRK-CONFIRMA
               ACCEPT WRK-CONFIRMA AT 1435
               IF(NOT VALIDAR-WRK-CONFIRMA) THEN
                   DISPLAY "OPCAO INVALIDA!" AT 1440 FOREGROUND-COLOR 4
                   HIGHLIGHT
               ELSE
                   DISPLAY " " ERASE EOL AT 1440
               END-IF
           END-PERFORM.
           IF (WRK-CONFIRMA="S" OR WRK-CONFIRMA="s") THEN
               OPEN EXTEND FVIATURA
               WRITE REGISTO
               CLOSE FVIATURA
               DISPLAY "REGISTO INSERIDO. ENTER PARA CONTINUAR"
               FOREGROUND-COLOR 2 HIGHLIGHT
               AT 1601
               ACCEPT OMITTED AT 1701
           END-IF.
       LISTAR-VIATURAS.
           DISPLAY CLS.
           DISPLAY LAYOUT-LISTAGEM.
           MOVE 5 TO WRK-LINHA.
           OPEN INPUT FVIATURA.
           MOVE LOW-VALUES TO REGISTO.
           PERFORM UNTIL REGISTO=HIGH-VALUES
               READ FVIATURA
                   AT END MOVE HIGH-VALUES TO REGISTO
               END-READ
               IF (NOT REGISTO=HIGH-VALUES) THEN
                   DISPLAY MARCA LINE WRK-LINHA COL 1
                   DISPLAY MODELO LINE WRK-LINHA COL 17
                   DISPLAY MATRICULA LINE WRK-LINHA COL 33
                   MOVE KMS-ATUAL TO WRK-SAIDA-KMS
                   DISPLAY WRK-SAIDA-KMS LINE WRK-LINHA COL 43
                   MOVE PRECO-VENDA TO WRK-SAIDA-PRECO
                   DISPLAY WRK-SAIDA-PRECO LINE WRK-LINHA COL 53
                   ADD 1 TO WRK-LINHA
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.
           DISPLAY "FIM. ENTER PARA CONTINUAR."
           FOREGROUND-COLOR 2 HIGHLIGHT LINE WRK-LINHA COL 1.
           ACCEPT OMITTED LINE WRK-LINHA COL 27.
       END PROGRAM AGUIAR.