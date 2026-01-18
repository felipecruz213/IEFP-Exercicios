#include <iostream>
#include <vector>
#include <limits> // Para limpeza de buffer

using namespace std;

// Definições do tamanho do tabuleiro
const int LINHAS = 6;
const int COLUNAS = 7;

// Símbolos dos jogadores
const char JOGADOR_1 = 'X';
const char JOGADOR_2 = 'O';
const char VAZIO = ' ';

// Função para inicializar o tabuleiro
void inicializarTabuleiro(vector<vector<char>>& tabuleiro) {
    for (int i = 0; i < LINHAS; i++) {
        for (int j = 0; j < COLUNAS; j++) {
            tabuleiro[i][j] = VAZIO;
        }
    }
}

// Função para exibir o tabuleiro
void desenharTabuleiro(const vector<vector<char>>& tabuleiro) {
    cout << "\n";
    for (int i = 0; i < LINHAS; i++) {
        cout << "| ";
        for (int j = 0; j < COLUNAS; j++) {
            cout << tabuleiro[i][j] << " | ";
        }
        cout << "\n";
    }
    cout << "-----------------------------\n";
    cout << "  1   2   3   4   5   6   7  \n\n";
}

// Função para verificar se alguém ganhou
bool verificarVitoria(const vector<vector<char>>& tabuleiro, char jogador) {
    // Verificar Horizontal (-)
    for (int i = 0; i < LINHAS; i++) {
        for (int j = 0; j < COLUNAS - 3; j++) {
            if (tabuleiro[i][j] == jogador && 
                tabuleiro[i][j+1] == jogador &&
                tabuleiro[i][j+2] == jogador &&
                tabuleiro[i][j+3] == jogador) {
                return true;
            }
        }
    }

    // Verificar Vertical (|)
    for (int i = 0; i < LINHAS - 3; i++) {
        for (int j = 0; j < COLUNAS; j++) {
            if (tabuleiro[i][j] == jogador &&
                tabuleiro[i+1][j] == jogador &&
                tabuleiro[i+2][j] == jogador &&
                tabuleiro[i+3][j] == jogador) {
                return true;
            }
        }
    }

    // Verificar Diagonal Principal (\)
    for (int i = 0; i < LINHAS - 3; i++) {
        for (int j = 0; j < COLUNAS - 3; j++) {
            if (tabuleiro[i][j] == jogador &&
                tabuleiro[i+1][j+1] == jogador &&
                tabuleiro[i+2][j+2] == jogador &&
                tabuleiro[i+3][j+3] == jogador) {
                return true;
            }
        }
    }

    // Verificar Diagonal Secundária (/)
    for (int i = 0; i < LINHAS - 3; i++) {
        for (int j = 3; j < COLUNAS; j++) {
            if (tabuleiro[i][j] == jogador &&
                tabuleiro[i+1][j-1] == jogador &&
                tabuleiro[i+2][j-2] == jogador &&
                tabuleiro[i+3][j-3] == jogador) {
                return true;
            }
        }
    }

    return false;
}

// Função para verificar se o tabuleiro está cheio (Empate)
bool verificarEmpate(const vector<vector<char>>& tabuleiro) {
    for (int j = 0; j < COLUNAS; j++) {
        if (tabuleiro[0][j] == VAZIO) {
            return false; // Ainda há espaço no topo de alguma coluna
        }
    }
    return true;
}

// Função para fazer a jogada
bool fazerJogada(vector<vector<char>>& tabuleiro, int coluna, char jogador) {
    // A coluna recebida é 1-7, ajustamos para índice 0-6
    int colIndex = coluna - 1;

    // Verificar se a coluna é válida
    if (colIndex < 0 || colIndex >= COLUNAS) {
        cout << "Coluna invalida! Tente entre 1 e 7.\n";
        return false;
    }

    // Verificar se a coluna está cheia (topo ocupado)
    if (tabuleiro[0][colIndex] != VAZIO) {
        cout << "Coluna cheia! Escolha outra.\n";
        return false;
    }

    // Colocar a peça na posição mais baixa disponível ("gravidade")
    for (int i = LINHAS - 1; i >= 0; i--) {
        if (tabuleiro[i][colIndex] == VAZIO) {
            tabuleiro[i][colIndex] = jogador;
            return true;
        }
    }
    return false;
}

int main() {
    // Criação do tabuleiro 6x7
    vector<vector<char>> tabuleiro(LINHAS, vector<char>(COLUNAS));
    
    inicializarTabuleiro(tabuleiro);

    bool jogoAtivo = true;
    char jogadorAtual = JOGADOR_1;
    int jogada;

    cout << "=== BEM-VINDO AO LIGUE 4 ===\n";

    while (jogoAtivo) {
        desenharTabuleiro(tabuleiro);
        
        cout << "Vez do Jogador " << jogadorAtual << ".\n";
        cout << "Escolha uma coluna (1-7): ";
        
        // Tratamento de entrada para evitar crash se digitar letra
        if (!(cin >> jogada)) {
            cout << "Entrada invalida. Digite apenas numeros.\n";
            cin.clear(); // Limpa o estado de erro
            cin.ignore(numeric_limits<streamsize>::max(), '\n'); // Descarta o buffer
            continue;
        }

        if (fazerJogada(tabuleiro, jogada, jogadorAtual)) {
            
            // Verifica Vitória
            if (verificarVitoria(tabuleiro, jogadorAtual)) {
                desenharTabuleiro(tabuleiro);
                cout << "\n*** PARABENS! O Jogador " << jogadorAtual << " VENCEU! ***\n";
                jogoAtivo = false;
            } 
            // Verifica Empate
            else if (verificarEmpate(tabuleiro)) {
                desenharTabuleiro(tabuleiro);
                cout << "\n*** O JOGO TERMINOU EM EMPATE! ***\n";
                jogoAtivo = false;
            }
            // Troca de Turno
            else {
                jogadorAtual = (jogadorAtual == JOGADOR_1) ? JOGADOR_2 : JOGADOR_1;
            }
        }
        // Se a jogada for inválida, o loop repete e pede entrada novamente
    }

    cout << "Fim de jogo.\n";
    return 0;
}