/*
Elabore um programa em Java que permita efetuar operações de crédito ou débito numa
conta bancária. O programa deverá perguntar qual o saldo inicial da conta e qual a operação
que o utilizador pretende efetuar (débito ou crédito), assim como o montante a debitar,
atualizando o saldo da conta sempre que se efetue uma operação. No final deverá devolver o
saldo da conta.
*/

package tarefa1;

import javax.swing.JOptionPane;

public class Exercicio4 {

    public static void main(String[] args) {
        float saldo, montante, resultado;
        boolean sair = true;
        int Escolha = 0;
        String escolhas[] = {"Crédito", "Débito", "Sair"};
        
        
        while(sair){
            
            try{
            saldo = Float.parseFloat(JOptionPane.showInputDialog(null,
                       "Insira o Saldo: "));
            }catch(NumberFormatException e){
                JOptionPane.showMessageDialog(null, 
                        "Numero invalido", 
                        "Erro",
                        JOptionPane.ERROR_MESSAGE);
            }

            montante = Float.parseFloat(JOptionPane.showInputDialog(null,
                       "Insira o Montante: "));

            Escolha = JOptionPane.showOptionDialog(null,
                       "Crédito ou Débito:",
                       "ATM",
                       JOptionPane.DEFAULT_OPTION,
                       JOptionPane.QUESTION_MESSAGE,
                       null,
                       escolhas,
                       escolhas[0]);

            switch (Escolha){
                case 0: 
                    saldo = saldo - montante;
                    break;
                
                case 1: 
                    saldo = saldo + montante;
                    break;
                    
                case 2: 
                    sair = false;
                    break;
            }
            
            if(sair){
                JOptionPane.showMessageDialog(null, 
                        "O saldo atual é: " + String.valueOf(saldo),
                        "Saida", 
                        JOptionPane.INFORMATION_MESSAGE);
                        }
        }    
    }
 }
    
