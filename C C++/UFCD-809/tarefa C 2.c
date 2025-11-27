#include <stdio.h>
#include <stdbool.h>

void calcularImposto(int vencimentoIliquido){
    float imposto = 0.00;
    int valorImposto;
    bool pagaImposto = true;
    if (vencimentoIliquido <= 900){
        pagaImposto = false;
    }
    else if (vencimentoIliquido > 900 && vencimentoIliquido < 1200)
    {
        imposto = 0.10;
    }
    else if (vencimentoIliquido > 1200 && vencimentoIliquido < 1600)
    {
        imposto = 0.20;
    }
    else if (vencimentoIliquido > 1600 && vencimentoIliquido < 2500)
    {
        imposto = 0.30;
    }
    else if(vencimentoIliquido > 2500 && vencimentoIliquido < 4000)
    {
        imposto = 0.40;
    }
    else{
        imposto = 0.50;
    }

    if (pagaImposto){
    valorImposto = vencimentoIliquido * imposto;
    }
    printf("O valor do imposto é : %d", valorImposto);
}

int main(){
    int valor;
    printf("Insira o vencimento iliquido: ");
    scanf("%d", &valor);
    calcularImposto(valor);
}