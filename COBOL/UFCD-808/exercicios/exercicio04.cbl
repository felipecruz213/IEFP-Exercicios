       IDENTIFICATION DIVISION.
       PROGRAM-ID. exercicio04.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL FALUNOS ASSIGN "ALUNOS.TXT"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WRK-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD FALUNOS.
       01 REGISTO.
           05 NUMERO-ALUNO             PIC 9(3).
           05 NOME-ALUNO               PIC X(50).
           05 TURMA                    PIC A.
           05 NOTA-PRIMEIRO-PERIODO    PIC 99V99.
           05 NOTA-SEGUNDO-PERIODO     PIC 99V99.
           05 NOTA-TERCEIRO-PERIODO    PIC 99V99.

       WORKING-STORAGE SECTION.
       77 WRK-OPCAO                    PIC 9 VALUE 9.
       77 WRK-EOF                      PIC X VALUE 'N'.
       77 WRK-CONFIRMA                 PIC X VALUE 'N'.
       77 WRK-MEDIA                    PIC 99V99.
       77 WRK-CONTA-REGISTOS           PIC 999 VALUE 0.
       77 WRK-TURMA-FILTRO             PIC A.
       
       77 WRK-FILE-STATUS              PIC X(02).

       77 NOME-ESCOLA                  PIC X(22) VALUE
            "Escola do Saber".
       77 TITULO-MENU                  PIC X(40) VALUE SPACES.

       01 DATA-AGORA.
           02 ANO                      PIC 9(4).
           02 MES                      PIC 99.
           02 DIA                      PIC 99.

       SCREEN SECTION.
       01 CLS BLANK SCREEN.

       01 MENU-PRINCIPAL.
           05 LINE 1 COL 1 PIC X(22) USING NOME-ESCOLA.
           05 LINE 1 COL 70 PIC 99 USING DIA.
           05 LINE 1 COL 72 VALUE "/".
           05 LINE 1 COL 73 PIC 99 USING MES.
           05 LINE 1 COL 75 VALUE "/".
           05 LINE 1 COL 76 PIC 9999 USING ANO.
           05 LINE 2 COL 1 VALUE "Registo de Notas" HIGHLIGHT.
           05 LINE 3 COL 1 VALUE ALL "-".
           05 LINE 4 COL 35 VALUE "Menu" HIGHLIGHT.
           05 LINE 5 COL 1 VALUE ALL "-".
           05 LINE 6 COL 10 VALUE "1 - Registar Notas".
           05 LINE 7 COL 10 VALUE "2 - Listagem Geral de Notas".
           05 LINE 8 COL 10 VALUE "3 - Listagem Geral por Turma".
           05 LINE 9 COL 10 VALUE "4 - Listagem dos Aprovados".
           05 LINE 10 COL 10 VALUE "5 - Listagem dos Reprovados".
           05 LINE 12 COL 10 VALUE "0 - Terminar o Programa".
           05 LINE 14 COL 10 VALUE "Escolha: [ ]".

       01 TELA-REGISTO.
           05 LINE 1 COL 1 VALUE "Registo de Notas" HIGHLIGHT.
           05 LINE 2 COL 1 VALUE "-----------------------------------".
           05 LINE 4 COL 1 VALUE "Numero do Aluno: ".
           05 LINE 4 COL 18 PIC 9(3) USING NUMERO-ALUNO.
           05 LINE 5 COL 1 VALUE "Nome do Aluno: ".
           05 LINE 5 COL 18 PIC X(30) USING NOME-ALUNO.
           05 LINE 6 COL 1 VALUE "Turma (A/B/C): ".
           05 LINE 6 COL 18 PIC A USING TURMA.
           05 LINE 7 COL 1 VALUE "Nota 1 Periodo: ".
           05 LINE 7 COL 18 PIC 99V99 USING NOTA-PRIMEIRO-PERIODO.
           05 LINE 8 COL 1 VALUE "Nota 2 Periodo: ".
           05 LINE 8 COL 18 PIC 99V99 USING NOTA-SEGUNDO-PERIODO.
           05 LINE 9 COL 1 VALUE "Nota 3 Periodo: ".
           05 LINE 9 COL 18 PIC 99V99 USING NOTA-TERCEIRO-PERIODO.

       01 CABECALHO-LISTAGEM.
           05 LINE 1 COL 1 PIC X(40) FROM TITULO-MENU HIGHLIGHT.
           05 LINE 3 COL 1  VALUE "Num".
           05 LINE 3 COL 6  VALUE "Nome".
           05 LINE 3 COL 38 VALUE "Turma".
           05 LINE 3 COL 45 VALUE "N1".
           05 LINE 3 COL 52 VALUE "N2".
           05 LINE 3 COL 59 VALUE "N3".
           05 LINE 3 COL 66 VALUE "Media".
           05 LINE 4 COL 1  VALUE ALL "-".

       PROCEDURE DIVISION.
       INICIO-PROGRAMA.
           MOVE FUNCTION CURRENT-DATE(1:8) TO DATA-AGORA.

           PERFORM UNTIL WRK-OPCAO = 0
               DISPLAY CLS
               DISPLAY MENU-PRINCIPAL
               ACCEPT WRK-OPCAO AT LINE 14 COL 20

               EVALUATE WRK-OPCAO
                   WHEN 1
                       PERFORM REGISTAR-DADOS
                   WHEN 2
                       MOVE "Listagem Geral de Notas" TO TITULO-MENU
                       PERFORM LISTAGEM-GERAL
                   WHEN 3
                       MOVE "Listagem por Turma" TO TITULO-MENU
                       PERFORM LISTAGEM-TURMA
                   WHEN 4
                       MOVE "Listagem Alunos Aprovados" TO TITULO-MENU
                       PERFORM LISTAGEM-APROVADOS
                   WHEN 5
                       MOVE "Listagem Alunos Reprovados" TO TITULO-MENU
                       PERFORM LISTAGEM-REPROVADOS
                   WHEN 0
                       CONTINUE
                   WHEN OTHER
                       DISPLAY "Opcao Invalida!" AT LINE 23 COL 1
                       ACCEPT OMITTED AT 2350
               END-EVALUATE
           END-PERFORM.

           STOP RUN.

       REGISTAR-DADOS.
           OPEN EXTEND FALUNOS.
           IF WRK-FILE-STATUS = "35"
               OPEN OUTPUT FALUNOS
           END-IF.

           INITIALIZE REGISTO.
           MOVE "S" TO WRK-CONFIRMA.

           DISPLAY CLS.
           DISPLAY TELA-REGISTO.

           ACCEPT NUMERO-ALUNO AT 0418.
           ACCEPT NOME-ALUNO AT 0518.
           ACCEPT TURMA AT 0618.
           MOVE FUNCTION UPPER-CASE(TURMA) TO TURMA.

           PERFORM UNTIL TURMA = "A" OR TURMA = "B" OR TURMA = "C"
               DISPLAY "Turma invalida! Use A, B ou C." AT 2301
               ACCEPT TURMA AT 0618
               MOVE FUNCTION UPPER-CASE(TURMA) TO TURMA
               DISPLAY "                              " AT 2301
           END-PERFORM.

           DISPLAY "Nota: Para 12,50 digite 1250" AT 2301.

           ACCEPT NOTA-PRIMEIRO-PERIODO AT 0718.
           PERFORM VALIDAR-NOTA-1.

           ACCEPT NOTA-SEGUNDO-PERIODO AT 0818.
           PERFORM VALIDAR-NOTA-2.

           ACCEPT NOTA-TERCEIRO-PERIODO AT 0918.
           PERFORM VALIDAR-NOTA-3.

           DISPLAY "                              " AT 2301.

           DISPLAY "Confirma gravacao? (S/N): " AT 2001.
           ACCEPT WRK-CONFIRMA AT 2027.

           IF FUNCTION UPPER-CASE(WRK-CONFIRMA) = "S"
               WRITE REGISTO
               DISPLAY "Registo gravado com sucesso!" AT 2201
           ELSE
               DISPLAY "Registo ignorado." AT 2201
           END-IF.

           CLOSE FALUNOS.
           ACCEPT OMITTED AT 2250.

       VALIDAR-NOTA-1.
           PERFORM UNTIL NOTA-PRIMEIRO-PERIODO >= 0 AND
                         NOTA-PRIMEIRO-PERIODO <= 20
              DISPLAY "Nota deve ser entre 0 e 20!" AT 2301
              ACCEPT NOTA-PRIMEIRO-PERIODO AT 0718
              DISPLAY "                           " AT 2301
           END-PERFORM.

       VALIDAR-NOTA-2.
           PERFORM UNTIL NOTA-SEGUNDO-PERIODO >= 0 AND
                         NOTA-SEGUNDO-PERIODO <= 20
              DISPLAY "Nota deve ser entre 0 e 20!" AT 2301
              ACCEPT NOTA-SEGUNDO-PERIODO AT 0818
              DISPLAY "                           " AT 2301
           END-PERFORM.

       VALIDAR-NOTA-3.
           PERFORM UNTIL NOTA-TERCEIRO-PERIODO >= 0 AND
                         NOTA-TERCEIRO-PERIODO <= 20
              DISPLAY "Nota deve ser entre 0 e 20!" AT 2301
              ACCEPT NOTA-TERCEIRO-PERIODO AT 0918
              DISPLAY "                           " AT 2301
           END-PERFORM.

       LISTAGEM-GERAL.
           PERFORM PREPARAR-LISTAGEM.

           IF WRK-EOF NOT = 'Y'
               PERFORM UNTIL WRK-EOF = 'Y'
                   READ FALUNOS
                       AT END MOVE 'Y' TO WRK-EOF
                       NOT AT END
                           PERFORM CALCULAR-MEDIA
                           PERFORM EXIBIR-LINHA
                           ADD 1 TO WRK-CONTA-REGISTOS
                   END-READ
               END-PERFORM
               PERFORM FINALIZAR-LISTAGEM
           END-IF.

       LISTAGEM-TURMA.
           DISPLAY CLS.
           DISPLAY "Introduza a Turma a filtrar (A/B/C): " AT 0505.
           ACCEPT WRK-TURMA-FILTRO AT 0538.
           MOVE FUNCTION UPPER-CASE(WRK-TURMA-FILTRO)
             TO WRK-TURMA-FILTRO.

           PERFORM PREPARAR-LISTAGEM.
           
           IF WRK-EOF NOT = 'Y'
               PERFORM UNTIL WRK-EOF = 'Y'
                   READ FALUNOS
                       AT END MOVE 'Y' TO WRK-EOF
                       NOT AT END
                           IF TURMA = WRK-TURMA-FILTRO
                               PERFORM CALCULAR-MEDIA
                               PERFORM EXIBIR-LINHA
                               ADD 1 TO WRK-CONTA-REGISTOS
                           END-IF
                   END-READ
               END-PERFORM
               PERFORM FINALIZAR-LISTAGEM
           END-IF.

       LISTAGEM-APROVADOS.
           PERFORM PREPARAR-LISTAGEM.

           IF WRK-EOF NOT = 'Y'
               PERFORM UNTIL WRK-EOF = 'Y'
                   READ FALUNOS
                       AT END MOVE 'Y' TO WRK-EOF
                       NOT AT END
                           PERFORM CALCULAR-MEDIA
                           IF WRK-MEDIA >= 9,50
                               PERFORM EXIBIR-LINHA
                               ADD 1 TO WRK-CONTA-REGISTOS
                           END-IF
                   END-READ
               END-PERFORM
               PERFORM FINALIZAR-LISTAGEM
           END-IF.

       LISTAGEM-REPROVADOS.
           PERFORM PREPARAR-LISTAGEM.

           IF WRK-EOF NOT = 'Y'
               PERFORM UNTIL WRK-EOF = 'Y'
                   READ FALUNOS
                       AT END MOVE 'Y' TO WRK-EOF
                       NOT AT END
                           PERFORM CALCULAR-MEDIA
                           IF WRK-MEDIA < 9,50
                               PERFORM EXIBIR-LINHA
                               ADD 1 TO WRK-CONTA-REGISTOS
                           END-IF
                   END-READ
               END-PERFORM
               PERFORM FINALIZAR-LISTAGEM
           END-IF.

       PREPARAR-LISTAGEM.
           OPEN INPUT FALUNOS.
           IF WRK-FILE-STATUS = "35"
               DISPLAY "Ficheiro ALUNOS.TXT ainda nao existe!" AT 2301
               DISPLAY "Registe alunos primeiro." AT 2401
               ACCEPT OMITTED
               MOVE 'Y' TO WRK-EOF
           ELSE
               MOVE 'N' TO WRK-EOF
               MOVE 0 TO WRK-CONTA-REGISTOS
               DISPLAY CLS
               DISPLAY CABECALHO-LISTAGEM
           END-IF.

       CALCULAR-MEDIA.
           COMPUTE WRK-MEDIA = (NOTA-PRIMEIRO-PERIODO +
                                NOTA-SEGUNDO-PERIODO +
                                NOTA-TERCEIRO-PERIODO) / 3.

       EXIBIR-LINHA.
           DISPLAY NUMERO-ALUNO            LINE WRK-CONTA-REGISTOS + 5
                                           COL 2.
           DISPLAY NOME-ALUNO(1:30)        LINE WRK-CONTA-REGISTOS + 5
                                           COL 6.
           DISPLAY TURMA                   LINE WRK-CONTA-REGISTOS + 5
                                           COL 40.
           DISPLAY NOTA-PRIMEIRO-PERIODO   LINE WRK-CONTA-REGISTOS + 5
                                           COL 44.
           DISPLAY NOTA-SEGUNDO-PERIODO    LINE WRK-CONTA-REGISTOS + 5
                                           COL 51.
           DISPLAY NOTA-TERCEIRO-PERIODO   LINE WRK-CONTA-REGISTOS + 5
                                           COL 58.
           DISPLAY WRK-MEDIA               LINE WRK-CONTA-REGISTOS + 5
                                           COL 66.

       FINALIZAR-LISTAGEM.
           CLOSE FALUNOS.
           DISPLAY "--------------------------------------------------"
               LINE WRK-CONTA-REGISTOS + 6 COL 1.
           DISPLAY "Total de Registos: " LINE WRK-CONTA-REGISTOS + 7
                                          COL 1.
           DISPLAY WRK-CONTA-REGISTOS    LINE WRK-CONTA-REGISTOS + 7
                                          COL 20.
           DISPLAY "Pressione ENTER para voltar."
               LINE WRK-CONTA-REGISTOS + 9 COL 1.
           ACCEPT OMITTED.
