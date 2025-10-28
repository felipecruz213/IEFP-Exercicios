#include <stdio.h>

int x, i;
int a;
int numEntrada;

int main(){
    int totalNumeros = 5;
    int numeros[totalNumeros];
    int tamanho = sizeof(numeros) / sizeof(numeros[0]);

    for(i = 0; i <= tamanho; i++){
            printf("INSIRA O NUMERO %d : ", i);
            scanf("%d", &numEntrada);
            numeros[i] = numEntrada;
    }

    for (x = 0; x < tamanho - 1; ++x){
        for(int i = 0; i < tamanho - x; ++i){
            if (numeros[i] > numeros[i + 1]){
                int temp = numeros[i];
                numeros[i] = numeros[i + 1];
                numeros[i + 1] = temp; 
            }
        }
    }
    
    printf("\n");
    printf("Maior: %d", numeros[totalNumeros]);

    printf("\n");
    printf("Menor: %d", numeros[0]);

}