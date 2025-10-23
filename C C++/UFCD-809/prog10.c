//Fatorial de numeros

#include <stdio.h>

int a;
int totalFatorial = 1;
int totalSoma = 0;

int main(){
    printf("Digite um valor: ");
    scanf("%d", &a);

    if(a <= 0){
        printf("TEM QUE INSERIR UM NUMERO VALIROOO");
    }
    else{
        for(int i = 1; i <= a; i++){
            totalFatorial *= i;
            totalSoma += i;
        }
        printf("------\nFatorial: %d \n", totalFatorial);
        printf("Soma: %d ", totalSoma);
    }


}