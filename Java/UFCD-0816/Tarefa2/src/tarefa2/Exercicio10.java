package tarefa2;

/*
Crie um programa que leia um número via JOptionPane e verifique com if se é
positivo, negativo ou zero.
 */

import javax.swing.JOptionPane;

public class Exercicio10 {

    public static void main(String[] args) {
        String mensagem;
        int numero = 0;
        try{
            numero = Integer.valueOf(JOptionPane.showInputDialog(null,
                    "Insira um número inteiro:",
                    "Positivo ou Negativo",
                    JOptionPane.INFORMATION_MESSAGE));
}
        catch(NumberFormatException e){
            JOptionPane.showMessageDialog(null,
                    "Número Invalido!",
                    "Positivo ou Negativo",
                    JOptionPane.ERROR_MESSAGE);
        }
        
        if(numero == 0){
            mensagem = "O número é zero";
        }
        else if(numero > 0){
            mensagem = "O número " + String.valueOf(numero) + " é positivo.";
        }
        else{
            mensagem = "O número " + String.valueOf(numero) + " é negativo.";
        }
        
        JOptionPane.showMessageDialog(null,
                mensagem,
                "Positivo ou Negativo",
                JOptionPane.INFORMATION_MESSAGE);
    }
    
}
