/*
Crie um programa que solicite dois números inteiros ao utilizador usando JOptionPane
e mostre qual é o maior utilizando a estrutura if-else.
*/



package tarefa2;

import java.util.Arrays;
import javax.swing.JOptionPane;

public class Exercicio2 {

    public static void main(String[] args) {
        
        int numeroEscolhido;
        int quantidadeNumeros;
        int numeroMenor, numeroMaior;
        int[] numeros = {0};
        boolean num_Valido = true;
        String Mensagem;

        do {
            try {
                quantidadeNumeros = Integer.parseInt(JOptionPane.showInputDialog(null,
                        "Insira quantos numeros deseja inserir:"));
                
                for(int i = 0; i < quantidadeNumeros; i++){
                    numeroEscolhido = Integer.parseInt(JOptionPane.showInputDialog(null,
                        "Insira o numero " + (i + 1) + ": "));
   
                        if(i != 0){
                        numeros = Arrays.copyOf(numeros, numeros.length + 1);
                        numeros[numeros.length - 1] = numeroEscolhido;
                        }
                        
                        else {
                            numeros[0] = numeroEscolhido;
                        }
                  
                    num_Valido = true;
                }
            } catch (NumberFormatException e) {
                num_Valido = false;
                JOptionPane.showMessageDialog(null,
                        "Numero invalido",
                        "Erro",
                        JOptionPane.ERROR_MESSAGE);
            }
        } while (!num_Valido);
        
        Arrays.sort(numeros);
        numeroMenor = numeros[0];
        numeroMaior = numeros[numeros.length - 1];
        
        Mensagem = "O numero maior é "
                    + String.valueOf(numeroMaior) +
                    " e o menor é " +
                    String.valueOf(numeroMenor);
        
        JOptionPane.showMessageDialog(null,
                    Mensagem,
                    "Maior e Menor",
                    JOptionPane.INFORMATION_MESSAGE);

        
    }
    
}
