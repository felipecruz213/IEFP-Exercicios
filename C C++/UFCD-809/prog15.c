#include <stdio.h>

int main(){
    int numEntrada = 0;
    int resultado = 0;

    do{
        printf("INSIRA UM NUMERO (ENTRE 1 E 9) (0 PARA SAIR): ");
        scanf("%d", &numEntrada);      
        if (numEntrada <= 0 && numEntrada >= 9){
            printf("TEM QUE INSERIR UM NUMERO VALIDOOOOOOOOO\n");
        }

        if(numEntrada != 0){
            for(int x = 1; x <= numEntrada; ++x){
                printf("\n\n------TABUADA DO %d ------\n", x);
                for(int i = 1; i <= 9; i++){
                    resultado = x * i;
                    printf("%d x %d = %d \n", x, i, resultado);
                }

            }
        }

        printf("\n\nDESEJA CONTINUAR? (INSIRA 0 PARA SAIR)");
        scanf("%d", &numEntrada); 
        
    }while (numEntrada != 0);
    
}