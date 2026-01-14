#define totalNumeros 5
#define totalEstrelas 2

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

int numerosResultado[totalNumeros];
int numerosEntrada[totalNumeros];

int estrelasResultado[totalEstrelas];
int estrelasEntrada[totalEstrelas];

int quantidadeAcerto;
int estrelasAcerto;

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

void gerarEstrelasResultado(){
    bool numeroRepete = false;
    int numeroGerado = 0;
    srand(time(NULL));
    for(int i = 0; i < totalEstrelas; ++i){
        numeroGerado = (rand() % 12 + 1);
        for(int x = 0; x < i; ++x){
            if(numeroGerado = estrelasResultado[x]){
                numeroGerado = (rand() % 12) + 1;
            }
        }
        estrelasResultado[i] = numeroGerado;
    }
    
    //ordena a array com os numeros do resultado
    int n = sizeof(estrelasResultado) / sizeof(estrelasResultado[0]);
    qsort(estrelasResultado, n, sizeof(estrelasResultado[0]), comp);
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
                }
                else{
                    printf("\nINSIRA UM NUMERO VALIDOOOOOOO!!!!!!");
                    numeroValido = false;
                }
                for(int x = 0; x <= i; ++x){
                    if(numerosEntrada[x] == numEntrada){
                        printf("\nNao pode inserir numeros repetidos!!!!!");
                        numeroValido = false;
                    }
                }
                
                if(numeroValido){numerosEntrada[i] = numEntrada;}
            }while(!numeroValido);
        }
    //Ordena a Array com os numeros da entrada    
    int n = sizeof(numerosEntrada) / sizeof(numerosEntrada[0]);
    qsort(numerosEntrada, n, sizeof(numerosEntrada[0]), comp);
}

void introduzirEstrelas(){
    bool numeroValido;
    int numEntrada;
        for(int i = 0; i < totalEstrelas; ++i){
            do{
                printf("\nInsira a estrela %d ", i + 1);
                scanf("%d", &numEntrada);
                if (numEntrada >= 1 && numEntrada <=12)
                {
                    numeroValido = true;
                }
                else{
                    printf("\nINSIRA UM NUMERO VALIDOOOOOOO!!!!!!");
                    numeroValido = false;
                }
                for(int x = 0; x <= i; ++x){
                    if(estrelasEntrada[x] == numEntrada){
                        printf("\nNao pode inserir numeros repetidos!!!!!");
                        numeroValido = false;
                    }
                }

                if(numeroValido){estrelasEntrada[i] = numEntrada;}
            }while(!numeroValido);
        }
    //Ordena a Array com os numeros da entrada    
    int n = sizeof(estrelasEntrada) / sizeof(estrelasEntrada[0]);
    qsort(estrelasEntrada, n, sizeof(estrelasEntrada[0]), comp);
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

void compararEstrela(){
    estrelasAcerto = 0;
    for (int i = 0; i < totalEstrelas; ++i)
    {
        if(estrelasEntrada[i] == estrelasResultado[i]){
            estrelasAcerto++;
        }
    }
    
}

int main(){
    gerarEstrelasResultado();
    gerarNumerosResultado();
    introduzirNumeros();
    introduzirEstrelas();
    compararEstrela();
    compararNumeros();

    for(int i = 0; i <= totalNumeros - 1; ++i){
        printf("%d ", numerosResultado[i]);
    }
    printf("\n");
    for(int i = 0; i <= totalNumeros - 1; ++i){
        printf("%d ", numerosEntrada[i]);
    }
    printf("\n\n");
    for(int i = 0; i <= totalEstrelas - 1; ++i){
        printf("%d ", estrelasResultado[i]);
    }
    printf("\n");
        for(int i = 0; i <= totalEstrelas - 1; ++i){
        printf("%d ", estrelasEntrada[i]);
    }
    printf("\n%d Numeros + %d Estrelas ", quantidadeAcerto, estrelasAcerto);
}