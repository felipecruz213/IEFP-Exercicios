/*
Os administrativos têm um salário fixo, mas podem ganhar horas extras.
*/

package tarefa4;

import java.text.DecimalFormat;

public class Adminstrativo extends Funcionario{
    DecimalFormat formatoSalario = new DecimalFormat("###,###,##0.00");
    private float salario;
    private float montanteHorasExtra;
    private int horasExtra;
    
    public Adminstrativo(String nome, int telefone, String email,
                        float salario, int horasExtra){
        super(nome, telefone, email);
        this.salario = salario;
        this.horasExtra = horasExtra; 
        this.montanteHorasExtra = horasExtra * 3;
    }
    
    public void setSalario(float salario){
    this.salario = salario;
    }
    
    public void setHorasExtras(int horasExtras){
        this.horasExtra = horasExtras;
    }
    
    public String getSalario(){
        return formatoSalario.format(this.salario);
    }
    public float getHorasExtra(){
        return this.horasExtra;
    }
}
