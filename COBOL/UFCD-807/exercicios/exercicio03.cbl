       IDENTIFICATION DIVISION.
       PROGRAM-ID. exercicio03.
       AUTHOR. .
       INSTALLATION.  where.
       DATE-WRITTEN.  30/10/2025.
       DATE-COMPILED. 30/10/2025.
       SECURITY.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. pc.
       OBJECT-COMPUTER. pc.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
       77 TEMP                                 PIC X(6).
       77 SAIDA                                PIC Z,ZZZ,ZZ9.99.
       77 SAIDA-INTEIRO                        PIC ZZZZZZZZZZZZ.

       77  TOTALFAMILIAS                       PIC 9(2).

       77  CONTAGEMFAMILIA                     PIC 9(2).
       
       77  RESIDENCIA                          PIC 9(1).
           88 VALIDAR-RESIDENCIA VALUES 1 THRU 3.
       77  FAMILIASCONTINENTE                  PIC 9(3).
       77  FAMILIASACORES                      PIC 9(3).
       77  FAMILIASMADEIRA                     PIC 9(3).

       77  IDADEPAI                            PIC 9(3).
           88 VALIDAR-IDADE-PAI VALUES 18 THRU 999.
       77  IDADEMAE                            PIC 9(3).
           88 VALIDAR-IDADE-MAE VALUES 18 THRU 999.
       77  QUANTIDADEFILHOS                    PIC 9(3).
       77  RENDIMENTO                          PIC 9(6)V99.
   
       77  RENDIMENTOMEDIO                     PIC 9(6)V99.
       77  RENDIMENTOMEDIODOISFILHOS           PIC 9(6)V99.
       77  MEDIAFILHOS                         PIC 9(3).

       77  MENOSQUEDOISFILHOS                   PIC 9(3).
       77  MAISQUEDOISFILHOS                   PIC 9(3).
       77  IDADEMEDIAPAIS                      PIC 9(3).

       SCREEN SECTION.
       01 CLS BLANK SCREEN.

       PROCEDURE DIVISION.
            INICIO.
           
           MOVE 0 TO FAMILIASACORES.
           MOVE 0 TO FAMILIASCONTINENTE.
           MOVE 0 TO FAMILIASMADEIRA.

           MOVE 1 TO CONTAGEMFAMILIA.

           DISPLAY "------QUESTIONARIO DE FAMILIAS------" AT 0101.
              
           DISPLAY "Quantas familias?: " AT 0301.
           ACCEPT TEMP AT 0320.
           MOVE TEMP TO TOTALFAMILIAS.

           DISPLAY CLS.

           ENTRADA.
           DISPLAY CLS.

           DISPLAY FUNCTION CONCATENATE ("FAMILIA ", CONTAGEMFAMILIA)
            AT 0101.
           
           DISPLAY "Qual a residencia? (1-Continente 2-Acores " &
           "3-Madeira): " AT 0301.
           ACCEPT TEMP AT 0354.
           MOVE TEMP TO RESIDENCIA.

           DISPLAY "Idade do Pai: " AT 0401.
           ACCEPT TEMP AT 0414.
           MOVE TEMP TO IDADEPAI.

           DISPLAY "Idade da Mae: " AT 0501.
           ACCEPT TEMP AT 0514.
           MOVE TEMP TO IDADEMAE.

           DISPLAY "Quantos filhos: " AT 0601.
           ACCEPT TEMP AT 0616.
           MOVE TEMP TO QUANTIDADEFILHOS.
           
           DISPLAY "Rendimento Familiar: " AT 0701.
           ACCEPT TEMP AT 0721.
           MOVE TEMP TO RENDIMENTO.

           VALIDACAO.
           IF (NOT VALIDAR-RESIDENCIA) THEN
               DISPLAY CLS
               DISPLAY "INSIRA UM NUMERO DE RESIDENCIA VALIDO" AT 0101
               ACCEPT OMITTED
               GO TO ENTRADA
           END-IF.
           
           IF (NOT VALIDAR-IDADE-MAE OR NOT VALIDAR-IDADE-PAI) THEN
               DISPLAY CLS
               DISPLAY "INSIRA UMA IDADE VALIDA" AT 0101
               ACCEPT OMITTED
               GO TO ENTRADA
           END-IF.


           
           CALCULOS.
           EVALUATE RESIDENCIA
               WHEN 1
                   ADD 1 TO FAMILIASCONTINENTE
               WHEN 2
                   ADD 1 TO FAMILIASACORES
               WHEN 3
                   ADD 1 TO FAMILIASMADEIRA
           END-EVALUATE.           

           IF (QUANTIDADEFILHOS <= 2) THEN
                 ADD 1 TO MENOSQUEDOISFILHOS
                 ADD RENDIMENTO TO RENDIMENTOMEDIODOISFILHOS
           END-IF.

           IF (QUANTIDADEFILHOS > 2) THEN
               ADD 1 TO MAISQUEDOISFILHOS
           END-IF.

           ADD IDADEMAE TO IDADEMEDIAPAIS.
           ADD IDADEPAI TO IDADEMEDIAPAIS.

           ADD QUANTIDADEFILHOS TO MEDIAFILHOS.

      * Repete o ciclo 
           IF (CONTAGEMFAMILIA < TOTALFAMILIAS) THEN
               ADD 1 TO CONTAGEMFAMILIA
               GO TO ENTRADA
           END-IF.

           CALCULOSMEDIA.
           COMPUTE MEDIAFILHOS = MEDIAFILHOS / TOTALFAMILIAS.

           COMPUTE RENDIMENTOMEDIODOISFILHOS =
            RENDIMENTOMEDIODOISFILHOS / MENOSQUEDOISFILHOS.

           COMPUTE IDADEMEDIAPAIS = 
               IDADEMEDIAPAIS / (TOTALFAMILIAS * 2).

           MOSTRARDADOS.

           DISPLAY CLS.

           DISPLAY "-------RESULTADO-------" AT 0101.
           
           MOVE FAMILIASCONTINENTE TO SAIDA-INTEIRO.
           DISPLAY "Continente:"  AT 0301.
           DISPLAY SAIDA-INTEIRO AT 0335.

           MOVE FAMILIASACORES TO SAIDA-INTEIRO.
           DISPLAY "Acores: " AT 0401.
           DISPLAY SAIDA-INTEIRO AT 0435.

           MOVE FAMILIASMADEIRA TO SAIDA-INTEIRO.
           DISPLAY "Madeira: " AT 0501.
           DISPLAY SAIDA-INTEIRO AT 0535.


           MOVE MEDIAFILHOS TO SAIDA-INTEIRO.
           DISPLAY "Media de Filhos: " AT 0701.
           DISPLAY SAIDA-INTEIRO AT 0735.

           MOVE RENDIMENTOMEDIODOISFILHOS TO SAIDA.
           DISPLAY "Rendimento Medio com Menos de 2 Filhos: " AT 0801.
           DISPLAY SAIDA AT 0835.
           
           MOVE MAISQUEDOISFILHOS TO SAIDA-INTEIRO.
           DISPLAY "Familias com Mais de Dois Filhos: " AT 0901.
           DISPLAY SAIDA-INTEIRO AT 0935.

           MOVE IDADEMEDIAPAIS TO SAIDA-INTEIRO.
           DISPLAY "Media de Idade dos Pais: " AT 1001.
           DISPLAY SAIDA-INTEIRO AT 1035.


             STOP RUN.

