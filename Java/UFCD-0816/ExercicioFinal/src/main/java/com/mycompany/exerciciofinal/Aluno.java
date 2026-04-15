package com.mycompany.exerciciofinal;

public final class Aluno {
    protected int Numero;
    protected String Nome;
    protected String Email;
    protected float NotaFinal;
    
    public Aluno(int Numero, String Nome, String Email, float NotaFinal){
        setNumero(Numero);
        setNome(Nome);
        setEmail(Email);
        setNotaFinal(NotaFinal);
        
    }
    
    public void setNumero(int Numero){
        this.Numero = Numero;
    }
    
    public void setNome(String Nome){
        if(Nome.equals("")){
            throw new IllegalArgumentException("Campo do nome não pode estar vazio");
        }
        else{
            this.Nome = Nome;
        }
    }
    
    public void setEmail(String Email){
        if(!Email.matches("^(.+)@(\\S+) $.")){
            throw new IllegalArgumentException("Endereço de Email Inválido");
        }
        else{
            this.Email = Email;
        }  
    }
    
    public void setNotaFinal(float nota){
        if(!(nota > 0.0f && nota < 20.0f)){
            throw new IllegalArgumentException("Nota Inválida");
        }
        else{
            this.NotaFinal = nota;
        }
    }
    
    public int getNumero(){
        return this.Numero;
    }
    
    public String getNome(){
        return this.Nome;
    }
    
    public String getEmail(){
        return this.Email;
    }
    
    public float getNotaFinal(){
        return this.NotaFinal;
    }
}
