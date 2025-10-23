#include <stdio.h>

int a, b;

int main(){
    do{
        printf("Insira um valor entre 1 e 20: ");
        scanf("%d", &a);
        if(!(a >= 1 && a <= 20))printf("INSIRA UM VALOR VALIDOOOOOOOOO\n\n");
    }while (!(a >= 1 && a <= 20));

    do{
        printf("Insira um valor entre 0 e 9: ");
        scanf("%d", &b);
        if(!(b >= 0 && b <= 9))printf("INSIRA UM VALOR VALIDOOOOOOOOO\n\n");
    }while (!(b >= 0 && b <= 9));

    for (int i = 0; i < a; i++)
    {
        printf("%d ", b);
    }
    

}