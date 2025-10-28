#include <stdio.h>

int main(){
    int bues [5], i;

    bues[0] = 1; bues[1] = 8; bues[2]=5; bues[3]=7; bues[4]=12;
    
    printf ("\nA variavel bues e bue grande ....\n");

    printf (">Indice 0: %d \n", bues[0]);
    printf (">Indice 1: %d \n", bues[1]);
    printf (">Indice 2: %d \n", bues[2]);
    printf (">Indice 3: %d \n", bues[3]);
    printf (">Indice 4: %d \n", bues[4]);

    //---------------------------------------------------------
    printf("\n\nAgora o mesmo com um ciclo for\n");
    for(i = 0; i < 5; ++i){
        printf(">Indice %d : %d \n",i , bues[i]);
    }

    //----------------------------------------------------------

    printf("\n Agora a introduzir valores no array\n");
    for (i=0;i< 5; i++){
        printf("Introduza o %dº valor: ",i + 1);
        scanf("%d", &bues[i]);
    }

    printf("\n\nOs valores introduzidos via teclado foram\n");
    for(i = 0; i < 5; ++i){
        printf(">Indice %d : %d \n",i , bues[i]);
    }
    
}