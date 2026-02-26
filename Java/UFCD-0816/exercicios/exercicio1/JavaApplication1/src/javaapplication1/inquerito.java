package javaapplication1;

import javax.swing.JOptionPane;

public class inquerito {

    public static void main(String[] args) {
        int Resposta = 0, Sins = 0;
        String[] Perguntas = {"Gostou do atendimento?",
            "Recomenda uma ida a este balcão?",
            "Recomendaria a um amigo?",
            "Gostou do espaço?"};

        for (int i = 0; i < 4; i++) {
            Resposta = JOptionPane.showConfirmDialog(null,
                    (i + 1) + "ª " + Perguntas[i], "Inquerito",
                    JOptionPane.OK_OPTION);
            if(Resposta == 0)Sins++;
        }
        if(Sins>=3){
            JOptionPane.showMessageDialog(null, "O espaço recomenda-se",
                    "Inquérito",JOptionPane.INFORMATION_MESSAGE);
        }
        else{
            JOptionPane.showMessageDialog(null,
                    "O espaço não se recomenda!",
                    "Inquérito",JOptionPane.INFORMATION_MESSAGE);
        }
    }

}
