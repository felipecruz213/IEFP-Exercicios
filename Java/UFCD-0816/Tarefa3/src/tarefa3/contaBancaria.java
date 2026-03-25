package tarefa3;

public class contaBancaria {
    private int numeroConta;
    private String nomeCliente;
    private float saldo;
    
    
    public void criarConta(int numeroConta, String nomeCliente){
        this.numeroConta = numeroConta;
        this.nomeCliente = nomeCliente;
        this.saldo = 0.0f;
    }
    
    public void depositarConta(float montante){
        this.saldo += montante;
    }
    
    public void levantarConta(float montante){
        this.saldo -= montante;
    }
    
    public float consultarSaldo(){
        return this.saldo;
    } 
}
