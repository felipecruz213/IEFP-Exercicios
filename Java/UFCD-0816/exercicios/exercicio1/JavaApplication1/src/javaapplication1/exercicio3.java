package javaapplication1;

import java.util.Random;
import javax.swing.JOptionPane;

public class exercicio3 {
    public static void main(String[] args) {
        Random R = new Random();
        int Numero = R.nextInt(1,51);
        String Mensagem;
        int User;
        

        for(int Tentativas = 4; Tentativas >= 0; Tentativas--) {
            User = Integer.parseInt(JOptionPane.showInputDialog(null, "Digite um numero:"));
            if (Numero == User){
                Mensagem = "Acertou!!!";
                JOptionPane.showMessageDialog(null, Mensagem);
                break;
            }
            else if (Numero > User){
                Mensagem = "O seu número é menor\n Tem mais " + String.valueOf(Tentativas) + " Tentativas";
            }
            else{
                Mensagem = "O seu número é maior\n Tem mais " + String.valueOf(Tentativas) + " Tentativas";
            }
            JOptionPane.showMessageDialog(null, Mensagem);
        }
    }
    
}
