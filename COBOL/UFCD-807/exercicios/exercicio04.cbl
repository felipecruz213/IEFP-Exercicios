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

       01 TABELAS.
           05 TAB-INGREDIENTES  PIC X(10)   OCCURS 10.
           05 TAB-PRECOS        PIC 9V99    OCCURS 10.
              
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
       77 SAIDA-PRECO       PIC 9.99.

       77 LINHA                 PIC 99 VALUE 16.
       
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

       CARREGA-TABELAS.
           MOVE "FIAMBRE"       TO TAB-INGREDIENTES(1).
           MOVE 0.50            TO TAB-PRECOS(1).
           MOVE "ATUM   "       TO TAB-INGREDIENTES(2).
           MOVE 0.70            TO TAB-PRECOS(2).
           MOVE "ANCHOVAS"      TO TAB-INGREDIENTES(3).
           MOVE 0.40            TO TAB-PRECOS(3).
           MOVE "CAMARAO"       TO TAB-INGREDIENTES(4).
           MOVE 0.80            TO TAB-PRECOS(4).
           MOVE "BACON"         TO TAB-INGREDIENTES(5).
           MOVE 0.90            TO TAB-PRECOS(5).
           MOVE "BANANA"        TO TAB-INGREDIENTES(6).
           MOVE 0.30            TO TAB-PRECOS(6).
           MOVE "ANANAS"        TO TAB-INGREDIENTES(7).
           MOVE 0.40            TO TAB-PRECOS(7).
           MOVE "AZEITONAS"     TO TAB-INGREDIENTES(8).
           MOVE 0.30            TO TAB-PRECOS(8).
           MOVE "COGUMELOS"     TO TAB-INGREDIENTES(9).
           MOVE 0.60            TO TAB-PRECOS(9).
           MOVE "MILHO"         TO TAB-INGREDIENTES(10).
           MOVE 0.50            TO TAB-PRECOS(10).

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
                           DISPLAY "1-PEQUENA" AT 2449
                           ADD 3.0 TO VALOR-PAGAR
                       WHEN 2
                           DISPLAY  "MEDIA                       "
                           AT 0930                                   
                           DISPLAY "2-MEDIA" AT 2449
                           ADD 4.0 TO VALOR-PAGAR
                       WHEN 3
                           DISPLAY "GRANDE                      "
                           AT 0930
                           DISPLAY "3-GRANDE" AT 2449
                           ADD 5.0 TO VALOR-PAGAR
               END-IF
       END-PERFORM.
       
       PERFORM UNTIL VALIDAR-INGREDIENTES
           ACCEPT QUANTIDADE-INGREDIENTES AT 1117
           IF (NOT VALIDAR-INGREDIENTES)
               DISPLAY "PODE PEDIR ATE 5 INGREDIENTES!!!!!" AT 1120
           ELSE
               DISPLAY "                                  " AT 1120
           END-IF
       END-PERFORM.

       ENTRADA-INGREDIENTES.
       PERFORM QUANTIDADE-INGREDIENTES TIMES
           PERFORM WITH TEST AFTER UNTIL VALIDAR-ID-INGREDIENTE
           ACCEPT ID-INGREDIENTE LINE LINHA COL 3
             IF (NOT VALIDAR-ID-INGREDIENTE)
                 DISPLAY "INSIRA UM INGREDIENTE VALIDO!"
                 LINE LINHA COL 24
             ELSE
                  DISPLAY "                                "
                  LINE LINHA COL 24
                  DISPLAY TAB-INGREDIENTES(ID-INGREDIENTE) LINE LINHA
                  COL 24
                  MOVE TAB-PRECOS(ID-INGREDIENTE) TO SAIDA-PRECO
                  DISPLAY SAIDA-PRECO LINE LINHA COL 50
             END-IF
           END-PERFORM
           ADD 1 TO LINHA
           ADD TAB-PRECOS(ID-INGREDIENTE) TO TOTAL-INGREDIENTES
           ADD TOTAL-INGREDIENTES TO VALOR-PAGAR

           MOVE TOTAL-INGREDIENTES TO SAIDA-VALORES
           DISPLAY SAIDA-VALORES AT 2349

           MOVE VALOR-PAGAR TO SAIDA-VALORES
           DISPLAY SAIDA-VALORES AT 2549
           

           COMPUTE IVA = VALOR-PAGAR * 0.23
           MOVE IVA TO SAIDA-VALORES
           DISPLAY SAIDA-VALORES AT 2649
       END-PERFORM.
       
       ACCEPT OMITTED AT 2020.

       COMPUTE VALOR-FINAL = IVA + VALOR-PAGAR.
       MOVE VALOR-FINAL TO SAIDA-VALORES.
       DISPLAY SAIDA-VALORES AT 2749.

             
             STOP RUN.
