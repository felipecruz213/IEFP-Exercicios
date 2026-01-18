       IDENTIFICATION DIVISION.
       PROGRAM-ID. exercicio01.
       AUTHOR.
       SECURITY.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
        FILE SECTION.
        WORKING-STORAGE SECTION.

       77 INDICE                               PIC 9(2).
       77 LINHA                                PIC 9(2).

       77 ESCOLHA-MENU                         PIC 9.
           88 VALIDAR-ESCOLHA-MENU VALUES 0 THRU 7.

       01 REGISTO-FUNCIONARIOS.
           05 F-NUMERO                         PIC 9(4)    OCCURS 10.
               88 VALIDAR-F-NUMERO VALUES 1 THRU 9999.
           05 F-NOME                           PIC X(20)   OCCURS 10.
           05 F-DEPARTAMENTO                   PIC X(20)   OCCURS 10. 
           05 F-SATISFACAO                     PIC 9       OCCURS 10.
               88 VALIDAR-SATISFACAO VALUES 1 THRU 5.
       
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
            "3. Listgem de Funcionarios que Atribuiram ao"&
             "Servico a Nota Mais Alta".
           05 COL 1 LINE 10 VALUE 
            "4. Listagem de Funcionarios que Atribuiram a Nota"&
            "Mais Baixa.".
           05 COL 1 LINE 11 VALUE 
            "5. Media Global de Satisfacao obtida".
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
            "Numero".
           05 COL 10 LINE 8 VALUE 
            "Nome".
           05 COL 30 LINE 8 VALUE 
            "Departamento".
           05 COL 60 LINE 8 VALUE 
            "Grau de Satisfacao".

       PROCEDURE DIVISION.
       MOVE 1 TO ESCOLHA-MENU.
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
       DISPLAY "Aperte enter para voltar ao menu" AT 2001.
       ACCEPT OMITTED AT 2033.
       FIM-RECOLHA-DADOS.

       LISTAGEM-DEPARTAMENTO.
       
       FIM-LISTAGEM-DEPARTAMENTO.
       

      *ACCEPT OMITTED AT 0060.
