package Escola;

public class Alunos {
    private int idAluno;
    private float Nota;
    private String Nome;
    private String Email;
    
    
    public void Aluno(int idAluno, float Nota, String Nome, String Email){
        
        if(validarIdAluno(idAluno)){
            this.idAluno = idAluno;            
        }

        if(validarNota(Nota)){
            this.Nota = Nota;
        }
        
        if(validarEmail(Email)){
            this.Email = Email;
        }
        
        if(validarNome(Nome)){
            this.Nome = Nome;
        }

    }
    
    private boolean validarIdAluno(int idAluno){
        if(idAluno > 99999){
            throw new IllegalArgumentException("Id inválida!");
        }
        else{
            return true;
        }
    }
    
    private boolean validarNota(float nota){
        if(nota > 20.0f || nota < 0.0f){
            throw new IllegalArgumentException("Nota inválida!");
        }
        else{
            return true; 
        }
    }
    
    private boolean validarEmail(String email){
       
        String regexPattern = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" 
                    + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
        
        if(!email.matches(regexPattern)){
            throw new IllegalArgumentException("Email Inválido!");
        }
        else{
            return true; 
        }
    }
    
    private boolean validarNome(String nome){
            
        String regexPattern = "^[a-zA-Z]*$";
        
        if(!nome.matches(regexPattern)){
            throw new IllegalArgumentException("Nome Inválido!");
        }
        else{
            return true; 
        }
    }
        
    public int getIdAluno(){
        return this.idAluno;
    }
        
    public String getEmail(){
        return this.Email;
    }
    
    public String getNome(){
        return this.Nome;
    }
    
    public float getNota(){
        return this.Nota;
    }
}
