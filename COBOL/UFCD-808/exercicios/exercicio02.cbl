       IDENTIFICATION DIVISION.
       PROGRAM-ID. exercicio02.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
        FILE SECTION.
        WORKING-STORAGE SECTION.
       77 ESCOLHA-MENU                 PIC 9.
           88 VALIDAR-ESCOLHA-MENU VALUES 0 THROUGH 6.
       
       77 NOME-EMPRESA                 PIC X(22) VALUE
        "Empresa VendeTudo, S.A".

       77 TITULO-MENU-LISTAGEM PIC (X)30.

       01 DADOS-FILIAIS.
           05 FILIAL OCCURS 3 TIMES INDEXED BY IDX-FILIAL.
           10 NOME-FILIAL              PIC X(30).

           10 VENDAS-MESES OCCURS 12 TIMES INDEXED BY IDX-MES-VENDAS.
           15 VALOR-VENDAS             PIC 9(7)V99. 
           

       01 DATA-AGORA.
           02 ANO                      PIC 9(4).
           02 MES                      PIC 99.
           02 DIA                      PIC 99.

        SCREEN SECTION.
       01 CLS BLANK SCREEN.
       
       01 MENU-PRINCIPAL.
           05 LINE 1 COL 1 PIC X(22) USING NOME-EMPRESA.
           05 LINE 1 COL 100 PIC 99 USING DIA.
           05 LINE 1 COL 102 VALUE "/".
           05 LINE 1 COL 103 PIC 99 USING MES.
           05 LINE 1 COL 105 VALUE "/".
           05 LINE 1 COL 106 PIC 9999 USING ANO.
           05 LINE 2 COL 1 VALUE "Vendas" HIGHLIGHT.
           05 LINE 2 COL 7 VALUE "(" HIGHLIGHT.
           05 LINE 2 COL 8 USING ANO HIGHLIGHT.
           05 LINE 2 COL 12 VALUE ")" HIGHLIGHT.
           05 LINE 3 COL 1 VALUE 
           "---------------------------------------------------------"&
           "---------------------------------------------------------".

           05 LINE 4 COL 55 VALUE "Menu" HIGHLIGHT.

           05 LINE 5 COL 1 VALUE 
           "---------------------------------------------------------"&
           "---------------------------------------------------------".

           05 LINE 6 VALUE "1 - Registo de Dados.". 
           05 LINE 7 VALUE "2 - Listagem de Dados.".
           05 LINE 8 VALUE "3 - Listagem de Dados com Total Final.".  
           05 LINE 9 VALUE "4 - Listar a Filial com Maior Venda".  
           05 LINE 10 VALUE "5 - Guardar num Ficheiro de Dados".
           05 LINE 11 VALUE "6 - Ler do Ficheiro de Dados".
           05 LINE 13 VALUE "0 - Terminar o Pograma".
           05 LINE 18 VALUE "Escolha: [ ]".


       01 LAYOUT-LISTAGEM-DADOS.
           05 LINE 1 COL 1 PIC X(22) USING NOME-EMPRESA.
           05 LINE 1 COL 100 PIC 99 USING DIA.
           05 LINE 1 COL 102 VALUE "/".
           05 LINE 1 COL 103 PIC 99 USING MES.
           05 LINE 1 COL 105 VALUE "/".
           05 LINE 1 COL 106 PIC 9999 USING ANO.
           05 LINE 2 COL 1 VALUE "Vendas" HIGHLIGHT.
           05 LINE 2 COL 7 VALUE "(" HIGHLIGHT.
           05 LINE 2 COL 8 USING ANO HIGHLIGHT.
           05 LINE 2 COL 12 VALUE ")" HIGHLIGHT.
           05 LINE 3 COL 1 VALUE 
           "---------------------------------------------------------"&
           "---------------------------------------------------------".

           05 LINE 4 COL 55 PIC X(30) USING
              TITULO-MENU-LISTAGEM HIGHLIGHT.

           05 LINE 5 COL 1 VALUE 
           "---------------------------------------------------------"&
           "---------------------------------------------------------".
           05 LINE 6 COL 1 VALUE "Filial" HIGHLIGHT.
           05 LINE 6 COL 40 VALUE "Mes" HIGHLIGHT.
           05 LINE 6 COL 65 VALUE "Vendas" HIGHLIGHT.

       PROCEDURE DIVISION.
       MOVE FUNCTION CURRENT-DATE TO DATA-AGORA.
       DISPLAY CLS.
       DISPLAY MENU-PRINCIPAL.
       
       INICIO-PROGRAMA.
           PERFORM INICIO-MENU THRU FIM-MENU UNTIL ESCOLHA-MENU = 0.
       FIM.
           STOP RUN.  
       INICIO-MENU.
       
       DISPLAY CLS.
       DISPLAY MENU-PRINCIPAL.
       ACCEPT ESCOLHA-MENU AT COL 14 LINE 20.
       EVALUATE ESCOLHA-MENU
        WHEN 1 
      *    PERFORM RECOLHA-DADOS
       END-EVALUATE.

       FIM-MENU.

       

       ACCEPT OMITTED AT 3030.   
       DISPLAY CLS.
       DISPLAY LAYOUT-LISTAGEM-DADOS.   
       ACCEPT OMITTED AT 3030.   
             STOP RUN.
