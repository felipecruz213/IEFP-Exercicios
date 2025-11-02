//Recebe as notas de 8 alunos validados de 1 a 20
// converte e as notas para uma avaliaçao de 1 a 5
//1..4   » 1
//5..9   » 2
//10..13 » 3
//14..17 » 4
//18..20 » 5

#include <stdio.h>

int main(){
    int i = 0;
    const int alunos = 8;
    int notas[alunos];

    for (i = 0; i < alunos; i++){
        do{
            printf("Insira a nota %d: ", i + 1);
            scanf("%d", &notas[i]);
            if (!(notas[i] >= 1 &&  notas[i] <= 20)){printf ("INSIRA UMA NOTA ENTRE 1 e 20");}
        }while(!(notas[i] >= 1 &&  notas[i] <= 20));
    }

    for (i = 0; i < alunos; i++){
        if (notas[i] >= 1 && notas[i] <= 4){notas[i] = 1;}
        else if (notas[i] >= 5 && notas[i] <= 9){ notas[i] = 2;}
        else if (notas[i] >= 10 && notas[i] <= 13){notas[i] = 3;}
        else if (notas[i] >= 14 && notas[i] <= 17){notas[i] = 4;}
        else if (notas[i] >= 18 && notas[i] <= 20){notas[i] = 5;}
    }

    
    for (i = 0; i < alunos; i++){
        printf("%d ", notas[i]);
    }


}