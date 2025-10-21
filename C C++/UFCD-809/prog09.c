#include <stdio.h>

int a = 0;
int b = 0;

int valorMaior, valorMenor;

int main(){
    printf("Digite um valor: ");
    scanf("%d", &a);

    printf("Digite outro valor: ");
    scanf("%d", &b);

    if(a == b){
        printf("OS VALORES SAO IGUAIS!!!!!");
    }
    else{
        if (a > b)
        {
            valorMaior = a;
            valorMenor = b;
        }
        else{
            valorMaior = b;
            valorMenor = a;
        }
        
        for(int i = valorMenor; i < valorMaior +1; i++){
            printf("%d ", i);
        }
    }

}