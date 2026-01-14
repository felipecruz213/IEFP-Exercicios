#include <iostream>
using namespace std;

int galo[3][3];
char tabuleiro [5][5];

void popularTabuleiro(){
    for(int i = 0;i <= 4; ++i){ // acessa a linha
        for(int x = 0; i <= 4; ++x){ // acessa a coluna
            if(x + 1 % 2 == 0){
                tabuleiro[i][x] = '|';
            }
            else{
                tabuleiro[i][x] = ' ';
            }
        }
    }
}

void iniciarJogo(){

}


int main(){
    popularTabuleiro();
}
