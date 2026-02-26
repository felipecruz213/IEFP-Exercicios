/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package javaapplication1;

import javax.swing.JOptionPane;

public class Exercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String Nome=JOptionPane.showInputDialog(null, "Digite um Nome");
        String Nome1=JOptionPane.showInputDialog(null,"Confirme o Nome");
        
        if(Nome.toUpperCase().equals(Nome1.toUpperCase())){
            JOptionPane.showMessageDialog(null, "Os nomes são iguais");
        }
        else{
            JOptionPane.showMessageDialog(null, "Os nomes não são iguais!!!!");
        }
        
    }
    
}
