//Uma função que recebe dois valores e mostra qual o maior

#include<stdio.h>

int a,b;


int main()
{
    printf("Introduza um valor: ");
    scanf("%d", &a);
    printf("\nO valor introduzido foi: %d", a);
    printf("\n\nnIntroduza outro valor: ");
    scanf("%d", &b);
    printf("\nO valor introduzido foi: %d", b);
    if (a > b){
        printf("\n\nO maior é %d", a);
    }
    else{
        printf("\n\nO maior %d", b);
    }
    return 0;
}