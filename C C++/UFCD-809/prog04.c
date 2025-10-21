//Crie uma função que recebe 4 valores e indica qual é o maior
#include<stdio.h>

int totalNumeros = 4;

int main(){
    int num[totalNumeros];
    int count = totalNumeros;
    int i = 0;
    
    for (i = 0; i < count; i++)
    {
        printf("\nInsira o numero %d ", i);
        scanf("%d", &num[i]);
    }


    int indiceMaior = 0;
    int indiceMaisUm = 0;
    //Itera atraves da array e compara com o proximo valor
    for (i = 0; i < count; i++) {
        indiceMaisUm = i + 1;
        if(indiceMaisUm < totalNumeros){
            if(num[i] > num[indiceMaisUm]){
            indiceMaior = i;
        }
        }
    }

    printf("O maior é: %d", num[indiceMaior]);
}