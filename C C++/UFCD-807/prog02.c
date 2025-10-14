#include<stdio.h>

// Crie uma função que recebe um numero de 1 a 12 e imprime o mes correspondente
int main(){
    int NumeroMes;

        printf("Introduza o numero do mês: ");
        scanf("%d", &NumeroMes);

        if (NumeroMes > 12 || NumeroMes < 1)
        {
            printf("TEM QUE INSERIR UM NUMERO DE MES VALIDO!!!!!");
        }
        else{
            switch (NumeroMes)
            {
            case 1:
                printf("Janeiro");
                break;
            
            case 2:
                printf("Fevereiro");
                break;
            
            case 3:
                printf("Março");
                break;
            
            case 4:
                printf("Abril");
                break;
            
            case 5:
                printf("Maio");
                break;

            case 6:
                printf("Junho");
                break;
            
            case 7:
                printf("Julho");
                break;
            
            case 8:
                printf("Agosto");
                break;
            
            case 9:
                printf("Setembro");
                break;
            
            case 10:
                printf("Outubro");
                break;
            
            case 11:
                printf("Novembro");
                break;
            
            case 12: 
                printf("Dezembro");
                break;
            
            default:
                break;
            }
        }
        
}