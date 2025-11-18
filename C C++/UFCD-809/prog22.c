#include <stdio.h>
#include <string.h>
#include <stdbool.h> 
#define totalAlunos  8
#define totalMaterias 4

//0 - Matematica, 1- Ingles, 2-Portugues, 3-Historia 
int notasMaterias[totalAlunos - 1][totalMaterias - 1];
float medias[totalMaterias - 1];
int notasPositivas[totalMaterias - 1];


char saidaMateria[25];
bool notaValida = true; 

void validarNota(int nota){
    notaValida = (nota >= 1 && nota <= 20);
}

void nomeMateria(int idMateria){
    switch (idMateria)
    {
    case 0:
        strcpy(saidaMateria, "Matemática");
        break;
    case 1:
        strcpy(saidaMateria, "Inglês");
        break;
    case 2:
        strcpy(saidaMateria, "Português");
        break;
    case 3:
        strcpy(saidaMateria, "História");
        break;
    default:
        strcpy(saidaMateria, "ERRRO");
        break;
    }
}


void entradaNotas(){
    int entradaNota;
    for(int i = 0; i < totalAlunos; ++i){
        for(int x = 0; x < totalMaterias; ++x){
            do{
                if(!notaValida){printf("\n\nINSIRA UMA NOTA VALIDAAAAA\n\n");}
                nomeMateria(x);           
                printf("\nInsira a nota do aluno %d em %s: ", i + 1, saidaMateria);
                scanf("%d", &entradaNota);
                validarNota(entradaNota);
                if(notaValida){entradaNota = notasMaterias[i][x];}
            }while (!notaValida);
            nomeMateria(x);   
            
        }
    }
}


void notasMedia(){
    int acumulador = 0;
    for(int i = 0; i < totalMaterias; ++i){
        for(int x = 0; x < totalAlunos; ++x){
            acumulador += notasMaterias[x][i];
        }
    medias[i] = acumulador / totalMaterias;
    }
}


void maisPositivas(){
    for(int i = 0; i < totalMaterias; ++i){
        for(int x = 0; i < totalAlunos ;++x){
            if(notasMaterias[x][i] > 10){
                notasPositivas[i]++;
            } 
        }
    }
}





int main(){
    printf("INSIRA AS NOTAS\n");
    entradaNotas();

    return 0;
}