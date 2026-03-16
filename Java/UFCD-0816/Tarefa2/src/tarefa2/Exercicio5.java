
package tarefa2;

import javax.swing.JOptionPane;

public class Exercicio5 {

    
    public static void main(String[] args) {
        int Resposta=0;
        int Confirmacao = 0;
        String Mensagem;
        String[] Questoes = {"Telefonou para a vítima?",
                            "Esteve no local do crime?",
                            "Mora perto da vítima?",
                            "Tinha dívidas com a vítima?",
                            "Já trabalhou com a vítima?"
                            };
        
        for(int i = 0; i < 5; i++){
            Resposta = JOptionPane.showConfirmDialog(null,
                    Questoes[i], "Inquerito", JOptionPane.YES_NO_OPTION);
            switch(Resposta){
                case 0 -> Confirmacao++;
            }
        }
        
        switch(Confirmacao){
            case 0,1 -> Mensagem = "Inocente";
            case 2   -> Mensagem = "Suspeito";
            case 3,4 -> Mensagem = "Cúmplice";
            default  -> Mensagem = "Assasino";
        }
            
        JOptionPane.showMessageDialog(null,
                Mensagem, 
                "Inquérito", 
                JOptionPane.INFORMATION_MESSAGE);
        }
    }
    
