/*
Crie um programa que verifique se uma dada letra digitada é "F" ou "M".
Conforme o resultado escrever: F - Feminino, M - Masculino, Género Inválido.
 */
package tarefa1;

import javax.swing.JOptionPane;

public class Exercicio3 {

    public static void main(String[] args) {
        String entrada = "";
        
        entrada = JOptionPane.showInputDialog(null,
                "M - Masculino \nF- Feminino");
        
        switch(entrada.toUpperCase()){
            case "M": 
                JOptionPane.showMessageDialog(null, "Masculino");
                break;
            case "F": 
                JOptionPane.showMessageDialog(null, "Feminino"); 
                break;
            
            default:  JOptionPane.showMessageDialog(null, "Genero Invalido");
        }
    }
    
}
