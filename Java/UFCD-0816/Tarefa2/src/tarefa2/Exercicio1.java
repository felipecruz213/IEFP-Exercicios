/*
Crie um programa que solicite ao utilizador, via JOptionPane, um número inteiro e
informe se o mesmo é par ou ímpar usando if.
*/


package tarefa2;

import javax.swing.JOptionPane;

public class Exercicio1 {

    public static void main(String[] args) {
        int numero = 0;
        boolean num_Valido = true;
        String Mensagem;

        do {
            try {
                numero = Integer.parseInt(JOptionPane.showInputDialog(null,
                        "Insira um número inteiro:"));                
            } catch (NumberFormatException e) {
                num_Valido = false;
                JOptionPane.showMessageDialog(null,
                        "Numero invalido",
                        "Erro",
                        JOptionPane.ERROR_MESSAGE);
            }
        } while (!num_Valido);
        
        if(numero % 2 == 0){
            Mensagem = "O numero " + String.valueOf(numero) + " é par!";
        }
        else{
            Mensagem = "O numero " + String.valueOf(numero) + " é impar!";
        }

        JOptionPane.showMessageDialog(null,
                Mensagem,
                "Par ou Impar",
                JOptionPane.INFORMATION_MESSAGE);
    }

}
