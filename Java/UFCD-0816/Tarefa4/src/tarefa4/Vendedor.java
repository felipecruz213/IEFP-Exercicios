/*
Os vendedores têm um salário base, mas ganham também comissão sobre as
vendas.

Os vendedores devem ter um método que imprima o seu salário total considerando
que a comissão é de 5% sobre o valor das vendas.
 */

package tarefa4;

import java.text.DecimalFormat;


public class Vendedor extends Funcionario{
    DecimalFormat formatoSalario = new DecimalFormat("###,###,##0.00");
    
    private float salario;
    private final float comissao;

    
    public Vendedor(String nome, int telefone, String email,
                    float salario){
       
        super(nome, telefone, email);
        this.salario = salario;
        this.comissao = salario * 0.5f;

    }
    
    public void setSalario(float salario){
        if(salario < 0.0f){
            throw new IllegalArgumentException("O salário deve ser maior que 0");
        }
        else{
            this.salario = salario;     
        }

    }
    
    public String getSalario(){ 
        return formatoSalario.format(this.salario);
    }
    public float getComissao(){
        return this.comissao;
    }
    
    
}
