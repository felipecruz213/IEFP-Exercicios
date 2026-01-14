       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog07_tabelas.
       DATA DIVISION.
        FILE SECTION.
        WORKING-STORAGE SECTION.
       01 TABELAS.
           05 V-NUMERO                     PIC 9(2)    OCCURS 5.
           05 V-NOME                       PIC X(30)   OCCURS 5.
           05 V-EMAIL                      PIC X(30)   OCCURS 5.
       77 INDICE                           PIC 9.
       77 LINHA                            PIC 9(2).
       77 OPCAO                            PIC 9.
           88 VALIDAR-OPCAO VALUES 1 THRU 6.
       SCREEN SECTION.
       01 CLS BLANK SCREEN.
       01 LAYOUT-MENU.
           05 COL 1 VALUE "Registo de Funcionarios" FOREGROUND-COLOR 2  
           HIGHLIGHT LINE 1.
           05 COL 1 VALUE "1- Recolher Dados" FOREGROUND-COLOR 2  
           LINE 3.      
           05 COL 1 VALUE "2- Listar Funcionarios" FOREGROUND-COLOR 2  
           LINE 5.     
           05 COL 1 VALUE "3- Pesquisar Funcionario" FOREGROUND-COLOR 2  
           LINE 7.
           05 COL 1 VALUE "4- ALterar Funcionario" FOREGROUND-COLOR 2  
           LINE 9.    
           05 COL 1 VALUE "5- Exportar Para TXT" FOREGROUND-COLOR 2  
           LINE 11.
           05 COL 1 VALUE "6- Sair" FOREGROUND-COLOR 2  
           LINE 13.
           05 COL 1 VALUE "DIGITE A SUA ACAO: [ ]" FOREGROUND-COLOR 2  
           LINE 15.
       
       01 LAYOUT-FUNCIONARIOS.
           05 COL 1 VALUE "NUMERO  NOME                   EMAIL"
           FOREGROUND-COLOR 3 HIGHLIGHT LINE 1.
           05 COL 1 VALUE "------------------------------------------"&
           "----------------------------" LINE 2.

       PROCEDURE DIVISION.
       PARAGRAFO-INICIAL.
           PERFORM PARAGRAFO-INICIO THRU PARAGRAFO-FIM UNTIL OPCAO=6.
       FIM.
           STOP RUN.
       PARAGRAFO-INICIO.
           DISPLAY CLS.
           DISPLAY LAYOUT-MENU.
           PERFORM WITH TEST AFTER UNTIL VALIDAR-OPCAO
               ACCEPT OPCAO AT 1521
               IF(NOT VALIDAR-OPCAO) THEN
                   DISPLAY "OPCAO INVALIDA" FOREGROUND-COLOR 4
                   HIGHLIGHT AT 1523
               ELSE
                   DISPLAY " " ERASE EOL AT 1523
               END-IF
           END-PERFORM.

           EVALUATE OPCAO
                WHEN 1
                    PERFORM RECOLHA-FUNCIONARIOS
                WHEN 2
                    PERFORM LISTAR-FUNCIONARIOS
           END-EVALUATE.
       PARAGRAFO-FIM.
           EXIT.
       RECOLHA-FUNCIONARIOS.
           DISPLAY CLS.
           DISPLAY LAYOUT-FUNCIONARIOS.
           MOVE 3 TO LINHA.
           PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 5
               ACCEPT V-NUMERO(INDICE)         LINE LINHA COL 1
               ACCEPT V-NOME(INDICE)           LINE LINHA COL 8
               ACCEPT V-EMAIL(INDICE)          LINE LINHA COL 36
               ADD 1 TO LINHA
           END-PERFORM.
           DISPLAY "Recolha Finalizada, Aperte ENTER para continuar"
               LINE LINHA COL 1.
           ACCEPT OMITTED LINE LINHA COL 40.


       LISTAR-FUNCIONARIOS.
           DISPLAY CLS.
           DISPLAY LAYOUT-FUNCIONARIOS.
           MOVE 3 TO LINHA.
           PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 5
               DISPLAY V-NUMERO(INDICE)         LINE LINHA COL 1
               DISPLAY V-NOME(INDICE)           LINE LINHA COL 8
               DISPLAY V-EMAIL(INDICE)          LINE LINHA COL 36
               ADD 1 TO LINHA
           END-PERFORM.
           DISPLAY "Recolha Finalizada, Aperte ENTER para continuar"
               LINE LINHA COL 1.
           ACCEPT OMITTED LINE LINHA COL 40.
           END PROGRAM prog07_tabelas.
