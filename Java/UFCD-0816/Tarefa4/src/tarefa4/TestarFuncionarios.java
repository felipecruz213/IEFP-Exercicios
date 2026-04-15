package tarefa4;

import java.util.ArrayList;
import javax.swing.JOptionPane;

public class TestarFuncionarios {

    public static void main(String[] args) {
        ArrayList<Funcionario> lista = new ArrayList<>();
        
        String menu = "Menu de Gestão:\n\n"
                    + "1 - Novo Vendedor\n"
                    + "2 - Novo Administrativo\n"
                    + "3 - Novo Financeiro\n"
                    + "4 - Lista de Funcionários\n"
                    + "0 - Sair\n\n";

        while (true) {
            String input = JOptionPane.showInputDialog(null, menu, "Recursos Humanos", JOptionPane.QUESTION_MESSAGE);

            if (input == null || input.equals("0")) break;

            try {
                int opcao = Integer.parseInt(input);

                if (opcao >= 1 && opcao <= 3) {
                    String nome = JOptionPane.showInputDialog("Nome:");
                    int tel = Integer.parseInt(JOptionPane.showInputDialog("Telefone:"));
                    String email = JOptionPane.showInputDialog("Email:");
                    float salBase = Float.parseFloat(JOptionPane.showInputDialog("Salário Base (€):"));

                    switch (opcao) {
                        case 1:
                            lista.add(new Vendedor(nome, tel, email, salBase));
                            break;
                        case 2:
                            int horas = Integer.parseInt(JOptionPane.showInputDialog("Horas Extra:"));
                            lista.add(new Adminstrativo(nome, tel, email, salBase, horas));
                            break;
                        case 3:
                            float premio = Float.parseFloat(JOptionPane.showInputDialog("Prémio Produtividade (€):"));
                            lista.add(new Financeiro(nome, tel, email, salBase, premio));
                            break;
                    }
                    JOptionPane.showMessageDialog(null, "Funcionário registado com sucesso!");
                } 
                else if (opcao == 4) {
                    exibirRelatorio(lista);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Erro nos dados: " + e.getMessage());
            }
        }
    }

    private static void exibirRelatorio(ArrayList<Funcionario> lista) {
        if (lista.isEmpty()) {
            JOptionPane.showMessageDialog(null, "A lista está vazia.");
            return;
        }

        StringBuilder sb = new StringBuilder("=== Lista de Funcionários ===\n\n");
        
        for (Funcionario f : lista) {
            sb.append("NOME: ").append(f.getNome()).append("\n");
            sb.append("TEL: ").append(f.getTelefone()).append("\n");
            sb.append("EMAIL: ").append(f.getEmail()).append("\n");

            
            if (f instanceof Vendedor) {
                Vendedor v = (Vendedor) f;
                sb.append("CARGO: Vendedor\n");
                sb.append("SALÁRIO BASE: €").append(v.getSalario()).append("\n");
                sb.append("COMISSÃO: €").append(v.getComissao()).append("\n");
            } 
            else if (f instanceof Adminstrativo) {
                Adminstrativo a = (Adminstrativo) f;
                sb.append("CARGO: Administrativo\n");
                sb.append("SALÁRIO FIXO: €").append(a.getSalario()).append("\n");
                sb.append("HORAS EXTRA: ").append(a.getHorasExtra()).append("h\n");
            } 
            else if (f instanceof Financeiro) {
                Financeiro fin = (Financeiro) f;
                sb.append("CARGO: Financeiro\n");
                sb.append("SALÁRIO FIXO: €").append(fin.getSalario()).append("\n");
                // Mantido getHorasExtra() conforme o seu código original do Financeiro
                sb.append("PRÉMIO PRODUTIVIDADE: €").append(fin.getHorasExtra()).append("\n");
            }
            
            sb.append("---------------------------------------------------\n");
        }

        JOptionPane.showMessageDialog(null, sb.toString(), "Base de Dados de Funcionários", JOptionPane.INFORMATION_MESSAGE);
    }
}