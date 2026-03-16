/*
Crie um programa que solicite números via JOptionPane até que o 
 utilzador digite 0, utilizando um while.
*/

package tarefa2;

import java.util.Arrays;
import javax.swing.JOptionPane;

public class Exercicio7 {

    public static void main(String[] args) {
        int lista_numeros[] = {};
        int numero_escolhido = 0;
        
        do{
            try{
                numero_escolhido = Integer.parseInt(JOptionPane.showInputDialog(null,
                                    "Insira um número inteiro:"));
            }
            catch(NumberFormatException e){
                JOptionPane.showMessageDialog(null,
                            "Número Invalido!",
                            "Erro!",
                            JOptionPane.ERROR_MESSAGE);
            }
            
            lista_numeros = Arrays.copyOf(lista_numeros, lista_numeros.length + 1);
            lista_numeros[lista_numeros.length - 1] = numero_escolhido;
        }while(numero_escolhido != 0);
        
        if ((lista_numeros.length - 1) > 0){
            String numeros_texto = "";
            for(int i = 0; i < lista_numeros.length - 1; i++){
                numeros_texto += " " + String.valueOf(lista_numeros[i]);
            }
            
            JOptionPane.showMessageDialog(null, 
                        numeros_texto, 
                        "Lista de Números",
                        JOptionPane.INFORMATION_MESSAGE);
        }
        else{
            JOptionPane.showMessageDialog(null, 
            "Não foi inserido números", 
            "Lista de Números",
            JOptionPane.INFORMATION_MESSAGE);
        }
    }
    
}
