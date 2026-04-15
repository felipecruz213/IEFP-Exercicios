/*
Os financeiros têm um salário fixo, mas podem ganhar um prémio de produtividade.
 */

package tarefa4;

import java.text.DecimalFormat;

public class Financeiro extends Funcionario{
    DecimalFormat formatoSalario = new DecimalFormat("###,###,##0.00");
    private float salario;
    private float premioProdutividade;
    
    public Financeiro(String nome, int telefone, String email,
        float salario, float premioProdutividade){
        super(nome, telefone, email);
        this.salario = salario;
        this.premioProdutividade = salario * 0.6f;
    }
    
    
    public void setSalario(float salario){
    this.salario = salario;
    }
    
    public void setPremioProdutividade(int premioProdutividade){
        this.premioProdutividade = premioProdutividade;
    }
    
    public String getSalario(){
        return formatoSalario.format(this.salario);
    }
    public float getHorasExtra(){
        return this.premioProdutividade;
    }
}
