using System;
using System.Collections.Generic;

namespace OOPExample
{
    // Definição da Classe Pessoa
    public class Pessoa
    {
        // --- MEMBROS ESTÁTICOS (Pertencem à CLASSE, não ao objeto) ---
        // Variável estática para contar quantas pessoas foram criadas
        private static int numero = 0;

        // Propriedade estática para ler o total de pessoas
        public static int Numero
        {
            get { return numero; }
        }

        // --- MEMBROS DE INSTÂNCIA (Pertencem a CADA OBJETO) ---
        private int num;    // ID único desta pessoa
        private string nome;
        private int idade;

        // Propriedades (Encapsulamento)
        public string Nome
        {
            get { return nome; }
            set { nome = value; }
        }

        public int Idade
        {
            get { return idade; }
            set { idade = value; }
        }

        public int Num
        {
            get { return num; } // Apenas leitura
        }

        // Construtor (Executado quando usamos 'new')
        public Pessoa(string nome, int idade)
        {
            this.nome = nome;
            this.idade = idade;
            
            // Incrementa o contador geral da classe e atribui a esta instância
            num = ++numero; 
        }

        // Método
        public void Apresentar()
        {
            Console.WriteLine("[" + num + "] - O nome é " + nome + " e tenho " + idade + " anos.");
        }
    }

    // Classe principal para execução
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- PROGRAMAÇÃO ORIENTADA A OBJETOS ---\n");

            // Lista para guardar os objetos
            List<Pessoa> pessoas = new List<Pessoa>();

            // Instanciando objetos (Criando pessoas)
            // O construtor vai rodar e definir o número automaticamente
            Pessoa pessoa1 = new Pessoa("Jorge", 50);
            pessoas.Add(pessoa1);

            Pessoa pessoa2 = new Pessoa("Maria", 25);
            pessoas.Add(pessoa2);

            Pessoa pessoa3 = new Pessoa("Ana", 28);
            pessoas.Add(pessoa3);

            // Iterando sobre a lista e chamando o método de cada objeto
            Console.WriteLine("Apresentação das Pessoas:");
            foreach (Pessoa p in pessoas)
            {
                p.Apresentar();
            }

            Console.WriteLine("\n--------------------------------");
            
            // Acessando membro Estático (da Classe)
            // Note que usamos Pessoa.Numero (Nome da Classe), e não pessoa1.Numero
            Console.WriteLine("Total de pessoas criadas (Static): " + Pessoa.Numero);
            
            // Acessando propriedades de Instância (do Objeto)
            Console.WriteLine("Nome do objeto 1: " + pessoa1.Nome);
            Console.WriteLine("Nome do objeto 2: " + pessoa2.Nome);
        }
    }
}