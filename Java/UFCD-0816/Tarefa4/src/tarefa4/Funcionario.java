/*Para todos os funcionários a empresa necessita manter o registo do
nome, contacto móvel e email do funcionário.*/

package tarefa4;

public class Funcionario {
    protected String nome;
    protected int telefone;
    protected String email;
    
    
    public Funcionario(String nome, int telefone, String email){
        setNome(nome);
        setTelefone(telefone);
        setEmail(email);
    }
    
    private void setNome(String nome){
        if(nome.equals("")){
            throw new IllegalArgumentException("Campo do nome não pode estar vazio");
        }
        else{
            this.nome = nome;
        }
    }
    
    private void setTelefone(int telefone){
        if(telefone > 999999999){
            throw new IllegalArgumentException("Telefone Inválido");
        }
        else{
            this.telefone = telefone;
        }
    }
    
    private void setEmail(String email){
        if(!email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")){
            throw new IllegalArgumentException("Email Inválido");
        }
        else{
            this.email = email;
        }
    }
    
    
    public String getNome(){
        return this.nome;
    }
    
    public int getTelefone(){
        return this.telefone;
    }
    
    public String getEmail(){
        return this.email;
    }
    
}

