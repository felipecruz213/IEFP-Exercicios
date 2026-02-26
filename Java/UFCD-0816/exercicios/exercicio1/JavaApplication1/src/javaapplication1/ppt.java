package javaapplication1;

import java.util.Random;
import javax.swing.JOptionPane;

public class ppt {

    public static void main(String[] args) {
        String[] Objetos = {"Pedra", "Papel", "Tesoura"};
        Random R = new Random();
        int Pc = R.nextInt(0, 3);
        
        
        
        int User = JOptionPane.showOptionDialog(null,
                "Selecione o Seu Objeto",
                "Pedra, Papel, Tesoura",
                JOptionPane.OK_OPTION,
                JOptionPane.PLAIN_MESSAGE,
                null,Objetos,null);
        
        if (Pc == User){
            JOptionPane.showMessageDialog(null, "Empate!!!");
        }
        
        else if ((User == 0 && Pc == 2) ||
                 (User == 1 && Pc == 0) ||
                 (User == 2 && Pc == 1)){
                    JOptionPane.showMessageDialog(null, "O Usuario Ganhou!!!");
        }
        
    }
    
}
