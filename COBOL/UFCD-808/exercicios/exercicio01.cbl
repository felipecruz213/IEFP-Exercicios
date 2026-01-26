       IDENTIFICATION DIVISION.
       PROGRAM-ID. exercicio01.
       AUTHOR.
       SECURITY.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL FIC ASSIGN "PORCOS.TXT"
           ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
        FILE SECTION.
       FD FIC.

       01 REGISTO-TXT.
           05 ARQUIVO-NUMERO                   PIC 9(4).
           05 ARQUIVO-NOME                     PIC X(20).
           05 ARQUIVO-DEPARTAMENTO             PIC X(20).
           05 ARQUIVO-SATISFACAO               PIC 9.

        WORKING-STORAGE SECTION.
       77 INDICE                               PIC 9(2).
       77 LINHA                                PIC 9(2).

       77 ESCOLHA-MENU                         PIC 9 VALUE 1.
           88 VALIDAR-ESCOLHA-MENU VALUES 0 THRU 7.

       01 REGISTO-FUNCIONARIOS.
           05 F-NUMERO                         PIC 9(4)    OCCURS 10.
               88 VALIDAR-F-NUMERO VALUES 1 THRU 9999.
           05 F-NOME                           PIC X(20)   OCCURS 10.
           05 F-DEPARTAMENTO                   PIC X(20)   OCCURS 10. 
           05 F-SATISFACAO                     PIC 9       OCCURS 10.
               88 VALIDAR-SATISFACAO VALUES 1 THRU 5.


       01 REGISTO-FUNCIONARIOS-TEMP OCCURS 10.
           05 F-NUMERO-TEMP                    PIC 9(4).
           05 F-NOME-TEMP                      PIC X(20).
           05 F-DEPARTAMENTO-TEMP              PIC X(20). 
           05 F-SATISFACAO-TEMP                PIC 9.

       77 MEDIA-GLOBAL                         PIC 9(2).
       
       SCREEN SECTION.
       01 CLS BLANK SCREEN.
       01 LAYOUT-MENU.

           05 COL 1 LINE 1 VALUE "Industria do Porco, S.A".
           05 COL 1 LINE 2 VALUE "Inquerito de satisfacao"
           HIGHLIGHT.
           05 COL 24 LINE 2 VALUE "(Servicos de Contabilidade)".

           05 COL 1 LINE 3 VALUE
            "---------------------------------------------------------".
           05 COL 28 LINE 4 VALUE "MENU" HIGHLIGHT.
           05 COL 1 LINE 5 VALUE
            "---------------------------------------------------------".

           05 COL 1 LINE 7 VALUE 
           "1. Recolha de Dados.".
           05 COL 1 LINE 8 VALUE
            "2. Listagem de Funcionarios por Departamento.".
           05 COL 1 LINE 9 VALUE 
            "3. Listagem de Funcionarios que Atribuiram ao"&
             " Servico a Nota Mais Alta".
           05 COL 1 LINE 10 VALUE 
            "4. Listagem de Funcionarios que Atribuiram a Nota"&
            " Mais Baixa.".
           05 COL 1 LINE 11 VALUE 
            "5. Media Global de Satisfacao Obtida".
           05 COL 1 LINE 12 VALUE 
            "6. Importar Dados do TXT".
           05 COL 1 LINE 13 VALUE 
            "7. Exportar para TXT".
           
           05 COL 1 LINE 16 VALUE
            "0. Sair do Programa".

           05 COL 1 LINE 20 VALUE 
            "Escolha: [ ]".


       01 LAYOUT-RECOLHA-FUNCIONARIOS.

       05 COL 1 LINE 1 VALUE "Industria do Porco, S.A".
           05 COL 1 LINE 2 VALUE "Inquerito de satisfacao"
           HIGHLIGHT.
           05 COL 24 LINE 2 VALUE "(Servicos de Contabilidade)".

           05 COL 1 LINE 3 VALUE
            "---------------------------------------------------------".
           05 COL 20 LINE 4 VALUE "RECOLHA DE DADOS" HIGHLIGHT.
           05 COL 1 LINE 5 VALUE
            "---------------------------------------------------------".
           05 COL 1 LINE 8 VALUE
            "Numero" HIGHLIGHT.
           05 COL 10 LINE 8 VALUE
            "Nome" HIGHLIGHT.
           05 COL 30 LINE 8 VALUE 
            "Departamento" HIGHLIGHT.
           05 COL 60 LINE 8 VALUE 
            "Grau de Satisfacao" HIGHLIGHT.

       01 LAYOUT-DEPARTAMENTO.

       05 COL 1 LINE 1 VALUE "Industria do Porco, S.A".
           05 COL 1 LINE 2 VALUE "Inquerito de satisfacao"
           HIGHLIGHT.
           05 COL 24 LINE 2 VALUE "(Servicos de Contabilidade)".

           05 COL 1 LINE 3 VALUE
            "---------------------------------------------------------".
           05 COL 20 LINE 4 VALUE "Listagem por Departamento" HIGHLIGHT.
           05 COL 1 LINE 5 VALUE
            "---------------------------------------------------------".
           05 COL 1 LINE 8 VALUE
            "Numero" HIGHLIGHT.
           05 COL 10 LINE 8 VALUE 
            "Nome" HIGHLIGHT.
           05 COL 30 LINE 8 VALUE 
            "Departamento" HIGHLIGHT.
           05 COL 60 LINE 8 VALUE 
            "Grau de Satisfacao" HIGHLIGHT.

       01 LAYOUT-NOTA-MAIS-ALTA.

       05 COL 1 LINE 1 VALUE "Industria do Porco, S.A".
           05 COL 1 LINE 2 VALUE "Inquerito de satisfacao"
           HIGHLIGHT.
           05 COL 24 LINE 2 VALUE "(Servicos de Contabilidade)".

           05 COL 1 LINE 3 VALUE
            "---------------------------------------------------------".
           05 COL 20 LINE 4 VALUE "Notas Mais Altas" HIGHLIGHT.
           05 COL 1 LINE 5 VALUE
            "---------------------------------------------------------".
           05 COL 1 LINE 8 VALUE
            "Numero" HIGHLIGHT.
           05 COL 10 LINE 8 VALUE 
            "Nome" HIGHLIGHT.
           05 COL 30 LINE 8 VALUE 
            "Departamento" HIGHLIGHT.
           05 COL 60 LINE 8 VALUE 
            "Grau de Satisfacao" HIGHLIGHT.

       01 LAYOUT-NOTA-MAIS-BAIXA.

       05 COL 1 LINE 1 VALUE "Industria do Porco, S.A".
           05 COL 1 LINE 2 VALUE "Inquerito de satisfacao"
           HIGHLIGHT.
           05 COL 24 LINE 2 VALUE "(Servicos de Contabilidade)".

           05 COL 1 LINE 3 VALUE
            "---------------------------------------------------------".
           05 COL 20 LINE 4 VALUE "Notas Mais Baixas" HIGHLIGHT.
           05 COL 1 LINE 5 VALUE
            "---------------------------------------------------------".
           05 COL 1 LINE 8 VALUE
            "Numero" HIGHLIGHT.
           05 COL 10 LINE 8 VALUE 
            "Nome" HIGHLIGHT.
           05 COL 30 LINE 8 VALUE 
            "Departamento" HIGHLIGHT.
           05 COL 60 LINE 8 VALUE 
            "Grau de Satisfacao" HIGHLIGHT.

       01 LAYOUT-MEDIA-GLOBAL.

       05 COL 1 LINE 1 VALUE "Industria do Porco, S.A".
           05 COL 1 LINE 2 VALUE "Inquerito de satisfacao"
           HIGHLIGHT.
           05 COL 24 LINE 2 VALUE "(Servicos de Contabilidade)".

           05 COL 1 LINE 3 VALUE
            "---------------------------------------------------------".
           05 COL 20 LINE 4 VALUE "MEDIA GLOBAL" HIGHLIGHT.
           05 COL 1 LINE 5 VALUE
            "---------------------------------------------------------".
           05 COL 1 LINE 8 VALUE
            "A Media De Todas as Avaliacoes e: " HIGHLIGHT.

       PROCEDURE DIVISION.
       
       INICIO-PROGRAMA.
           PERFORM INICIO-MENU THRU FIM-MENU UNTIL ESCOLHA-MENU = 0.
       FIM.
           STOP RUN.  
       INICIO-MENU.
       
       DISPLAY CLS.
       DISPLAY LAYOUT-MENU.
       ACCEPT ESCOLHA-MENU AT COL 11 LINE 20.
       EVALUATE ESCOLHA-MENU
        WHEN 1 
           PERFORM RECOLHA-DADOS
        WHEN 2
           PERFORM LISTAGEM-DEPARTAMENTO
        WHEN 3
           PERFORM CALCULAR-NOTA-MAIS-ALTA
        WHEN 4
           PERFORM CALCULAR-NOTA-MAIS-BAIXA
        WHEN 5
           PERFORM CALCULAR-MEDIA-GLOBAL
        WHEN 6
           PERFORM IMPORTAR-TXT     
        WHEN 7
           PERFORM EXPORTAR-TXT
       END-EVALUATE.

       FIM-MENU.

       RECOLHA-DADOS.
       DISPLAY CLS.
       DISPLAY LAYOUT-RECOLHA-FUNCIONARIOS.
       MOVE 9 TO LINHA.

       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
        PERFORM WITH TEST AFTER UNTIL VALIDAR-F-NUMERO(INDICE)
           ACCEPT F-NUMERO(INDICE) LINE LINHA COL 1
           IF (NOT VALIDAR-F-NUMERO(INDICE))
            DISPLAY "Insira um numero de funcionario valido"
             AT LINE LINHA COL 10
           ELSE
               DISPLAY " " ERASE EOL AT LINE LINHA COL 10
           END-IF
        END-PERFORM

           ACCEPT F-NOME(INDICE) LINE LINHA COL 10 
           ACCEPT F-DEPARTAMENTO(INDICE) LINE LINHA COL 30

       PERFORM WITH TEST AFTER UNTIL VALIDAR-SATISFACAO(INDICE)
           ACCEPT F-SATISFACAO(INDICE) LINE LINHA COL 60
           IF (NOT VALIDAR-SATISFACAO(INDICE))
            DISPLAY "Insira um numero valido!"
             AT LINE LINHA COL 62
           ELSE
               DISPLAY " " ERASE EOL AT LINE LINHA COL 62
           END-IF
        END-PERFORM
           ADD 1 TO LINHA
       END-PERFORM.
       DISPLAY "Aperte [Enter] Para Voltar ao Menu Principal"
       AT LINE 20 COL 01
       ACCEPT OMITTED AT LINE 23 COL 43.
       FIM-RECOLHA-DADOS.

       LISTAGEM-DEPARTAMENTO.
       DISPLAY CLS.
       DISPLAY LAYOUT-DEPARTAMENTO.
       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
           MOVE F-NUMERO(INDICE) TO F-NUMERO-TEMP(INDICE)
           MOVE F-NOME(INDICE) TO F-NOME-TEMP(INDICE)
           MOVE F-DEPARTAMENTO(INDICE) TO F-DEPARTAMENTO-TEMP(INDICE)
           MOVE F-SATISFACAO(INDICE) TO F-SATISFACAO-TEMP(INDICE)
       END-PERFORM.
           SORT REGISTO-FUNCIONARIOS-TEMP 
           ASCENDING F-DEPARTAMENTO-TEMP ASCENDING F-NOME-TEMP.
           MOVE 9 TO LINHA.
       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
               DISPLAY F-NUMERO-TEMP(INDICE) AT LINE LINHA COL 1
               DISPLAY F-NOME-TEMP(INDICE) AT LINE LINHA COL 10
               DISPLAY F-DEPARTAMENTO-TEMP(INDICE) AT LINE LINHA COL 30
               DISPLAY F-SATISFACAO-TEMP(INDICE) AT LINE LINHA COL 60
               ADD 1 TO LINHA
       END-PERFORM. 
       DISPLAY "Aperte [Enter] Para Voltar ao Menu Principal"
       AT LINE 20 COL 01
       ACCEPT OMITTED AT LINE 23 COL 43.
       
       FIM-LISTAGEM-DEPARTAMENTO.

       CALCULAR-NOTA-MAIS-ALTA.
       DISPLAY CLS.
       DISPLAY LAYOUT-NOTA-MAIS-ALTA.
       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
           MOVE F-NUMERO(INDICE) TO F-NUMERO-TEMP(INDICE)
           MOVE F-NOME(INDICE) TO F-NOME-TEMP(INDICE)
           MOVE F-DEPARTAMENTO(INDICE) TO F-DEPARTAMENTO-TEMP(INDICE)
           MOVE F-SATISFACAO(INDICE) TO F-SATISFACAO-TEMP(INDICE)
       END-PERFORM.
           SORT REGISTO-FUNCIONARIOS-TEMP 
           DESCENDING F-SATISFACAO-TEMP ASCENDING F-NOME-TEMP.
           MOVE 9 TO LINHA.
       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
           IF F-SATISFACAO-TEMP(INDICE) EQUALS 5
               DISPLAY F-NUMERO-TEMP(INDICE) AT LINE LINHA COL 1
               DISPLAY F-NOME-TEMP(INDICE) AT LINE LINHA COL 10
               DISPLAY F-DEPARTAMENTO-TEMP(INDICE) AT LINE LINHA COL 30
               DISPLAY F-SATISFACAO-TEMP(INDICE) AT LINE LINHA COL 60
               ADD 1 TO LINHA
           END-IF
       END-PERFORM. 
       DISPLAY "Aperte [Enter] Para Voltar ao Menu Principal"
       AT LINE 20 COL 01
       ACCEPT OMITTED AT LINE 23 COL 43.
       FIM-CALCULAR-NOTA-MAIS-ALTA.

       CALCULAR-NOTA-MAIS-BAIXA.
       DISPLAY CLS.
       DISPLAY LAYOUT-NOTA-MAIS-BAIXA.
       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
           MOVE F-NUMERO(INDICE) TO F-NUMERO-TEMP(INDICE)
           MOVE F-NOME(INDICE) TO F-NOME-TEMP(INDICE)
           MOVE F-DEPARTAMENTO(INDICE) TO F-DEPARTAMENTO-TEMP(INDICE)
           MOVE F-SATISFACAO(INDICE) TO F-SATISFACAO-TEMP(INDICE)
       END-PERFORM.
           SORT REGISTO-FUNCIONARIOS-TEMP 
           ASCENDING F-SATISFACAO-TEMP ASCENDING F-NOME-TEMP.
           MOVE 9 TO LINHA.
       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
           IF F-SATISFACAO-TEMP(INDICE) EQUALS 1
               DISPLAY F-NUMERO-TEMP(INDICE) AT LINE LINHA COL 1
               DISPLAY F-NOME-TEMP(INDICE) AT LINE LINHA COL 10
               DISPLAY F-DEPARTAMENTO-TEMP(INDICE) AT LINE LINHA COL 30
               DISPLAY F-SATISFACAO-TEMP(INDICE) AT LINE LINHA COL 60
               ADD 1 TO LINHA
           END-IF
       END-PERFORM.
       DISPLAY "Aperte [Enter] Para Voltar ao Menu Principal"
       AT LINE 20 COL 01
       ACCEPT OMITTED AT LINE 23 COL 43.
       FIM-CALCULAR-NOTA-MAIS-BAIXA.

       CALCULAR-MEDIA-GLOBAL.
       MOVE 0 TO MEDIA-GLOBAL
       DISPLAY CLS.
       DISPLAY LAYOUT-MEDIA-GLOBAL.
       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
           ADD F-SATISFACAO(INDICE) TO MEDIA-GLOBAL
       END-PERFORM.
       DIVIDE 10 INTO MEDIA-GLOBAL.
       DISPLAY MEDIA-GLOBAL AT COL 35 LINE 8.
       DISPLAY "Aperte [Enter] Para Voltar ao Menu Principal"
       AT LINE 20 COL 01
       ACCEPT OMITTED AT LINE 23 COL 43.
       FIM-CALCULAR-MEDIA-GLOBAL.

       IMPORTAR-TXT.
       OPEN INPUT FIC.
       MOVE 1 TO INDICE.
       PERFORM UNTIL REGISTO-TXT=HIGH-VALUES
           READ FIC
           AT END MOVE HIGH-VALUES TO REGISTO-TXT
           END-READ
           IF(NOT REGISTO-TXT = HIGH-VALUES)
               MOVE ARQUIVO-NUMERO TO F-NUMERO(INDICE)
               MOVE ARQUIVO-NOME TO F-NOME(INDICE)
               MOVE ARQUIVO-DEPARTAMENTO TO F-DEPARTAMENTO(INDICE)
               MOVE ARQUIVO-SATISFACAO TO F-SATISFACAO(INDICE)
               ADD 1 TO INDICE
           END-IF
       END-PERFORM.
       CLOSE FIC.
       DISPLAY "ARQUIVO TXT IMPORTADO! APERTE ENTER PARA CONTINUAR"
        AT COL 25 LINE 12 HIGHLIGHT.
       ACCEPT OMITTED AT LINE 20 COL 11.
       FIM-IMPORTAR-TXT.


       EXPORTAR-TXT.
       OPEN OUTPUT FIC.
       PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > 10
           MOVE F-NUMERO(INDICE) TO ARQUIVO-NUMERO
           MOVE F-NOME(INDICE) TO ARQUIVO-NOME
           MOVE F-DEPARTAMENTO(INDICE) TO ARQUIVO-DEPARTAMENTO
           MOVE F-SATISFACAO(INDICE) TO ARQUIVO-SATISFACAO
           WRITE REGISTO-TXT
       END-PERFORM.
       CLOSE FIC.
       DISPLAY "ARQUIVO TXT EXPORTADO! APERTE ENTER PARA CONTINUAR"
        AT COL 25 LINE 13 HIGHLIGHT.
       ACCEPT OMITTED AT LINE 20 COL 11.
       GO INICIO-PROGRAMA.
       FIM-EXPORTAR-TXT.
       
      *ACCEPT OMITTED AT 0060.
