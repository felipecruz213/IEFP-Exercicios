#define totalValoresNotas 5
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

int quantiaCaixa = 0;
int quantiaLevantamento = 0;
int totalNotas[totalValoresNotas];

void calcularQuantia(){
    quantiaCaixa += totalNotas[0] * 100;
    quantiaCaixa += totalNotas[1] * 50;
    quantiaCaixa += totalNotas[2] * 20;
    quantiaCaixa += totalNotas[3] * 10;
    quantiaCaixa += totalNotas[4] * 5;
}

void mostrarQuantia(){
    for(int i = 0; i <= 4; i++){
        printf("%d ", totalNotas[i]);
    }
}

void levantarDinheiro(int quantia){
    calcularQuantia();
    mostrarQuantia();
    int quantiaCalculo = quantia;
    int quantidadeNotas[totalValoresNotas] = {0, 0, 0, 0, 0};

    if(quantiaCalculo % 5 != 0)
    {
        printf("Insira um valor valido!!!!\n");
    }
    else{
        if(quantiaCalculo >= 100 && totalNotas[0] > 0){
            quantidadeNotas[0] = quantiaCalculo/100;
            quantiaCalculo = quantiaCalculo % 100;
            totalNotas[0] -= quantidadeNotas[0];
        }
        if((quantiaCalculo / 50) <= totalNotas[1]){
            quantidadeNotas[1] = quantiaCalculo/50;
            quantiaCalculo = quantiaCalculo % 50;
            totalNotas[1] -= quantidadeNotas[1];
        }
        if((quantiaCalculo / 20) <= totalNotas[2]){
            quantidadeNotas[2] = quantiaCalculo/20;
            quantiaCalculo = quantiaCalculo % 20;
            totalNotas[2] -= quantidadeNotas[2];   
        }        
        if((quantiaCalculo / 10) <= totalNotas[3]){
            quantidadeNotas[3] = quantiaCalculo/10;
            quantiaCalculo = quantiaCalculo % 10;
            totalNotas[3] -= quantidadeNotas[3];   
        } 
        if((quantiaCalculo / 5) <= totalNotas[4]){
            quantidadeNotas[4] = quantiaCalculo/5;
            quantiaCalculo = quantiaCalculo % 5;
            totalNotas[4] -= quantidadeNotas[4];
        }


        printf("[100]%d", quantidadeNotas[0]);
        printf(" [50]%d", quantidadeNotas[1]);
        printf(" [20]%d", quantidadeNotas[2]);
        printf(" [10]%d", quantidadeNotas[3]); 
        printf(" [5]%d", quantidadeNotas[4]);
    }
}


int main(){
    totalNotas[0] = 3; 
    totalNotas[1] = 3; 
    totalNotas[2] = 3; 
    totalNotas[3] = 3;
    totalNotas[4] = 3;

    bool repetir = true;
    do{
        printf("\n==================MULTIBANCO=====================\n");
        printf("Insira a quantidade para levantar: ");
        scanf("%d", &quantiaLevantamento);
        levantarDinheiro(quantiaLevantamento);
    }while(repetir);
}