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
           88 VALIDAR-WRK-CONFIRMA             VALUE "S","s","N","n".
       
      * Variaveis de Formatacao
       77 WRK-SAIDA-KMS                        PIC Z(6)9.
       77 WRK-SAIDA-PRECO                      PIC Z(6)9,99.
       77 WRK-SAIDA-IVA                        PIC Z(5)9,99.
       77 WRK-SAIDA-TOTAL                      PIC Z(6)9,99.
       77 WRK-SAIDA-ACUMULADOR                 PIC Z(8)9,99.
       77 WRK-LINHA                            PIC 9(2).
       
      * Variaveis de Logica
       77 WRK-BUSCA-MATRICULA                  PIC X(8).
       77 WRK-BUSCA-MARCA                      PIC X(15).
       77 WRK-VALOR-IVA                        PIC 9(6)V99.
       77 WRK-VALOR-FINAL                      PIC 9(7)V99.
       77 WRK-CONTADOR                         PIC 9(4).
       77 WRK-ACUMULADOR                       PIC 9(9)V99.
       77 WRK-MAX-PRECO                        PIC 9(6)V99.
       77 WRK-MAX-MATRICULA                    PIC X(8).
       77 WRK-MAX-MARCA                        PIC X(15).
       77 WRK-ENCONTRADO                       PIC X VALUE "N".

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
           05 COL 1 VALUE "                MODELO:        "  LINE 6.
           05 COL 1 VALUE "             MATRICULA:        "  LINE 7.
           05 COL 1 VALUE "          NOME CLIENTE:        "  LINE 8.
           05 COL 1 VALUE "       CONTATO CLIENTE:        "  LINE 9.
           05 COL 1 VALUE "           ANO FABRICO:        "  LINE 10.
           05 COL 1 VALUE "                   KMS:        "  LINE 11.
           05 COL 1 VALUE "                 PRECO:        "  LINE 12.

       01 LAYOUT-LISTAGEM.
           05 COL 1 VALUE "LISTAGEM DE VIATURAS"                LINE 1.
           05 COL 1 VALUE "MARCA           MODELO          MATRICULA  
      -    " KMS       PRECO"                               LINE 3.
           05 COL 1 VALUE "-------------------------------------------
      -    "------------------"                                 LINE 4.

       01 LAYOUT-LISTAGEM-IVA.
           05 COL 1 VALUE "LISTAGEM COM IVA (23%)"              LINE 1.
           05 COL 1 VALUE "MATRICULA  PRECO BASE   VALOR IVA    PRECO 
      -    "FINAL"                                              LINE 3.
           05 COL 1 VALUE "-------------------------------------------
      -    "----"                                               LINE 4.

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
               WHEN 1 PERFORM NOVA-VENDA
               WHEN 2 PERFORM PESQUISA-MATRICULA
               WHEN 3 PERFORM LISTAR-VIATURAS
               WHEN 4 PERFORM LISTAR-POR-MARCA
               WHEN 5 PERFORM LISTAGEM-COM-IVA
               WHEN 6 PERFORM LISTAR-ANO-MENOR-2023
               WHEN 7 PERFORM CONTAGEM-POR-MARCA
               WHEN 8 PERFORM TOTAIS-POR-MARCA
               WHEN 9 PERFORM MAIOR-VENDA
           END-EVALUATE.
       PARAGRAFO-FIM.
           EXIT.

       NOVA-VENDA.
           DISPLAY CLS.
           DISPLAY FORM-VENDA.
           ACCEPT DIA-VENDA    AT 0424.
           ACCEPT MES-VENDA    AT 0427.
           ACCEPT ANO-VENDA    AT 0430.
           ACCEPT MARCA        AT 0524.
           ACCEPT MODELO       AT 0624.
           ACCEPT MATRICULA    AT 0724.
           ACCEPT NOME-CLIENTE AT 0824.
           ACCEPT CONTATO-CLIENTE AT 0924.
           ACCEPT ANO-FABRICO     AT 1024.
           ACCEPT KMS-ATUAL       AT 1124.
           ACCEPT PRECO-VENDA     AT 1224.
           
           DISPLAY "CONFIRMA OS DADOS DIGITADOS (S/N):" AT 1401.
           PERFORM WITH TEST AFTER UNTIL VALIDAR-WRK-CONFIRMA
               ACCEPT WRK-CONFIRMA AT 1435
               IF(NOT VALIDAR-WRK-CONFIRMA) THEN
                   DISPLAY "OPCAO INVALIDA!" AT 1440 
                       FOREGROUND-COLOR 4 HIGHLIGHT
               ELSE
                   DISPLAY " " ERASE EOL AT 1440
               END-IF
           END-PERFORM.

           IF (WRK-CONFIRMA="S" OR WRK-CONFIRMA="s") THEN
               OPEN EXTEND FVIATURA
               WRITE REGISTO
               CLOSE FVIATURA
               DISPLAY "REGISTO INSERIDO. ENTER PARA CONTINUAR"
                   FOREGROUND-COLOR 2 HIGHLIGHT AT 1601
               ACCEPT OMITTED AT 1701
           END-IF.

       PESQUISA-MATRICULA.
           DISPLAY CLS.
           DISPLAY "--- PESQUISA POR MATRICULA ---" LINE 2 COL 15.
           DISPLAY "DIGITE A MATRICULA:" LINE 4 COL 5.
           ACCEPT WRK-BUSCA-MATRICULA LINE 4 COL 26.
           
           MOVE "N" TO WRK-ENCONTRADO.
           OPEN INPUT FVIATURA.
           MOVE LOW-VALUES TO REGISTO.
           
           PERFORM UNTIL REGISTO=HIGH-VALUES
               READ FVIATURA AT END MOVE HIGH-VALUES TO REGISTO
               END-READ
               
               IF (NOT REGISTO=HIGH-VALUES) THEN
                   IF MATRICULA = WRK-BUSCA-MATRICULA THEN
                       MOVE "S" TO WRK-ENCONTRADO
                       DISPLAY "MARCA: " MARCA LINE 6 COL 5
                       DISPLAY "MODELO: " MODELO LINE 7 COL 5
                       DISPLAY "CLIENTE: " NOME-CLIENTE LINE 8 COL 5
                       DISPLAY "CONTATO: " CONTATO-CLIENTE LINE 9 COL 5
                       MOVE PRECO-VENDA TO WRK-SAIDA-PRECO
                       DISPLAY "PRECO: " WRK-SAIDA-PRECO LINE 10 COL 5
                       MOVE HIGH-VALUES TO REGISTO
                   END-IF
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.

           IF WRK-ENCONTRADO = "N"
               DISPLAY "VIATURA NAO ENCONTRADA!" LINE 6 COL 5 
               FOREGROUND-COLOR 4.
           
           DISPLAY "ENTER PARA VOLTAR" LINE 15 COL 5.
           ACCEPT OMITTED.

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
                   DISPLAY WRK-SAIDA-KMS LINE WRK-LINHA COL 44
                   
                   MOVE PRECO-VENDA TO WRK-SAIDA-PRECO
                   DISPLAY WRK-SAIDA-PRECO LINE WRK-LINHA COL 54
                   
                   ADD 1 TO WRK-LINHA
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.
           DISPLAY "FIM. ENTER PARA CONTINUAR."
               FOREGROUND-COLOR 2 HIGHLIGHT LINE WRK-LINHA COL 1.
           ACCEPT OMITTED LINE WRK-LINHA COL 27.

       LISTAR-POR-MARCA.
           DISPLAY CLS.
           DISPLAY "--- LISTAR POR MARCA ---" LINE 1 COL 1.
           DISPLAY "DIGITE A MARCA A FILTRAR:" LINE 2 COL 1.
           ACCEPT WRK-BUSCA-MARCA LINE 2 COL 28.
           DISPLAY LAYOUT-LISTAGEM LINE 4 COL 1.
           
           MOVE 8 TO WRK-LINHA.
           OPEN INPUT FVIATURA.
           MOVE LOW-VALUES TO REGISTO.
           PERFORM UNTIL REGISTO=HIGH-VALUES
               READ FVIATURA AT END MOVE HIGH-VALUES TO REGISTO
               END-READ
               
               IF (NOT REGISTO=HIGH-VALUES) AND 
                  (FUNCTION UPPER-CASE(MARCA) = 
                   FUNCTION UPPER-CASE(WRK-BUSCA-MARCA)) THEN
                   DISPLAY MARCA LINE WRK-LINHA COL 1
                   DISPLAY MODELO LINE WRK-LINHA COL 17
                   DISPLAY MATRICULA LINE WRK-LINHA COL 33
                   
                   MOVE KMS-ATUAL TO WRK-SAIDA-KMS
                   DISPLAY WRK-SAIDA-KMS LINE WRK-LINHA COL 44
                   
                   MOVE PRECO-VENDA TO WRK-SAIDA-PRECO
                   DISPLAY WRK-SAIDA-PRECO LINE WRK-LINHA COL 54
                   ADD 1 TO WRK-LINHA
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.
           DISPLAY "ENTER PARA VOLTAR" LINE WRK-LINHA COL 1.
           ACCEPT OMITTED.

       LISTAGEM-COM-IVA.
           DISPLAY CLS.
           DISPLAY LAYOUT-LISTAGEM-IVA.
           MOVE 5 TO WRK-LINHA.
           OPEN INPUT FVIATURA.
           MOVE LOW-VALUES TO REGISTO.
           
           PERFORM UNTIL REGISTO=HIGH-VALUES
               READ FVIATURA AT END MOVE HIGH-VALUES TO REGISTO
               END-READ
               
               IF (NOT REGISTO=HIGH-VALUES) THEN
                   COMPUTE WRK-VALOR-IVA = PRECO-VENDA * 0,23
                   COMPUTE WRK-VALOR-FINAL = PRECO-VENDA + WRK-VALOR-IVA
                   
                   DISPLAY MATRICULA LINE WRK-LINHA COL 1
                   
                   MOVE PRECO-VENDA TO WRK-SAIDA-PRECO
                   DISPLAY WRK-SAIDA-PRECO LINE WRK-LINHA COL 12
                   
                   MOVE WRK-VALOR-IVA TO WRK-SAIDA-IVA
                   DISPLAY WRK-SAIDA-IVA LINE WRK-LINHA COL 25
                   
                   MOVE WRK-VALOR-FINAL TO WRK-SAIDA-TOTAL
                   DISPLAY WRK-SAIDA-TOTAL LINE WRK-LINHA COL 38

                   ADD 1 TO WRK-LINHA
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.
           DISPLAY "ENTER PARA VOLTAR" LINE WRK-LINHA COL 1.
           ACCEPT OMITTED.

       LISTAR-ANO-MENOR-2023.
           DISPLAY CLS.
           DISPLAY "--- VIATURAS ANTERIORES A 2023 ---" LINE 1.
           DISPLAY LAYOUT-LISTAGEM LINE 3.
           MOVE 7 TO WRK-LINHA.
           
           OPEN INPUT FVIATURA.
           MOVE LOW-VALUES TO REGISTO.
           PERFORM UNTIL REGISTO=HIGH-VALUES
               READ FVIATURA AT END MOVE HIGH-VALUES TO REGISTO
               END-READ
               
               IF (NOT REGISTO=HIGH-VALUES) AND 
                  (ANO-FABRICO < 2023) THEN
                   DISPLAY MARCA LINE WRK-LINHA COL 1
                   DISPLAY MODELO LINE WRK-LINHA COL 17
                   DISPLAY MATRICULA LINE WRK-LINHA COL 33
                   
                   MOVE KMS-ATUAL TO WRK-SAIDA-KMS
                   DISPLAY WRK-SAIDA-KMS LINE WRK-LINHA COL 44

                   MOVE PRECO-VENDA TO WRK-SAIDA-PRECO
                   DISPLAY WRK-SAIDA-PRECO LINE WRK-LINHA COL 54
                   
                   DISPLAY ANO-FABRICO LINE WRK-LINHA COL 66

                   ADD 1 TO WRK-LINHA
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.
           DISPLAY "ENTER PARA VOLTAR" LINE WRK-LINHA COL 1.
           ACCEPT OMITTED.

       CONTAGEM-POR-MARCA.
           DISPLAY CLS.
           DISPLAY "--- CONTAGEM POR MARCA ---" LINE 2.
           DISPLAY "MARCA:" LINE 4 COL 5.
           ACCEPT WRK-BUSCA-MARCA LINE 4 COL 13.
           
           MOVE 0 TO WRK-CONTADOR.
           OPEN INPUT FVIATURA.
           MOVE LOW-VALUES TO REGISTO.
           PERFORM UNTIL REGISTO=HIGH-VALUES
               READ FVIATURA AT END MOVE HIGH-VALUES TO REGISTO
               END-READ
               
               IF (NOT REGISTO=HIGH-VALUES) AND 
                  (FUNCTION UPPER-CASE(MARCA) = 
                   FUNCTION UPPER-CASE(WRK-BUSCA-MARCA)) THEN
                   ADD 1 TO WRK-CONTADOR
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.
           
           DISPLAY "TOTAL VENDIDO DA MARCA " LINE 6 COL 5.
           DISPLAY WRK-BUSCA-MARCA LINE 6 COL 30.
           DISPLAY ": " LINE 6 COL 45.
           DISPLAY WRK-CONTADOR LINE 6 COL 47 FOREGROUND-COLOR 2.
           
           DISPLAY "ENTER PARA VOLTAR" LINE 8 COL 5.
           ACCEPT OMITTED.

       TOTAIS-POR-MARCA.
           DISPLAY CLS.
           DISPLAY "--- TOTAL (EUR) POR MARCA ---" LINE 2.
           DISPLAY "MARCA:" LINE 4 COL 5.
           ACCEPT WRK-BUSCA-MARCA LINE 4 COL 13.
           
           MOVE 0 TO WRK-ACUMULADOR.
           OPEN INPUT FVIATURA.
           MOVE LOW-VALUES TO REGISTO.
           PERFORM UNTIL REGISTO=HIGH-VALUES
               READ FVIATURA AT END MOVE HIGH-VALUES TO REGISTO
               END-READ
               
               IF (NOT REGISTO=HIGH-VALUES) AND 
                  (FUNCTION UPPER-CASE(MARCA) = 
                   FUNCTION UPPER-CASE(WRK-BUSCA-MARCA)) THEN
                   COMPUTE WRK-ACUMULADOR = 
                           WRK-ACUMULADOR + PRECO-VENDA
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.
           
           DISPLAY "VALOR TOTAL ACUMULADO: " LINE 6 COL 5.
           MOVE WRK-ACUMULADOR TO WRK-SAIDA-ACUMULADOR.
           DISPLAY WRK-SAIDA-ACUMULADOR LINE 6 COL 30 
               FOREGROUND-COLOR 2.
           
           DISPLAY "ENTER PARA VOLTAR" LINE 8 COL 5.
           ACCEPT OMITTED.

       MAIOR-VENDA.
           DISPLAY CLS.
           DISPLAY "--- MAIOR VENDA REGISTADA ---" LINE 2.
           
           MOVE 0 TO WRK-MAX-PRECO.
           OPEN INPUT FVIATURA.
           MOVE LOW-VALUES TO REGISTO.
           
           PERFORM UNTIL REGISTO=HIGH-VALUES
               READ FVIATURA AT END MOVE HIGH-VALUES TO REGISTO
               END-READ
               
               IF (NOT REGISTO=HIGH-VALUES) THEN
                   IF PRECO-VENDA > WRK-MAX-PRECO THEN
                       MOVE PRECO-VENDA TO WRK-MAX-PRECO
                       MOVE MATRICULA TO WRK-MAX-MATRICULA
                       MOVE MARCA TO WRK-MAX-MARCA
                   END-IF
               END-IF
           END-PERFORM.
           CLOSE FVIATURA.
           
           IF WRK-MAX-PRECO > 0 THEN
               DISPLAY "MARCA: " LINE 4 COL 5
               DISPLAY WRK-MAX-MARCA LINE 4 COL 15
               DISPLAY "MATRICULA: " LINE 5 COL 5
               DISPLAY WRK-MAX-MATRICULA LINE 5 COL 18
               DISPLAY "VALOR: " LINE 6 COL 5
               MOVE WRK-MAX-PRECO TO WRK-SAIDA-TOTAL
               DISPLAY WRK-SAIDA-TOTAL LINE 6 COL 15 FOREGROUND-COLOR 2
           ELSE
               DISPLAY "NAO HA REGISTOS." LINE 4 COL 5
           END-IF.
           
           DISPLAY "ENTER PARA VOLTAR" LINE 8 COL 5.
           ACCEPT OMITTED.

       END PROGRAM AGUIAR.
