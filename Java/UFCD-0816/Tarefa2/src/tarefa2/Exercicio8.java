/*
Usando um for, crie um programa que some todos os números de 1 a 100 e mostre o
resultado via JOptionPane.
 */
package tarefa2;

import javax.swing.JOptionPane;

public class Exercicio8 {
    public static void main(String[] args) {
        int total = 0;
        for(int i = 0; i <= 100; i++){
            total += i;
        }
        
        JOptionPane.showMessageDialog(null,
                    "Total: "+ String.valueOf(total),
                    "Total da soma de 0 a 100",
                    JOptionPane.INFORMATION_MESSAGE);
    }
    
}
