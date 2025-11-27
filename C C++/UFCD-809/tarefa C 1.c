#include <stdio.h>

void calcularHoras(int horas){
    int horasCalculo = horas;
    int vencimentoSemanal = 0;
    if(horasCalculo >= 20){
        vencimentoSemanal += 20 * 8;
        horasCalculo -= 20;
    }
    else{
        vencimentoSemanal = horasCalculo * 8;
        horasCalculo = 0;
    }
    if(horasCalculo > 30){
        vencimentoSemanal = 30 * 11;
        horasCalculo -= 10;
    }
    else{
        vencimentoSemanal = horasCalculo * 11;
        horasCalculo = 0;
    }
    if (horasCalculo > 45){
        vencimentoSemanal = horasCalculo * 15;
        horasCalculo -= 15;
    }
    else{
        vencimentoSemanal = horasCalculo * 15;
    }
    if (horasCalculo > 0){
        vencimentoSemanal += horasCalculo * 20;
    }

    printf("\n O Vencimento Semanal é: %d", vencimentoSemanal);
}

int main(){
    int quantidadeHoras = 0;
    printf("Insira a quantidade de horas: ");
    scanf ("%d", &quantidadeHoras);
    calcularHoras(quantidadeHoras);
}   