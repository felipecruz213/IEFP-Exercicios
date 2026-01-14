using System;

class TiposValor
{
    static void Main()
    {
        Console.WriteLine("=== TIPOS DE VALOR EM C# ===\n");
        
        // Tipos numéricos inteiros
        sbyte numSByte = 127;               // 8 bits com sinal (-128 a 127)
        byte numByte = 255;                 // 8 bits sem sinal (0 a 255)
        short numShort = 32767;             // 16 bits com sinal
        ushort numUShort = 65535;           // 16 bits sem sinal
        int numInt = 2147483647;            // 32 bits com sinal
        uint numUInt = 4294967295;          // 32 bits sem sinal
        long numLong = 9223372036854775807; // 64 bits com sinal
        ulong numULong = 18446744073709551615; // 64 bits sem sinal
        
        // Tipos de ponto flutuante
        float numFloat = 3.14159f;        // Precisão ~7 dígitos
        double numDouble = 3.141592653589793; // Precisão ~15-16 dígitos
        decimal numDecimal = 3.1415926535897932384626433832m; // Precisão 28-29 dígitos
        
        // Outros tipos valor
        char caractere = 'A';            // Caractere Unicode de 16 bits
        bool booleano = true;            // Valor booleano (true/false)
        
        // Exibindo valores
        Console.WriteLine($"sbyte: {numSByte}");
        Console.WriteLine($"byte: {numByte}");
        Console.WriteLine($"short: {numShort}");
        Console.WriteLine($"ushort: {numUShort}");
        Console.WriteLine($"int: {numInt}");
        Console.WriteLine($"uint: {numUInt}");
        Console.WriteLine($"long: {numLong}");
        Console.WriteLine($"ulong: {numULong}");
        Console.WriteLine($"float: {numFloat}");
        Console.WriteLine($"double: {numDouble}");
        Console.WriteLine($"decimal: {numDecimal}");
        Console.WriteLine($"char: {caractere} (Valor numérico: {(int)caractere})");
        Console.WriteLine($"bool: {booleano}");
    }
}