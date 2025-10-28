#include <stdio.h>


int main(){
    int i, x;
    int alunos = 5;
    int entradaNota = 0;
    int maisPositivas = 0;
    int melhorTurma1 = 0;
    int melhorTurma2 = 0;
    int positivasTurma1 = 0;
    int positivasTurma2 = 0;
    float turma1[alunos - 1];
    float turma2[alunos - 1];
    float mediaturma = 0.0;


    // Entrada de notas da turma 1
    for(i = 0; i < alunos; i++){
        do{
            printf("Insira a nota do aluno %d da Turma 1: " , i + 1);
            scanf("%d", &entradaNota);
            if(entradaNota < 0 || entradaNota > 20){
                printf("\n\n---TEM QUE INSERIR UMA NOTA VALIDAAAA---\n\n");
            }
            else{
                turma1[i] = entradaNota;
            }
        }while (entradaNota < 0 || entradaNota > 20);
    }


    // Entrada de notas da turma 2
    for(i = 0; i < alunos; i++){
        do{
            printf("Insira a nota do aluno %d da Turma 2: " , i + 1);
            scanf("%d", &entradaNota);
            if(entradaNota < 0 || entradaNota > 20){
                printf("\n\n---TEM QUE INSERIR UMA NOTA VALIDAAAA---\n\n");
            }
            else{
                turma2[i] = entradaNota;
            }
        }while (entradaNota < 0 || entradaNota > 20);
    }

    for(i = 0; i < alunos - 1; i++){
        if(turma1[i + 1] > turma1[i]){
            melhorTurma1 = turma1[i + 1];
        }
    }


    for(i = 0; i < alunos - 1; i++){
        if(turma2[i + 1] > turma2[i]){
            melhorTurma2 = turma2[i + 1];
        }
    }

    for(i = 0; i < alunos; i++){
        if(turma1[i] >= 10) positivasTurma1++;
        if(turma2[i] >= 10) positivasTurma2++;
    }

    for(i = 0; i < alunos; i++){
        mediaturma = turma1[i] + mediaturma;
        mediaturma = turma2[i] + mediaturma;
    }

    mediaturma = mediaturma / (alunos*2);

    printf("\n----ESCOLA----\n\n");

    if(positivasTurma1 > positivasTurma2){
        printf("\nA turma 1 tem mais positivas");
    }
    else{
        printf("\nA turma 2 tem mais positivas");
    }

    if(melhorTurma1 > melhorTurma2){
        printf("\nA melhor nota é da turma 1 com %d", melhorTurma1);
    }
    else{
        printf("\nA melhor nota é da  turma 2 com %d", melhorTurma2);
    }

    printf("\nA media da escola é: %f", mediaturma);


}