#include <stdio.h>

int x, i;
int a;
int numEntrada;

int main(){
    int totalNumeros = 5;
    int numeros[totalNumeros];
    int tamanho = sizeof(numeros) / sizeof(numeros[0]);
    int maiorquedez = 0;

        for(i = 0; i <= tamanho; i++){
            do{
                printf("INSIRA O NUMERO %d : ", i);
                scanf("%d", &numEntrada);
                if(!(numEntrada >= 0 && numEntrada <= 20)){
                    printf("\n\nINSIRA UM NUMERO VALODOOOO\n\n");
                }
                else{
                    numeros[i] = numEntrada;
                    if(numEntrada >= 10) maiorquedez++;
                }
            }while(!(numEntrada >= 1 && numEntrada <= 20));
        }
    

    for (x = 0; x < tamanho; ++x){
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
     
    printf("\n");
    printf("Maiores ou iguais a 10: %d", maiorquedez);

}