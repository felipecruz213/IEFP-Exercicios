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
            for(int i = 1; i <= 9; i++){
            resultado = numEntrada * i;
            printf("%d x %d = %d \n", numEntrada, i, resultado);
            }
        }

        printf("DESEJA CONTINUAR? (INSIRA 0 PARA SAIR)");
        scanf("%d", &numEntrada); 
        
    }while (numEntrada != 0);
    
}