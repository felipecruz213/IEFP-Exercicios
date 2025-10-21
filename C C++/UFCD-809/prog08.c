#include <stdio.h>

int a = 0;

int main(){
    do{
        printf("\n\nInsira um valor entre 1 e 9: ");
        scanf("%d", &a);
        if (a < 1 || a > 9)
        {
            printf("\n\nTEM QUE INSERIR UM VALOR VALIDO !!!!!!!\n\n");
        }
        else{
            for (int i = 0; i < a+1; i++)
            {
                printf("%d", i);
            }
            
        }
    }while (a < 1 || a > 9); 
}