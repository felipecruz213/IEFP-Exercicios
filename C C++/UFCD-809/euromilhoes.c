#define totalNumeros 5

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

int numerosResultado[totalNumeros];
int numerosEntrada[totalNumeros];

int quantidadeAcerto;

int comp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

//Popula a array numerosResultado com numeros unicos e de 1 a 50
void gerarNumerosResultado(){
    bool numeroRepete = false;
    int numeroGerado = 0;
    srand(time(NULL));
    for(int i = 0; i < totalNumeros; ++i){
        numeroGerado = (rand() % 50) + 1;
        for(int x = 0; x < i; ++x){
            if(numeroGerado = numerosResultado[x]){
                numeroGerado = (rand() % 50) + 1;
            }
        }
        numerosResultado[i] = numeroGerado;
    }
    
    //ordena a array com os numeros do resultado
    int n = sizeof(numerosResultado) / sizeof(numerosResultado[0]);
    qsort(numerosResultado, n, sizeof(numerosResultado[0]), comp);
}


//Aceita entrada dos numeros e popula a array
void introduzirNumeros(){
    bool numeroValido;
    int numEntrada;
        for(int i = 0; i < totalNumeros; ++i){
            do{
                printf("\nInsira o numero %d ", i + 1);
                scanf("%d", &numEntrada);
                if (numEntrada >= 1 && numEntrada <=50)
                {
                    numeroValido = true;
                    numerosEntrada[i] = numEntrada;
                }
                else{
                    printf("\nINSIRA UM NUMERO VALIDOOOOOOO!!!!!!");
                    numeroValido = false;
                }
            }while(!numeroValido);
        }
    //Ordena a Array com os numeros da entrada    
    int n = sizeof(numerosEntrada) / sizeof(numerosEntrada[0]);
    qsort(numerosEntrada, n, sizeof(numerosEntrada[0]), comp);
}

void compararNumeros(){
    quantidadeAcerto = 0;
    for (int i = 0; i < totalNumeros; ++i)
    {
        if(numerosEntrada[i] == numerosResultado[i]){
            quantidadeAcerto++;
        }
    }
    
}

int main(){
    gerarNumerosResultado();
    introduzirNumeros();
    compararNumeros();

    for(int i = 0; i <= 4; ++i){
        printf("%d ", numerosResultado[i]);
    }
    printf("\n");
    for(int i = 0; i <= 4; ++i){
        printf("%d ", numerosEntrada[i]);
    }
    printf("\nAcertou: %d", quantidadeAcerto);
}