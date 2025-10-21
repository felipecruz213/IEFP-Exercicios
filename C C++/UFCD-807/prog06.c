#include <stdio.h>


int main (){
    int a = 0;

    do{
        printf("Introduza um valor: ");
        scanf("%d", &a);
        printf("\nO valor introduzido foi %d\n\n", a);

    }while (a != 0);
    return 0;
    
}