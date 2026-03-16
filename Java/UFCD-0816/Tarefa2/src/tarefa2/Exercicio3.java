/*
Crie um programa que solicite um número ao utilizador e use um ciclo for
para mostrar de 1 até esse número.
*/

package tarefa2;

import javax.swing.JOptionPane;


public class Exercicio3 {

    public static void main(String[] args) {
        int numero = 0;
        boolean num_Valido = true;
        String Mensagem = "0";

        do {
            try {
                numero = Integer.parseInt(JOptionPane.showInputDialog(null,
                        "Insira um número inteiro e positivo:"));
                if (numero < 0){
                    num_Valido = false;
                    JOptionPane.showMessageDialog(null,
                        "O número tem que ser positivo",
                        "Erro",
                        JOptionPane.ERROR_MESSAGE);
                }
            } catch (NumberFormatException e) {
                num_Valido = false;
                JOptionPane.showMessageDialog(null,
                        "Numero invalido",
                        "Erro",
                        JOptionPane.ERROR_MESSAGE);
            }
        } while (!num_Valido);
        
        
        for(int i = 0; i <= numero; i++){
            if (i != 0){
                Mensagem = Mensagem + " " + String.valueOf(i);
            }
        }
        
        JOptionPane.showMessageDialog(null,
                Mensagem,
                "Números Bacanas",
                JOptionPane.INFORMATION_MESSAGE);
    }
    
}
