/*
6. Crie um programa que pergunte a idade do utilizador e mostre:
- “Menor de idade” se < 18
- “Adulto” se entre 18 e 60
- “Idoso” se > 60
Use if / else if / else.
*/

package tarefa2;

import javax.swing.JOptionPane;


public class Exercicio6 {

    public static void main(String[] args) {
        int idade = 0;
        boolean idade_Valida = false;
        String mensagem;
        
            try{
            idade = Integer.parseInt(JOptionPane.showInputDialog(null,
                       "Insira o A idade: "));
            if (idade < 0){
                throw new NumberFormatException();
            }
            
            else{
                idade_Valida = true;
            }
            
         
            }catch(NumberFormatException e){
                JOptionPane.showMessageDialog(null, 
                        "Numero invalido", 
                        "Erro",
                        JOptionPane.ERROR_MESSAGE);
            }
            
            if(idade_Valida){
                if(idade >= 60){
                    mensagem = "Idoso";
                }
                else if(idade < 60 && idade > 18){
                    mensagem = "Adulto";
                }
                else{
                    mensagem = "Menor de Idade";
                }
                JOptionPane.showMessageDialog(null, 
                    mensagem, 
                    "Calcula Faixa Etária",
                    JOptionPane.INFORMATION_MESSAGE);
            }
            
    }
    
}
