#include <stdio.h>

int x, i;
int a;
int numEntrada;

int main(){
    int totalNumeros = 4;
    int numeros[totalNumeros];
    int tamanho = sizeof(numeros) / sizeof(numeros[0]);

    for(i = 0; i <= tamanho; i++){
        do{
            printf("INSIRA O NUMERO %d (ENTRE 0 E 50): ", i);
            scanf("%d", &numEntrada);      
            if (!(numEntrada >= 0 && numEntrada <= 50)){
             printf("TEM QUE INSERIR UM NUMERO VALIDOOOOOOOOO\n");
            }
            else{
                numeros[i] = numEntrada;
            }
        }while (!(numEntrada >= 0 && numEntrada <= 50));
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
    for(i = numeros[0]; i >= 0; --i){
        printf("%d ", i);
    }
    
    printf("\n");
    for(i = 0; i < numeros[totalNumeros] + 1; ++i){
        printf("%d ", i);
    }

    printf("\n");
    for(i = numeros[totalNumeros]; i >= numeros[0]; --i){
        printf("%d ", i);
    }
    
    printf("\n");
    printf("Maior: %d", numeros[totalNumeros]);

    printf("\n");
    printf("Menor: %d", numeros[0]);

}