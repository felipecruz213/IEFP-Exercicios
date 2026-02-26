package javaapplication1;

import java.util.Random;
import javax.swing.JOptionPane;

public class TrapoQueimado {

    public static void main(String[] args) {
        int Diferenca = 0;
        Random R = new Random();
        String Mensagem = "";
        int Numero = R.nextInt(0, 101);
        
        for (i = 0; i < 5; i++){
            int User = Integer.parseInt(JOptionPane.showInputDialog(null, 
                    "Digite Um Numero:"));

            Diferenca = Math.abs(Numero - User);

            if(Diferenca > 80){
                Mensagem = "Gelado";
            }
            else if (Diferenca >= 50 && Diferenca <= 80){
                Mensagem = "Muito Frio";
            }
            else if (Diferenca >= 20 && Diferenca < 50){
                Mensagem = "Frio";
            }
            else if (Diferenca >= 10 && Diferenca < 20){
                Mensagem = "Está a aquecer";
            }
            else if (Diferenca >= 5 && Diferenca < 10){
                Mensagem = "Está a aquecer";
            }    
            else if (Diferenca > 0 && Diferenca < 5){
                Mensagem = "A escaldar";
            }    

            else if (Diferenca > 0 && Diferenca < 5){
                Mensagem = "A escaldar";
            }    

            else{
                Mensagem = "ACERTOU!!!!!!";
                JOptionPane.showMessageDialog(null, Mensagem);
                return;
            }

            JOptionPane.showMessageDialog(null, Mensagem);
        }
    }
    
}
