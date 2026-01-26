using System;

class EstruturasRepetitivas
{
    static void Main()
    {
        Console.WriteLine("--- ESTRUTURAS DE REPETIÇÃO EM C# ---\n");

        // Estrutura for (quando se sabe o número de iterações)
        Console.WriteLine("1. ESTRUTURA FOR BÁSICA:");
        // for (inicialização; condição de continuação; incremento/decremento - atualização)
        for (int i = 10; i >= 0; i--)
        {
            Console.WriteLine($"Contagem regressiva: {i}");
        }

        for (int i = 1; i <= 5; i++)
        {
            Console.WriteLine($"For básico - iteração {i}");
        }

        Console.WriteLine("\n2. Soma de n números inteiros de 1 a 10:");
        Console.WriteLine("2. Soma Parcial:");
        int soma = 0;
        for (int i = 1; i <= 10; i++)
        {
            soma += i; // soma = soma + i
            Console.WriteLine($"{i} -> soma: {soma}");
        }
        Console.WriteLine($"Soma Total: {soma}");

        // For decremental
        Console.WriteLine("\n3. FOR DECREMENTAL:");
        for (int i = 5; i >= 0; i--)
        {
            Console.WriteLine($"Contagem regressiva: {i}");
            if (i == 0)
            {
                Console.WriteLine("Fogo!");
            }
        }

        // For com múltiplas variáveis
        Console.WriteLine("\n4. FOR COM MÚLTIPLAS VARIÁVEIS:");
        for (int i = 0, j = 10; i <= 5; i++, j--)
        {
            Console.WriteLine($"i = {i}, j = {j}");
        }

        // For com incremento diferente
        Console.WriteLine("\n5. FOR COM INCREMENTO DIFERENTE:");
        for (int i = 0; i <= 10; i += 2)
        {
            Console.WriteLine($"Número par: {i}");
        }

        // For infinito com break
        Console.WriteLine("\n6. FOR INFINITO COM BREAK:");
        int contador = 0;
        for (; ; ) // loop infinito
        {
            contador++;
            if (contador == 3)
            {
                Console.WriteLine("Pulando a iteração 3...");
                continue;
            }
            Console.WriteLine($"Iteração {contador}");
            if (contador == 5)
            {
                Console.WriteLine("Saindo do loop com break");
                break;
            }
        }

        // Estrutura while (quando não se sabe o número de iterações)
        Console.WriteLine("\n7. ESTRUTURA WHILE:");
        int count = 1;
        while (count <= 5)
        {
            Console.WriteLine($"While: iteração {count}");
            count++;
        }

        // While com break
        Console.WriteLine("\n8. WHILE COM BREAK:");
        int numero = 1;
        while (true) // loop infinito
        {
            Console.WriteLine($"Número atual: {numero}");
            if (numero == 3)
            {
                Console.WriteLine("Encontrou o número 3. Saindo do loop...");
                break;
            }
            numero++;
        }

        // While com continue
        Console.WriteLine("\n9. WHILE COM CONTINUE:");
        int n = 0;
        while (n < 5)
        {
            n++;
            if (n == 3)
            {
                Console.WriteLine("Pulando a iteração 3...");
                continue;
            }
            Console.WriteLine($"Valor de n: {n}");
        }

        // Estrutura do-while (executa pelo menos uma vez)
        Console.WriteLine("\n10. ESTRUTURA DO-WHILE:");
        int x = 1;
        do
        {
            Console.WriteLine($"Do-While - Iteração {x}");
            x++;
        } while (x <= 5);

        // Do-While com break
        Console.WriteLine("\n11. DO-WHILE COM BREAK:");
        int numero2 = 1;
        do
        {
            Console.WriteLine($"Número atual: {numero2}");
            if (numero2 == 3)
            {
                Console.WriteLine("Encontrou o número 3. Saindo do loop...");
                break;
            }
            numero2++;
        } while (true); // loop infinito

        // Do-While executando pelo menos uma vez mesmo com condição falsa
        Console.WriteLine("\n12. DO-WHILE EXECUTANDO UMA VEZ MESMO COM CONDIÇÃO FALSA:");
        int y = 10;
        do
        {
            Console.WriteLine("Este código será executado pelo menos uma vez, mesmo com y (10) > 5");
        } while (y < 5);

        // Loops aninhados
        Console.WriteLine("\n13. LOOPS ANINHADOS:");
        for (int i = 1; i <= 3; i++)
        {
            Console.WriteLine($"Loop externo - iteração {i}:");
            for (int j = 1; j <= 2; j++)
            {
                Console.WriteLine($"   Loop interno - iteração {j}");
            }
        }

        // Outro exemplo de loops aninhados
        Console.WriteLine("\n14. LOOPS ANINHADOS (MATRIZ):");
        for (int i = 1; i <= 3; i++)
        {
            for (int j = 1; j <= 3; j++)
            {
                Console.Write($"{i}-{j} ");
            }
            Console.WriteLine();
        }

        // Foreach (para coleções)
        Console.WriteLine("\n15. ESTRUTURA FOREACH:");
        int[] numeros = { 10, 20, 30, 40, 50 }; // Array de inteiros

        Console.WriteLine("Elementos do array:");
        foreach (int num in numeros)
        {
            Console.Write($"{num} ");
        }
        Console.WriteLine();

        // Foreach com string (que é uma coleção de char)
        Console.WriteLine("\n16. FOREACH EM STRING:");
        string texto = "C#";
        Console.WriteLine("Caracteres da string:");
        foreach (char c in texto)
        {
            Console.WriteLine($"'{c}'");
        }

        Console.ReadLine();
    }
}