       IDENTIFICATION DIVISION.
       PROGRAM-ID. exercicio04.
       AUTHOR. .
       INSTALLATION.  where.
       DATE-WRITTEN.  11/11/2025.
       DATE-COMPILED. 11/11/2025.
       SECURITY.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. pc.
       OBJECT-COMPUTER. pc.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
        FILE SECTION.
        WORKING-STORAGE SECTION.
      *VARIAVEIS TEMPORARIAS PARA A INTRODUÇÃO DE DADOS
       77 TEMP-NOME                PIC X(20).
      *77 TEMP-TELEFONE            PIC ZZZ-ZZZ.

      *INFORMAÇÕES DO CLIENTE  
       77 NOME-CLIENTE             PIC X(20).
       77 TELEFONE-CLIENTE         PIC 9(6).

      * DETALHES PEDIDO 
       77 TIPO-PIZZA               PIC 1(1).
           88 VALIDAR-TAMANHO VALUES 1 THRU 3.
       
      * VARIAVEIS RESERVADAS PARA CALCULOS 
       77 QUANTIDADE-INGREDIENTES  PIC 9(1).
           88 VALIDAR-INGREDIENTES VALUES 1 THRU 5.
       
       77 ID-INGREDIENTE           PIC 9(2).
           88 VALIDAR-ID-INGREDIENTE VALUES 1 THRU 10.
       77 CONTADOR-INGREDIENTES    PIC 9(2).
       
       77 NUM-PEDIDO               PIC 9(4) VALUE 1.
       
       77 VALOR-PAGAR              PIC 9(4)V99.
       77 TOTAL-INGREDIENTES       PIC 9(6)V99.
       77 IVA                      PIC 9(4)V99.
       77 VALOR-FINAL              PIC 9(4)V99.
       77 SAIDA-VALORES            PIC ZZ,ZZ9.99.
       77 VALOR-INGREDIENTES       PIC 9(4)V99.
       77 SAIDA-INGREDIENTES       PIC Z,ZZ9.99.


       
      * VARIAVEIS RESERVADAS PARA A HORA E DATA DO SISTEMA 
       01 DATA-SISTEMA.
           05 ANO-SISTEMA          PIC 9(4).
           05 MES-SISTEMA          PIC 9(2).
           05 DIA-SISTEMA          PIC 9(2).  

       01 TEMPO-SISTEMA.
           05 HORA-SISTEMA         PIC 9(2).
           05 MINUTOS-SISTEMA      PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

      * DEFINE A DATA E HORA DE ACORDO COM 
      * O SISTEMA E PASSA PARA AS RESPECTIVAS VARIAVEIS
       ACCEPT DATA-SISTEMA FROM DATE YYYYMMDD.
       ACCEPT TEMPO-SISTEMA FROM TIME.


       DESENHAR-INTERFACE.
       DISPLAY "Pizzaria Ramalho, GestPedidosBeta-1" AT 0101.
       DISPLAY "Pizzas e Derivados, Lda." AT 0201.
       DISPLAY "-------------------------------------" AT 0301.

      *Seçao de dados do pedido e data/hora 
       DISPLAY FUNCTION CONCATENATE("N.Pedido: ",NUM-PEDIDO) AT 0501.
       DISPLAY FUNCTION CONCATENATE("Data: "DIA-SISTEMA, "/",
        MES-SISTEMA, "/",ANO-SISTEMA) AT 0601.
       DISPLAY FUNCTION CONCATENATE("HORA: ",HORA-SISTEMA,
        ":", MINUTOS-SISTEMA) AT 0620.

      *Seção de seleção de tamanho da pizza 
       DISPLAY "[1]-Pequena [2]-Media [3]-Grande" AT 0801.
       DISPLAY "Tipo de Pizza Pretendido: " AT 0901.

      *Seção da tabela de ingredigentes 
       DISPLAY "N.Ingredientes: " AT 1101.

       DISPLAY "------------------------------------------------------"
       AT 1301.
       DISPLAY "COD.Ingrediente" AT 1401.
       DISPLAY "Ingrediente" AT 1424.
       DISPLAY "Preco" AT 1450.

       DISPLAY "------------------------------------------------------"
       AT 1501.

       DISPLAY "------------------------------------------------------"
       AT 2201.

      *Seção com os dados Finais. 
       DISPLAY "Total Ingredientes: " AT 2329.
       DISPLAY "Tipo de Pizza: " AT 2429.
       DISPLAY "A Pagar: " AT 2529.
       DISPLAY "IVA(23%): " AT 2629.
       DISPLAY "Final: " AT 2729.

      *seção de dados do cliente. 
       DISPLAY "Cliente:____________________" AT 0540.
       DISPLAY "Contato:___________" AT 0640.
       
      *Entrada de Dados  
       ACCEPT NOME-CLIENTE AT 0548.
       ACCEPT TELEFONE-CLIENTE AT 0648.

       PERFORM UNTIL VALIDAR-TAMANHO
           ACCEPT TIPO-PIZZA AT 0927
               IF (NOT VALIDAR-TAMANHO)
                   DISPLAY "Insira um tamanho valido!!!!" AT 0930
               ELSE
                   EVALUATE TIPO-PIZZA
                       WHEN 1
                           DISPLAY  "PEQUENA                     " 
                           AT 0930
                       WHEN 2
                           DISPLAY  "MEDIA                       "
                           AT 0930                                   
                       WHEN 3
                            DISPLAY "GRANDE                      "
                           AT 0930
               END-IF
       END-PERFORM.
       
       MOVE 16 TO CONTADOR-INGREDIENTES.
       PERFORM UNTIL VALIDAR-INGREDIENTES
           ACCEPT QUANTIDADE-INGREDIENTES AT 1117
           IF (NOT VALIDAR-INGREDIENTES)
               DISPLAY "PODE PEDIR ATE 5 INGREDIENTES!!!!!" AT 1120
           ELSE
               DISPLAY "                                  " AT 1120
           END-IF
       END-PERFORM.

       ENTRADA-INGREDIENTES.
       IF(CONTADOR-INGREDIENTES >= QUANTIDADE-INGREDIENTES + 16)
           GO TO FIM-ENTRADA-INGREDIENTES
       END-IF.
           
       ACCEPT ID-INGREDIENTE AT COLUMN 02 LINE CONTADOR-INGREDIENTES
       IF (NOT VALIDAR-ID-INGREDIENTE)
           DISPLAY "INSIRA UM INGREDIENTE VALIDO" 
           AT COLUMN 14 LINE CONTADOR-INGREDIENTES
           GO TO ENTRADA-INGREDIENTES
       ELSE
           
           EVALUATE ID-INGREDIENTE
               WHEN 1
                   MOVE 0.5 TO VALOR-INGREDIENTES
                   DISPLAY "Fiambre                     " 
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   ADD 1 TO CONTADOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   GO TO ENTRADA-INGREDIENTES
               WHEN 2
                   MOVE 0.7 TO VALOR-INGREDIENTES
                   DISPLAY "Atum                        " 
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   ADD 1 TO CONTADOR-INGREDIENTES
                   GO TO ENTRADA-INGREDIENTES
               WHEN 3
                   MOVE 0.4 TO VALOR-INGREDIENTES
                   DISPLAY "Anchovas                    " 
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   ADD 1 TO CONTADOR-INGREDIENTES
                   GO TO ENTRADA-INGREDIENTES
               WHEN 4
                   MOVE 0.8 TO VALOR-INGREDIENTES
                   DISPLAY "Camarao                     " 
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   ADD 1 TO CONTADOR-INGREDIENTES
                   GO TO ENTRADA-INGREDIENTES
               WHEN 5
                   MOVE 0.9 TO VALOR-INGREDIENTES
                   DISPLAY "Bacon                       " 
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   ADD 1 TO CONTADOR-INGREDIENTES
                   GO TO ENTRADA-INGREDIENTES
               WHEN 6
                   MOVE 0.3 TO VALOR-INGREDIENTES
                   DISPLAY "Banana                      "
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   ADD 1 TO CONTADOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   GO TO ENTRADA-INGREDIENTES
               WHEN 7
                   MOVE 0.4 TO VALOR-INGREDIENTES
                   DISPLAY "Ananas                      "
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   ADD 1 TO CONTADOR-INGREDIENTES
                   GO TO ENTRADA-INGREDIENTES
               WHEN 8
                   MOVE 0.3 TO VALOR-INGREDIENTES
                   DISPLAY "Azeitonas                   "
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   ADD 1 TO CONTADOR-INGREDIENTES
                   GO TO ENTRADA-INGREDIENTES
               WHEN 9
                   MOVE 0.6 TO VALOR-INGREDIENTES
                   DISPLAY "Cogumelos                   "
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   ADD 1 TO CONTADOR-INGREDIENTES
                   GO TO ENTRADA-INGREDIENTES
               WHEN 10
                   MOVE 0.5 TO VALOR-INGREDIENTES
                   DISPLAY "Milho                       "
                   AT COLUMN 14 LINE CONTADOR-INGREDIENTES 
                   DISPLAY VALOR-INGREDIENTES 
                   AT COLUMN 45 LINE CONTADOR-INGREDIENTES
                   ADD VALOR-INGREDIENTES TO VALOR-INGREDIENTES
                   MOVE VALOR-INGREDIENTES TO SAIDA-VALORES
                   DISPLAY SAIDA-VALORES AT 2349
                   ADD 1 TO CONTADOR-INGREDIENTES
                   GO TO ENTRADA-INGREDIENTES
       END-IF.

       FIM-ENTRADA-INGREDIENTES.
       
       ACCEPT OMITTED AT 2020.


             
             STOP RUN.
