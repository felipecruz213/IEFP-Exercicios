       IDENTIFICATION DIVISION.
       PROGRAM-ID. 0808_FINAL.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL FIC-CLIENTES ASSIGN TO "CLIENTES.DAT"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           FILE STATUS IS FS
           RECORD KEY IS FS-NIF.

           SELECT OPTIONAL FIC-FATURAS ASSIGN TO "FATURAS.DAT"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           FILE STATUS IS FS2
           RECORD KEY IS FS2-NUMFAT.

       DATA DIVISION.
       FILE SECTION.
       FD FIC-CLIENTES.
       01 REGISTO-CLIENTES.
           05 FS-NIF                 PIC 9(9).
           05 FS-NOME                PIC X(50).
           05 FS-DATA-ADMISSAO.
               10 FS-ANO             PIC 9(4).
               10 FS-MES             PIC 9(2).
               10 FS-DIA             PIC 9(2).
           05 FS-EMAIL               PIC X(80).

       FD FIC-FATURAS.
       01 REGISTO-FATURAS.
           05 FS2-NUMFAT            PIC 9(3).
           05 FS2-DATA-FATURA.
               10 FS2-ANO           PIC 9(4).
               10 FS2-MES           PIC 9(2).
               10 FS2-DIA           PIC 9(2).
           05 FS2-PRAZO             PIC 9(3).
           05 FS2-VALOR             PIC 9(10)V99.
           05 FS2-PAGO              PIC X(1).
           05 FS2-NIF               PIC 9(9).

       WORKING-STORAGE SECTION.
       01 WS-MENU.
           05 FILLER PIC X(14) VALUE "26DIVOC, LDA".
           05 WS-OP PIC X(30) VALUE SPACES.

       77 WS-NUML                   PIC 9(3).
       77 WS-ESTADO                 PIC X(30).
       
       77 FS                        PIC 9(2).
           88 FS-OK                 VALUES ZEROS.
           88 FS-EOF                VALUE 10.
           88 FS-NAO-EXISTE         VALUE 23. 

       77 FS2                       PIC 9(2).
           88 FS2-OK                VALUES ZEROS.
           88 FS2-EOF               VALUE 10.
           88 FS2-NAO-EXISTE        VALUE 23.

       77 WRK-OPCAO-INICIAL         PIC 9 VALUE 9.
           88 CLIENTES              VALUE IS 1.
           88 FATURAS               VALUE IS 2.
           88 SAIR                  VALUE IS 0.

       77 WRK-OPCAO-CLI             PIC 9 VALUE 9.
           88 NOVO                  VALUE IS 1.
           88 ALTERAR               VALUE IS 2.
           88 ELIMINAR              VALUE IS 3.
           88 LISTA                 VALUE IS 4.
           88 VOLTA                 VALUE IS 0.

       77 WRK-OPCAO-FAT             PIC 9 VALUE 9.
           88 NOVA                  VALUE IS 1.
           88 ALTERAR-FAT           VALUE IS 2.
           88 ELIMINAR-FAT          VALUE IS 3.
           88 LISTA-FAT             VALUE IS 4.
           88 FATURASPAGAS          VALUE IS 5.
           88 FATURASDIVIDAS        VALUE IS 6.
           88 VOLTA-FAT             VALUE IS 0.

       77 WRK-CONFIRMA              PIC X.
       77 WRK-EXISTE                PIC X.
       
       01 DATA-SISTEMA.
           05 SYS-ANO               PIC 9(4).
           05 SYS-MES               PIC 9(2).
           05 SYS-DIA               PIC 9(2).

       01 WS-DATA-PT.
           05 WS-DIA-PT             PIC 9(2).
           05 FILLER                PIC X VALUE "/".
           05 WS-MES-PT             PIC 9(2).
           05 FILLER                PIC X VALUE "/".
           05 WS-ANO-PT             PIC 9(4).

       77 WS-VALOR-FMT              PIC ZZ.ZZZ.ZZ9,99.
       
       77 WRK-NIF-AUX               PIC 9(9).
       77 WRK-NUMFAT-AUX            PIC 9(3).
       77 WRK-CLIENTE-VALIDO        PIC X.

       SCREEN SECTION.
       01 LAYOUT-INICIAL.
           05 PARTE-1.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL BACKGROUND-COLOR 1.
               10 LINE WS-NUML ERASE EOL BACKGROUND-COLOR 1.
           05 CABECALHO.
               10 LINE  01 COLUMN 01 PIC X(50) FROM WS-MENU
               HIGHLIGHT FOREGROUND-COLOR 6 BACKGROUND-COLOR 1.
           05 ESTADO.
               10 LINE WS-NUML COLUMN 2 ERASE EOL PIC X(30)
               FROM WS-ESTADO HIGHLIGHT FOREGROUND-COLOR 6
               BACKGROUND-COLOR 1.

       01 CLS BLANK SCREEN.
       
       01 LAYOUT-MENU FOREGROUND-COLOR 6.
           05 LINE 6 COLUMN 15 VALUE "****** GESTAO DE FATURAS *******".
           05 LINE 7 COLUMN 15 VALUE "1- CLIENTES".
           05 LINE 8 COLUMN 15 VALUE "2- FATURAS".
           05 LINE 9 COLUMN 15 VALUE "0- SAIR".
           05 LINE 10 COLUMN 15 VALUE "DIGITE SUA ESCOLHA: ".
           05 LINE 10 COLUMN PLUS 1 USING WRK-OPCAO-INICIAL AUTO.

       01 LAYOUT-GESTAO-CLIENTES.
           05 LINE 6 COLUMN 15 VALUE "****** MENU DE CLIENTES *******".
           05 LINE 7 COLUMN 15 VALUE "1- NOVO".
           05 LINE 8 COLUMN 15 VALUE "2- ALTERAR".
           05 LINE 9 COLUMN 15 VALUE "3- ELIMINAR".
           05 LINE 10 COLUMN 15 VALUE "4- LISTAGEM GERAL".
           05 LINE 11 COLUMN 15 VALUE "0- VOLTAR MENU INICIAL".
           05 LINE 13 COLUMN 15 VALUE "DIGITE SUA ESCOLHA: ".
           05 LINE 13 COLUMN PLUS 1 USING WRK-OPCAO-CLI AUTO.

       01 LAYOUT-GESTAO-FATURAS FOREGROUND-COLOR 3.
           05 LINE 6 COLUMN 15 VALUE "****** MENU DE FATURAS *******".
           05 LINE 7 COLUMN 15 VALUE "1- NOVA FATURA".
           05 LINE 8 COLUMN 15 VALUE "2- ALTERAR FATURA".
           05 LINE 9 COLUMN 15 VALUE "3- ELIMINAR FATURA".
           05 LINE 10 COLUMN 15 VALUE "4- LISTAGEM GERAL".
           05 LINE 11 COLUMN 15 VALUE "5- FATURAS PAGAS".
           05 LINE 12 COLUMN 15 VALUE "6- FATURAS EM DIVIDA".
           05 LINE 13 COLUMN 15 VALUE "0- MENU INICIAL".
           05 LINE 15 COLUMN 15 VALUE "DIGITE SUA ESCOLHA: ".
           05 LINE 15 COLUMN PLUS 1 USING WRK-OPCAO-FAT AUTO.

       PROCEDURE DIVISION.
       INICIO-PROGRAMA.
           ACCEPT DATA-SISTEMA FROM DATE YYYYMMDD
           MOVE SYS-DIA TO WS-DIA-PT
           MOVE SYS-MES TO WS-MES-PT
           MOVE SYS-ANO TO WS-ANO-PT.

           ACCEPT WS-NUML FROM LINES.
           DISPLAY CLS.
           PERFORM UNTIL SAIR
               MOVE 23 TO WS-NUML
               MOVE 0 TO WRK-OPCAO-INICIAL
               MOVE 9 TO WRK-OPCAO-CLI
               MOVE 9 TO WRK-OPCAO-FAT
               MOVE "MENU INICIAL" TO WS-OP
               MOVE "SELECIONE A SUA OPCAO" TO WS-ESTADO
               DISPLAY LAYOUT-INICIAL
               DISPLAY WS-DATA-PT FOREGROUND-COLOR 6 AT 0260
               ACCEPT LAYOUT-MENU
               EVALUATE TRUE
                   WHEN CLIENTES
                       PERFORM INICIO-CLIENTE THRU FIM-CLIENTE
                   WHEN FATURAS
                       PERFORM INICIO-FATURA THRU FIM-FATURA
                   WHEN SAIR
                       STOP RUN
               END-EVALUATE
           END-PERFORM.
       FIM.

      *------------------------------CLIENTES---------------------------
       INICIO-CLIENTE.
           PERFORM UNTIL VOLTA
               MOVE 23 TO WS-NUML
               MOVE 0 TO WRK-OPCAO-CLI
               DISPLAY CLS
               MOVE "MENU CLIENTE" TO WS-OP
               MOVE "SELECIONE A SUA OPCAO" TO WS-ESTADO
               DISPLAY LAYOUT-INICIAL
               DISPLAY WS-DATA-PT AT 0260
               ACCEPT LAYOUT-GESTAO-CLIENTES
               EVALUATE TRUE
                   WHEN NOVO
                       PERFORM INICIO-NOVO
                   WHEN ALTERAR
                       PERFORM INICIO-ALTERAR
                   WHEN ELIMINAR
                       PERFORM INICIO-ELIMINAR
                   WHEN LISTA
                       PERFORM INICIO-LISTAR-CLIENTE
                   WHEN VOLTA
                       CONTINUE
               END-EVALUATE
           END-PERFORM.
       FIM-CLIENTE.

       INICIO-NOVO.
           DISPLAY CLS.
           DISPLAY "NOVO CLIENTE" AT 0415.
           DISPLAY "NIF:" AT 0605.     
           ACCEPT FS-NIF AT 0610. 
           
           OPEN I-O FIC-CLIENTES.
           MOVE "N" TO WRK-EXISTE.
           READ FIC-CLIENTES KEY IS FS-NIF
               INVALID KEY MOVE "N" TO WRK-EXISTE
               NOT INVALID KEY MOVE "S" TO WRK-EXISTE
           END-READ.

           IF WRK-EXISTE="N" THEN
               DISPLAY "NOME:" AT 0805
               ACCEPT FS-NOME AT 0812
               DISPLAY "DATA ADMISSAO (AAAA/MM/DD):" AT 1005
               ACCEPT FS-ANO AT 1033 AUTO
               DISPLAY "/" AT 1037
               ACCEPT FS-MES AT 1038 AUTO
               DISPLAY "/" AT 1040
               ACCEPT FS-DIA AT 1041 AUTO
               DISPLAY "EMAIL:" AT 1205
               ACCEPT FS-EMAIL AT 1212
               
               DISPLAY "CONFIRMAR REGISTO (S/N)?" AT 2005
               ACCEPT WRK-CONFIRMA AT 2030 AUTO

               IF WRK-CONFIRMA="S" OR WRK-CONFIRMA="s" THEN
                   WRITE REGISTO-CLIENTES
                       INVALID KEY DISPLAY "ERRO GRAVACAO" AT 2205
                   END-WRITE
                   DISPLAY "REGISTO INSERIDO COM SUCESSO!" AT 2205
               ELSE
                   DISPLAY "OPERACAO CANCELADA." AT 2205
               END-IF
           ELSE
               DISPLAY "ERRO: NIF JA EXISTE!" AT 2205
           END-IF.
           
           CLOSE FIC-CLIENTES.
           DISPLAY "APERTE ENTER PARA CONTINUAR." AT 2305
           ACCEPT OMITTED AT 2335.

       INICIO-ALTERAR.
           DISPLAY CLS.
           DISPLAY "ALTERAR CLIENTE" AT 0415.
           DISPLAY "NIF A ALTERAR:" AT 0605.
           ACCEPT WRK-NIF-AUX AT 0620.

           OPEN I-O FIC-CLIENTES.
           MOVE WRK-NIF-AUX TO FS-NIF.
           READ FIC-CLIENTES KEY IS FS-NIF
               INVALID KEY 
                   DISPLAY "CLIENTE NAO ENCONTRADO." AT 2205
               NOT INVALID KEY
                   DISPLAY "NOME ATUAL: " AT 0805
                   DISPLAY FS-NOME AT 0820
                   DISPLAY "NOVO NOME : " AT 0905
                   ACCEPT FS-NOME AT 0920

                   DISPLAY "EMAIL ATUAL: " AT 1105
                   DISPLAY FS-EMAIL AT 1120
                   DISPLAY "NOVO EMAIL : " AT 1205
                   ACCEPT FS-EMAIL AT 1220

                   REWRITE REGISTO-CLIENTES
                       INVALID KEY DISPLAY "ERRO AO ALTERAR." AT 2205
                       NOT INVALID KEY 
                           DISPLAY "ALTERADO COM SUCESSO!" AT 2205
                   END-REWRITE
           END-READ.
           CLOSE FIC-CLIENTES.
           DISPLAY "APERTE ENTER." AT 2305
           ACCEPT OMITTED AT 2320.

       INICIO-ELIMINAR.
           DISPLAY CLS.
           DISPLAY "ELIMINAR CLIENTE" AT 0415.
           DISPLAY "NIF A ELIMINAR:" AT 0605.
           ACCEPT WRK-NIF-AUX AT 0622.

           OPEN I-O FIC-CLIENTES.
           MOVE WRK-NIF-AUX TO FS-NIF.
           READ FIC-CLIENTES KEY IS FS-NIF
               INVALID KEY
                   DISPLAY "CLIENTE NAO ENCONTRADO." AT 2205
               NOT INVALID KEY
                   DISPLAY "NOME: " AT 0805 
                   DISPLAY FS-NOME AT 0812
                   DISPLAY "TEM A CERTEZA (S/N)?" AT 1005
                   ACCEPT WRK-CONFIRMA AT 1025 AUTO
                   IF WRK-CONFIRMA = "S" OR "s"
                       DELETE FIC-CLIENTES
                           INVALID KEY DISPLAY "ERRO DELETE" AT 2205
                       END-DELETE
                       DISPLAY "ELIMINADO COM SUCESSO." AT 2205
                   ELSE
                       DISPLAY "CANCELADO." AT 2205
                   END-IF
           END-READ.
           CLOSE FIC-CLIENTES.
           DISPLAY "APERTE ENTER." AT 2305
           ACCEPT OMITTED AT 2320.

       INICIO-LISTAR-CLIENTE.
           DISPLAY CLS.
           DISPLAY "LISTAGEM DE CLIENTES" AT 0415.
           DISPLAY "NIF       NOME                 DATA       EMAIL" 
               AT 0601.
           DISPLAY "---------------------------------------------------"
               AT 0701.

           OPEN INPUT FIC-CLIENTES.
           MOVE 0 TO FS-NIF.
           START FIC-CLIENTES KEY IS NOT LESS THAN FS-NIF
               INVALID KEY DISPLAY "FICHEIRO VAZIO" AT 1005
           END-START.

           MOVE 08 TO WS-NUML.
           
           PERFORM UNTIL FS = 10
               READ FIC-CLIENTES NEXT RECORD
                   AT END 
                       MOVE 10 TO FS
                   NOT AT END
                       MOVE FS-DIA TO WS-DIA-PT
                       MOVE FS-MES TO WS-MES-PT
                       MOVE FS-ANO TO WS-ANO-PT

                       DISPLAY FS-NIF AT LINE WS-NUML COLUMN 1
                       DISPLAY FS-NOME(1:20) AT LINE WS-NUML COLUMN 11
                       DISPLAY WS-DATA-PT AT LINE WS-NUML COLUMN 32
                       DISPLAY FS-EMAIL(1:25) AT LINE WS-NUML COLUMN 43
                       ADD 1 TO WS-NUML
                       IF WS-NUML > 20
                           DISPLAY "ENTER PROXIMA PAGINA..." AT 2305
                           ACCEPT OMITTED AT 2330
                           DISPLAY CLS
                           DISPLAY "LISTAGEM DE CLIENTES" AT 0415
                           MOVE 8 TO WS-NUML
                       END-IF
               END-READ
           END-PERFORM.
           
           CLOSE FIC-CLIENTES.
           DISPLAY "FIM DA LISTAGEM. ENTER PARA SAIR." AT 2301.
           ACCEPT OMITTED AT 2335.

      *--------------------------FATURAS-------------------------------
       INICIO-FATURA.
           PERFORM UNTIL VOLTA-FAT
               MOVE 23 TO WS-NUML
               MOVE 0 TO WRK-OPCAO-FAT
               DISPLAY CLS
               MOVE "MENU FATURA" TO WS-OP
               MOVE "SELECIONE A SUA OPCAO" TO WS-ESTADO
               DISPLAY LAYOUT-INICIAL
               DISPLAY WS-DATA-PT FOREGROUND-COLOR 3 AT 0260
               ACCEPT LAYOUT-GESTAO-FATURAS
               EVALUATE TRUE
                   WHEN NOVA
                       PERFORM INICIO-NOVA-FAT
                   WHEN ALTERAR-FAT
                       PERFORM INICIO-ALTERAR-FATURA
                   WHEN ELIMINAR-FAT
                       PERFORM INICIO-ELIMINAR-FATURA
                   WHEN LISTA-FAT
                       PERFORM INICIO-LISTAR-FATURA
                   WHEN FATURASPAGAS
                     PERFORM INICIO-FATURAS-PAGAS
                   WHEN FATURASDIVIDAS
                     PERFORM INICIO-FATURAS-DIV
                   WHEN VOLTA-FAT
                      CONTINUE
               END-EVALUATE
           END-PERFORM.
       FIM-FATURA.

       INICIO-NOVA-FAT.
           DISPLAY CLS.
           DISPLAY "NOVA FATURA" AT 0415.
           DISPLAY "NUMERO FATURA:" AT 0605.
           ACCEPT FS2-NUMFAT AT 0620.

           OPEN I-O FIC-FATURAS.
           READ FIC-FATURAS KEY IS FS2-NUMFAT
               INVALID KEY MOVE "N" TO WRK-EXISTE
               NOT INVALID KEY MOVE "S" TO WRK-EXISTE
           END-READ.

           IF WRK-EXISTE = "S"
               DISPLAY "ERRO: NUMERO DE FATURA JA EXISTE." AT 2205
               CLOSE FIC-FATURAS
           ELSE
               DISPLAY "DATA (AAAA/MM/DD):" AT 0805
               ACCEPT FS2-ANO AT 0825 AUTO
               DISPLAY "/" AT 0829
               ACCEPT FS2-MES AT 0830 AUTO
               DISPLAY "/" AT 0832
               ACCEPT FS2-DIA AT 0833 AUTO
               
               DISPLAY "PRAZO (DIAS):" AT 1005
               ACCEPT FS2-PRAZO AT 1020
               
               DISPLAY "VALOR:" AT 1205
               ACCEPT FS2-VALOR AT 1215
               
               DISPLAY "PAGO (S/N):" AT 1405
               ACCEPT FS2-PAGO AT 1418 AUTO

               DISPLAY "NIF CLIENTE:" AT 1605
               ACCEPT FS2-NIF AT 1618

               CLOSE FIC-FATURAS

               OPEN INPUT FIC-CLIENTES
               MOVE FS2-NIF TO FS-NIF
               MOVE "S" TO WRK-CLIENTE-VALIDO
               READ FIC-CLIENTES KEY IS FS-NIF
                   INVALID KEY MOVE "N" TO WRK-CLIENTE-VALIDO
               END-READ
               CLOSE FIC-CLIENTES

               IF WRK-CLIENTE-VALIDO = "N"
                   DISPLAY "ERRO: CLIENTE NAO EXISTE!" AT 2205
               ELSE
                   OPEN I-O FIC-FATURAS
                   WRITE REGISTO-FATURAS
                       INVALID KEY DISPLAY "ERRO GRAVACAO" AT 2205
                   END-WRITE
                   CLOSE FIC-FATURAS
                   DISPLAY "FATURA CRIADA COM SUCESSO!" AT 2205
               END-IF
           END-IF.
           
           DISPLAY "APERTE ENTER." AT 2305.
           ACCEPT OMITTED AT 2320.


       INICIO-ALTERAR-FATURA.
           DISPLAY CLS.
           DISPLAY "ALTERAR FATURA" AT 0415.
           DISPLAY "NUM FATURA:" AT 0605.
           ACCEPT WRK-NUMFAT-AUX AT 0618.

           OPEN I-O FIC-FATURAS.
           MOVE WRK-NUMFAT-AUX TO FS2-NUMFAT.
           READ FIC-FATURAS KEY IS FS2-NUMFAT
               INVALID KEY DISPLAY "FATURA NAO EXISTE" AT 2205
               NOT INVALID KEY
                   MOVE FS2-VALOR TO WS-VALOR-FMT
                   DISPLAY "VALOR ATUAL: " AT 0805
                   DISPLAY WS-VALOR-FMT AT 0820
                   DISPLAY "NOVO VALOR : " AT 0905
                   ACCEPT FS2-VALOR AT 0920

                   DISPLAY "ESTADO PAGO (S/N): " AT 1105
                   DISPLAY FS2-PAGO AT 1125
                   DISPLAY "NOVO ESTADO      : " AT 1205
                   ACCEPT FS2-PAGO AT 1225 AUTO

                   REWRITE REGISTO-FATURAS
                   END-REWRITE
                   DISPLAY "ALTERADO COM SUCESSO." AT 2205
           END-READ.
           CLOSE FIC-FATURAS.
           DISPLAY "APERTE ENTER." AT 2305.
           ACCEPT OMITTED AT 2320.

       INICIO-ELIMINAR-FATURA.
           DISPLAY CLS.
           DISPLAY "ELIMINAR FATURA" AT 0415.
           DISPLAY "NUM FATURA:" AT 0605.
           ACCEPT WRK-NUMFAT-AUX AT 0618.

           OPEN I-O FIC-FATURAS.
           MOVE WRK-NUMFAT-AUX TO FS2-NUMFAT.
           READ FIC-FATURAS KEY IS FS2-NUMFAT
               INVALID KEY DISPLAY "FATURA NAO EXISTE" AT 2205
               NOT INVALID KEY
                   MOVE FS2-VALOR TO WS-VALOR-FMT
                   DISPLAY "VALOR: " AT 0805
                   DISPLAY WS-VALOR-FMT AT 0815
                   DISPLAY "CONFIRMA (S/N)?" AT 1005
                   ACCEPT WRK-CONFIRMA AT 1025 AUTO
                   IF WRK-CONFIRMA = "S" OR "s"
                       DELETE FIC-FATURAS
                       END-DELETE
                       DISPLAY "ELIMINADA." AT 2205
                   END-IF
           END-READ.
           CLOSE FIC-FATURAS.
           DISPLAY "APERTE ENTER." AT 2305.
           ACCEPT OMITTED AT 2320.

       INICIO-LISTAR-FATURA.
           DISPLAY CLS.
           DISPLAY "LISTAGEM GERAL FATURAS" AT 0415.
           DISPLAY "NUM  DATA        VALOR          PG  NIF" AT 0601.
           DISPLAY "--------------------------------------------------" 
              AT 0701.

           OPEN INPUT FIC-FATURAS.
           MOVE 0 TO FS2-NUMFAT.
           START FIC-FATURAS KEY IS NOT LESS THAN FS2-NUMFAT
               INVALID KEY DISPLAY "SEM FATURAS" AT 1005
           END-START.

           MOVE 8 TO WS-NUML.
           PERFORM UNTIL FS2 = 10
               READ FIC-FATURAS NEXT RECORD
                   AT END MOVE 10 TO FS2
                   NOT AT END
                       MOVE FS2-DIA TO WS-DIA-PT
                       MOVE FS2-MES TO WS-MES-PT
                       MOVE FS2-ANO TO WS-ANO-PT
                       
                       MOVE FS2-VALOR TO WS-VALOR-FMT

                       DISPLAY FS2-NUMFAT AT LINE WS-NUML COLUMN 1
                       DISPLAY WS-DATA-PT AT LINE WS-NUML COLUMN 6
                       DISPLAY WS-VALOR-FMT AT LINE WS-NUML COLUMN 18
                       DISPLAY FS2-PAGO AT LINE WS-NUML COLUMN 33
                       DISPLAY FS2-NIF AT LINE WS-NUML COLUMN 37
                       ADD 1 TO WS-NUML
                       IF WS-NUML > 20
                           DISPLAY "ENTER PARA CONTINUAR..." AT 2305
                           ACCEPT OMITTED AT 2330
                           DISPLAY CLS
                           MOVE 8 TO WS-NUML
                       END-IF
               END-READ
           END-PERFORM.
           CLOSE FIC-FATURAS.
           DISPLAY "FIM. ENTER PARA SAIR." AT 2305.
           ACCEPT OMITTED AT 2330.

       INICIO-FATURAS-PAGAS.
           DISPLAY CLS.
           DISPLAY "LISTAGEM FATURAS PAGAS" AT 0415.
           DISPLAY "NUM  DATA        VALOR            NIF" AT 0601.
           DISPLAY "--------------------------------------------------" 
               AT 0701.

           OPEN INPUT FIC-FATURAS.
           MOVE 0 TO FS2-NUMFAT.
           START FIC-FATURAS KEY IS NOT LESS THAN FS2-NUMFAT
               INVALID KEY DISPLAY "SEM FATURAS" AT 1005
           END-START.

           MOVE 8 TO WS-NUML.
           PERFORM UNTIL FS2 = 10
               READ FIC-FATURAS NEXT RECORD
                   AT END MOVE 10 TO FS2
                   NOT AT END
                    IF FS2-PAGO = "S" OR FS2-PAGO = "s"
                        MOVE FS2-DIA TO WS-DIA-PT
                        MOVE FS2-MES TO WS-MES-PT
                        MOVE FS2-ANO TO WS-ANO-PT
                        MOVE FS2-VALOR TO WS-VALOR-FMT
 
                        DISPLAY FS2-NUMFAT AT LINE WS-NUML COLUMN 1
                        DISPLAY WS-DATA-PT AT LINE WS-NUML COLUMN 6
                        DISPLAY WS-VALOR-FMT AT LINE WS-NUML COLUMN 18
                        DISPLAY FS2-NIF AT LINE WS-NUML COLUMN 35
                        ADD 1 TO WS-NUML
                       END-IF
               END-READ
           END-PERFORM.
           CLOSE FIC-FATURAS.
           DISPLAY "FIM. ENTER PARA SAIR." AT 2305.
           ACCEPT OMITTED AT 2330.

       INICIO-FATURAS-DIV.
           DISPLAY CLS.
           DISPLAY "LISTAGEM FATURAS EM DIVIDA" AT 0415.
           DISPLAY "NUM  DATA        VALOR            NIF" AT 0601.
           DISPLAY "--------------------------------------------------" 
               AT 0701.

           OPEN INPUT FIC-FATURAS.
           MOVE 0 TO FS2-NUMFAT.
           START FIC-FATURAS KEY IS NOT LESS THAN FS2-NUMFAT
               INVALID KEY DISPLAY "SEM FATURAS" AT 1005
           END-START.

           MOVE 8 TO WS-NUML.
           PERFORM UNTIL FS2 = 10
               READ FIC-FATURAS NEXT RECORD
                   AT END MOVE 10 TO FS2
                   NOT AT END
                       IF FS2-PAGO = "N" OR FS2-PAGO = "n"
                          MOVE FS2-DIA TO WS-DIA-PT
                          MOVE FS2-MES TO WS-MES-PT
                          MOVE FS2-ANO TO WS-ANO-PT
                          MOVE FS2-VALOR TO WS-VALOR-FMT
       
                          DISPLAY FS2-NUMFAT AT LINE WS-NUML COLUMN 1
                          DISPLAY WS-DATA-PT AT LINE WS-NUML COLUMN 6
                          DISPLAY WS-VALOR-FMT AT LINE WS-NUML COLUMN 18
                          DISPLAY FS2-NIF AT LINE WS-NUML COLUMN 35
                          ADD 1 TO WS-NUML
                       END-IF
               END-READ
           END-PERFORM.
           CLOSE FIC-FATURAS.
           DISPLAY "FIM. ENTER PARA SAIR." AT 2305.
           ACCEPT OMITTED AT 2330.

       END PROGRAM 0808_FINAL.
