using System;
using System.Collections.Generic; // Necessário para List, Dictionary, etc.
using System.Linq; // Necessário para Sum(), Average(), etc.

namespace CollectionsExample
{
    class Program
    {
        static void Main(string[] args)
        {
            // ==========================================
            // 1. LISTAS (List<T>) - Tamanho dinâmico
            // ==========================================
            Console.WriteLine("--- 1. LISTAS (LIST<T>) ---");

            List<string> nomes = new List<string>();
            nomes.Add("Ana");
            nomes.Add("Carlos");
            nomes.Add("Bruno");
            
            // Inicialização com valores
            List<string> nomes2 = new List<string> { "Pedro", "Maria" };
            
            // Adicionando uma lista dentro da outra
            nomes.AddRange(nomes2);

            // Acessando e modificando
            Console.WriteLine($"Primeiro nome: {nomes[0]}");
            nomes[1] = "Roberto"; // Altera Carlos para Roberto

            // Removendo
            nomes.Remove("Ana"); // Remove pelo valor
            nomes.RemoveAt(0);   // Remove pelo índice (agora o 0 é Roberto)

            // Inserindo em posição específica
            nomes.Insert(0, "Zuleica");

            Console.WriteLine("Lista de Nomes:");
            foreach (string nome in nomes)
            {
                Console.WriteLine($" - {nome}");
            }

            // Operações com Lista de Números
            List<int> numeros = new List<int> { 10, 5, 20, 8 };
            numeros.Sort(); // Ordena
            Console.WriteLine($"\nMenor número: {numeros[0]}");
            Console.WriteLine($"Soma total: {numeros.Sum()}");
            Console.WriteLine($"Média: {numeros.Average()}");


            // ==========================================
            // 2. DICIONÁRIOS (Dictionary<K,V>) - Chave/Valor
            // ==========================================
            Console.WriteLine("\n--- 2. DICIONÁRIOS (KEY-VALUE) ---");

            Dictionary<string, int> idades = new Dictionary<string, int>();
            idades.Add("Ana", 30);
            idades.Add("Carlos", 25);
            idades["Maria"] = 40; // Outra forma de adicionar ou atualizar

            // Tentando pegar valor de forma segura (TryGetValue)
            if (idades.TryGetValue("Ana", out int idadeAna))
            {
                Console.WriteLine($"A idade de Ana é {idadeAna}");
            }
            else
            {
                Console.WriteLine("Ana não encontrada.");
            }

            // Verificando existência
            if (!idades.ContainsKey("Pedro"))
            {
                Console.WriteLine("Pedro não está no dicionário.");
            }

            // Iterando
            foreach (KeyValuePair<string, int> item in idades)
            {
                Console.WriteLine($"{item.Key} tem {item.Value} anos");
            }


            // ==========================================
            // 3. HASHSET (Conjuntos) - Itens únicos
            // ==========================================
            Console.WriteLine("\n--- 3. HASHSET (ITENS ÚNICOS) ---");

            HashSet<string> cores = new HashSet<string>();
            cores.Add("Vermelho");
            cores.Add("Verde");
            bool adicionou = cores.Add("Vermelho"); // Tenta adicionar duplicado

            Console.WriteLine($"Conseguiu adicionar 'Vermelho' de novo? {adicionou}"); // False

            // Operações de Conjunto
            HashSet<string> outrasCores = new HashSet<string> { "Verde", "Amarelo", "Roxo" };
            
            // Intersecção (Mantém apenas o que existe nos dois)
            // cores.IntersectWith(outrasCores); 
            
            // União (Junta tudo sem duplicar)
            cores.UnionWith(outrasCores);

            Console.WriteLine("Cores no conjunto:");
            foreach (var cor in cores)
            {
                Console.Write($"{cor} ");
            }
            Console.WriteLine();


            // ==========================================
            // 4. QUEUE (Fila) - FIFO (First In, First Out)
            // ==========================================
            Console.WriteLine("\n--- 4. QUEUE (FILA) ---");
            // Imagine uma fila de banco
            Queue<string> filaBanco = new Queue<string>();
            
            filaBanco.Enqueue("Cliente 1"); // Entra na fila
            filaBanco.Enqueue("Cliente 2");
            filaBanco.Enqueue("Cliente 3");

            Console.WriteLine($"Quem é o próximo? (Peek): {filaBanco.Peek()}");
            
            string atendido = filaBanco.Dequeue(); // Remove o primeiro (Atende)
            Console.WriteLine($"Atendendo: {atendido}");
            Console.WriteLine($"Pessoas restantes na fila: {filaBanco.Count}");


            // ==========================================
            // 5. STACK (Pilha) - LIFO (Last In, First Out)
            // ==========================================
            Console.WriteLine("\n--- 5. STACK (PILHA) ---");
            // Imagine uma pilha de pratos ou documentos
            Stack<string> documentos = new Stack<string>();

            documentos.Push("Doc A"); // Coloca na pilha
            documentos.Push("Doc B");
            documentos.Push("Doc C"); // Este está no topo

            Console.WriteLine($"Documento no topo (Peek): {documentos.Peek()}");

            string processado = documentos.Pop(); // Remove o do topo
            Console.WriteLine($"Processando: {processado}"); // Doc C
            Console.WriteLine($"Próximo documento: {documentos.Peek()}"); // Doc B
        }
    }
}