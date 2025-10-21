//Crie uma função que receba duas datas e indique a mais antiga

#include<stdio.h>

int d1, d2;
int m1, m2;

int main(){
    printf("Digite o dia 1: ");
    scanf("%d", &d1);

    printf("Digite o mes 1: ");
    scanf("%d", &m1);

    printf("Digite o dia 2: ");
    scanf("%d", &d2);

    printf("Digite o mes 2: ");
    scanf("%d", &m2);

    if(m1<m2){printf("O mais velho é o primeiro");}
    else{
        if(m2<m1){printf("O mais velho é o segundo");}
        else{
            if(d1<d2){printf("O mais velho é o primeiro");}
            else{
                if(d2>d1){printf("O mais velho é o segundo");}
                 else{printf("Tem a mesma idade");}
            }
        }
    }
    }