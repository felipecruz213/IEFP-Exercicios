/*
Crie um programa que solicite ao utilizador 5 nomes usando JOptionPane e mostre no
final usando um for.
 */
package tarefa2;

import javax.swing.JOptionPane;

public class Exercicio9 {

    public static void main(String[] args) {
        String listaNomes = "";
        String escolhaNome;
        boolean nomeInserido;
        
        for(int i = 0; i > 5; i++){
            
            do{
                escolhaNome = JOptionPane.showInputDialog(null,
                             "Insira um Nome:",
                             "Lista de Nome",
                             JOptionPane.INFORMATION_MESSAGE);
                
                nomeInserido = escolhaNome.equals("");
            }while(!nomeInserido);
            
            listaNomes += escolhaNome + " ";
        }
    }
    
}
