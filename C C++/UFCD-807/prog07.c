#include <stdio.h>

int main(){
    int a, b;
    
    do{
        printf("Introduza um valor: ");
        scanf("%d", &a);

        printf("Introduza outro valor: ");
        scanf("%d", &b);

        printf("\nOs valores introduzidos foi %d, %d\n\n", a, b);
    }while (a <= b);
}