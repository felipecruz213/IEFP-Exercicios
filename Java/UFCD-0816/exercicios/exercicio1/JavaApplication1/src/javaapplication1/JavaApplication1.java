package javaapplication1;

import javax.swing.JOptionPane;

public class JavaApplication1 {
    public static void main(String[] args) {
        System.out.println("Olá mundo!");
        
        String Nome=JOptionPane.showInputDialog(null, "Digite o seu nome");
        
        JOptionPane.showMessageDialog(null,"Olá, " + Nome);
    }
    
}
