/*
Considere a seguinte tabela de preços:

         Até 5 Kg         Acima de 5 Kg
Bananas   2,50 por Kg      2,20 por Kg
Peras     1,80 por Kg      1,50 por Kg

Se o cliente comprar mais de 8 Kg em frutas ou o valor total da compra ultrapassar 25,00,
receberá ainda um desconto de 10% sobre este total. Escreva um programa para ler a
quantidade (em Kg) de bananas e a quantidade (em Kg) de peras adquiridas e escreva o
valor a ser pago pelo cliente.
*/

package tarefa1;

import javax.swing.JOptionPane;

public class Exercicio2 {

    public static void main(String[] args) {
        String mensagem = "";
        
        boolean tem_Desconto = false;
        float Bananas, Peras;
        float valor_Bananas, valor_Peras;
        float valor_Total, peso_Total;
        
        Bananas = Float.parseFloat(JOptionPane.showInputDialog(null,
                "Insira o Peso das Bananas:"));
        Peras = Float.parseFloat(JOptionPane.showInputDialog(null,
                "Insira o Peso das Peras:"));

        peso_Total = Bananas + Peras;
        
        if(Bananas > 5){ 
            valor_Bananas = Bananas * 2.20f;
        }
        else{ 
            valor_Bananas = Bananas * 2.50f;
        }
        
        if(Peras > 5){
            valor_Peras = Peras * 1.50f;
        }
        else{
            valor_Peras = Peras * 1.80f;
        }
        
        valor_Total = valor_Bananas + valor_Peras;
        
        if(peso_Total > 8.00 || valor_Total > 25.00){
            valor_Total = valor_Total - (valor_Total * 0.10f);
            tem_Desconto = true;
        }
        
        mensagem = """
                   Total: 
                   Bananas:  """ + valor_Bananas + "\nPeras: " + valor_Peras;
        
        if (tem_Desconto){
            mensagem += "\n Valor Total: " + valor_Total +" (Com desconto)";
        } 
        else {
            mensagem += "\n Valor Total: " + valor_Total +" (Sem desconto)";
        }
        
        JOptionPane.showMessageDialog(null, mensagem);
        
    }
    
}
