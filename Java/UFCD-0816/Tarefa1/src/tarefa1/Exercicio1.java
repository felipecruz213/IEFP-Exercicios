/*
Desenvolver um programa que solicite ao utilizador uma palavra-passe;
na sequência, o utilizador digita dois números do tipo float,
e é calculada a divisão do primeiro pelo segundo.
O programa irá pedir ao utilizador que confirme a 
password indicada anteriormente. Se estiver correta,
mostra o resultado da divisão senão surge uma mensagem de erro.
*/
package tarefa1;

import javax.swing.JOptionPane;

public class Exercicio1 {

    public static void main(String[] args) {
        
        String mensagem = "";
        
        String password = JOptionPane.showInputDialog(null, "Digite a Senha:");
        
        String numero1 = JOptionPane.showInputDialog(null, "Digite o primeiro numero:");
        String numero2 = JOptionPane.showInputDialog(null, "Digite o segundo numero:"); 
        
        float resultado = Float.parseFloat(numero1) / Float.parseFloat(numero2);
        
        String new_password = JOptionPane.showInputDialog(null, "Digite a Senha:");
        
        if(new_password.equals(password)){
            mensagem = "O resultado é " + resultado;
        }
        else{mensagem = "Senha incoreta!!!!";}
        
        JOptionPane.showMessageDialog(null, mensagem);
    }
    
}
