#include<stdio.h>

// Crie uma função que recebe um numero de 1 a 12 e imprime o mes correspondente
int main(){
    int NumeroMes;

        printf("Introduza o numero do mês: ");
        scanf("%d", &NumeroMes);

        if (NumeroMes > 13 || NumeroMes < 0)
        {
            printf("TEM QUE INSERIR UM NUMERO DE MES VALIDO!!!!!");
        }
        else{
            if (NumeroMes == 1 && NumeroMes <= 3){
                printf("Inverno");
            }
            else if (NumeroMes >= 4 && NumeroMes < 5)
            {
                printf("Primavera");
            }
            else if (NumeroMes >= 6 && NumeroMes <= 9)
            {
                printf("Verao");
            }
            else if (NumeroMes >= 10 && NumeroMes <= 12)
            {
                printf("Outono");
            }
        }
        
}