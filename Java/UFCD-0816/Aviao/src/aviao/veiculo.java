
package aviao;


public class veiculo {
    private String marca;
    private String modelo;
    private int ano;
    private float preco;
    private String combustivel;
    private int velocidadeMaxima;
    
    
    public void setMarca(String marca){
        this.marca = marca;
    }
    
    public void setModelo(String modelo){
        this.modelo = modelo;
    }
    
    public void setAno(int ano){
        this.ano = ano;
    }
    
    public void setPreco(float preco){
        this.preco = preco;
    }
    
    public void setCombustivel(String combustivel){
        this.combustivel = combustivel;
    }
    
    public void setVelocidadeMaxima(int velocidadeMaxima){
        this.velocidadeMaxima = velocidadeMaxima;
    }
    
    public void mostrarDados(){
        String mensagem = "Marca: "    + this.marca +
                          "\nModelo: " + this.modelo +
                          "\nAno: "    + String.valueOf(this.ano) +
                          "\nPreço: "   + String.valueOf(this.preco) +
                          "\nTipo de Combustível: " + this.combustivel +
                          "Velocidade Máxima: " + String.valueOf(velocidadeMaxima);
    }
}
