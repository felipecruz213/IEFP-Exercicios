// Declaração de array
int[] numeros = new int[5]; // Array de 5 inteiros

int[] valores = new int[] { 10, 20, 30, 40, 50 };
// Forma simplificada
int[] valores2 = { 10, 20, 30, 40, 50 };

// Acessando elementos do array
int primeiro = valores[0]; // Acessa o primeiro elemento (10)
valores[2] = 35; // Modifica o terceiro elemento para 35

// Iterando sobre um array para leitura
for (int i = 0; i < valores.Length; i++)
{
    Console.WriteLine($"valores[{i}] = {valores[i]}");
}

// Iterando sobre um array para escrita
for (int i = 0; i < valores.Length; i++)
{
    valores[i] = (int)(valores[i] * 1.23); // Adiciona 23% a cada elemento
}

// Usando foreach
foreach (int valor in valores)
{
    Console.WriteLine(valor);
}

// --- Métodos úteis para trabalhar com arrays ---
int[] numeros3 = { 5, 3, 8, 1, 7, 2 }; // (Ajustado o nome para evitar conflito)
Console.WriteLine("Array original: " + string.Join(", ", numeros3));

// Ordenando o array
Array.Sort(numeros3); // numeros agora é { 1, 2, 3, 5, 7, 8 }
Console.WriteLine("Array ordenado: " + string.Join(", ", numeros3));

// Invertendo a ordem
Array.Reverse(numeros3); // numeros agora é { 8, 7, 5, 3, 2, 1 }
Console.WriteLine("Array invertido: " + string.Join(", ", numeros3));

// Encontrando índices
int indice = Array.IndexOf(numeros3, 7); // retorna 1
Console.WriteLine("Índice do elemento 7: " + indice);

// Verificando se um elemento existe
bool existe = Array.Exists(numeros3, x => x > 15); // retorna false
Console.WriteLine("Existe elemento maior que 15? " + existe);

// Encontrando elementos
int valorEncontrado = Array.Find(numeros3, x => x % 2 == 0); // retorna 8 (primeiro par)
Console.WriteLine("Primeiro número par: " + valorEncontrado);

int[] pares = Array.FindAll(numeros3, x => x % 2 == 0); // retorna { 8, 2 }
Console.WriteLine("Números pares: " + string.Join(", ", pares));

// Redimensionando arrays
Array.Resize(ref numeros3, 10); // agora numeros tem tamanho 10
Console.WriteLine("Array redimensionado: " + string.Join(", ", numeros3));

// Adicionando elementos (simulado)
numeros3[numeros3.Length - 2] = 10;
numeros3[numeros3.Length - 1] = 20;
Console.WriteLine("Array após adicionar elementos: " + string.Join(", ", numeros3));

// Removendo elementos (simulado)
// int novoTamanho = Array.FindAll(numeros3, x => x != 3).Length;

// --- Declaração de array bidimensional ---
int[,] matriz = new int[3, 2]; // 3 linhas, 2 colunas
int[,,] matriz1 = new int[3, 4, 2]; // Matriz tridimensional com 3 planos, 4 linhas e 2 colunas
// int[,,,,,] matriz6 = new int[2,3,4,5,6,7]; // Matriz de 6 dimensões

int[,] matriz2 = 
{
    { 1, 2, 3 },
    { 3, 4, 5 },
    { 5, 6, 7 }
};

// Acessando elementos
int elemento = matriz2[1, 0]; // Acessa linha 1, coluna 0 (valor 3)
matriz2[2, 1] = 7; // Modifica o elemento na linha 2, coluna 1 para 7

// Obtendo dimensões
int linhas = matriz2.GetLength(0); // 3
int colunas = matriz2.GetLength(1); // 3 (corrigido conforme o código)

// Iterando sobre todos os elementos
for (int i = 0; i < linhas; i++)
{
    for (int j = 0; j < colunas; j++)
    {
        Console.WriteLine($"matriz2[{i}, {j}] = {matriz2[i, j]}");
    }
}

// Iterando sobre todos os elementos, apresentando na forma de tabela
for (int i = 0; i < linhas; i++)
{
    for (int j = 0; j < colunas; j++)
    {
        Console.Write($"{matriz2[i, j]}\t");
    }
    Console.WriteLine(); // Nova linha após cada linha da matriz
}

// Usando foreach em matriz
foreach (int valor in matriz2)
{
    Console.WriteLine(valor);
}

// --- Arrays Jagged (Serrilhados) - Arrays de arrays ---
int[][] jaggedArray = new int[3][];

// Inicializando cada array interno com tamanhos diferentes
jaggedArray[0] = new int[2] { 1, 2 };
jaggedArray[1] = new int[3] { 3, 4, 5 };
jaggedArray[2] = new int[1] { 6 };

// Acessando elementos
int valorJagged = jaggedArray[1][2]; // Acessa o elemento 5

// Iterando sobre um array jagged
for (int i = 0; i < jaggedArray.Length; i++)
{
    Console.Write($"Linha {i}: ");
    for (int j = 0; j < jaggedArray[i].Length; j++)
    {
        Console.Write($"{jaggedArray[i][j]} ");
    }
    Console.WriteLine();
}