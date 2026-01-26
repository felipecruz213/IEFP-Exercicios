#include <iostream>
#include <vector>
#include <string>
#include <cstdlib>  // Para rand() e srand()
#include <ctime>    // Para time()
#include <algorithm> // Para sort()
#include <iomanip>  // Para formatar a tabela

using namespace std;

// Estrutura para representar uma Seleção
struct Time {
    string nome;
    int pontos;
    int vitorias;
    int empates;
    int derrotas;
    int golsPro;
    int golsContra;
    int saldoGols;

    // Construtor para inicializar os dados
    Time(string n = "") {
        nome = n;
        pontos = 0;
        vitorias = 0;
        empates = 0;
        derrotas = 0;
        golsPro = 0;
        golsContra = 0;
        saldoGols = 0;
    }
};

// Função para comparar dois times e ordenar a tabela
// Ordem: 1. Pontos, 2. Saldo de Gols, 3. Gols Pró
bool compararTimes(const Time &a, const Time &b) {
    if (a.pontos != b.pontos)
        return a.pontos > b.pontos; // Maior pontuação
    if (a.saldoGols != b.saldoGols)
        return a.saldoGols > b.saldoGols; // Melhor saldo
    return a.golsPro > b.golsPro; // Mais gols marcados
}

// Função que simula uma partida entre dois times
void jogarPartida(Time &t1, Time &t2) {
    // Gera placares aleatórios entre 0 e 7
    int placar1 = rand() % 8; 
    int placar2 = rand() % 8;

    // Atualiza estatísticas de gols
    t1.golsPro += placar1;
    t1.golsContra += placar2;
    t1.saldoGols = t1.golsPro - t1.golsContra;

    t2.golsPro += placar2;
    t2.golsContra += placar1;
    t2.saldoGols = t2.golsPro - t2.golsContra;

    // Exibe o resultado da partida
    cout << "   " << left << setw(15) << t1.nome 
         << placar1 << " x " << placar2 << " " 
         << t2.nome << endl;

    // Lógica da Pontuação
    if (placar1 > placar2) {
        t1.pontos += 3;
        t1.vitorias++;
        t2.derrotas++;
    } else if (placar2 > placar1) {
        t2.pontos += 3;
        t2.vitorias++;
        t1.derrotas++;
    } else {
        t1.pontos += 1;
        t2.pontos += 1;
        t1.empates++;
        t2.empates++;
    }
}

int main() {
    // Inicializa a semente aleatória com o tempo atual
    srand(time(0));

    vector<Time> selecoes(4);
    
    cout << "========================================" << endl;
    cout << "      MINI CAMPEONATO DE SELECOES       " << endl;
    cout << "========================================" << endl;

    // Entrada dos nomes
    for (int i = 0; i < 4; i++) {
        cout << "Digite o nome da selecao " << (i + 1) << ": ";
        getline(cin, selecoes[i].nome);
    }

    cout << "\n========================================" << endl;
    cout << "          RESULTADOS DOS JOGOS          " << endl;
    cout << "========================================" << endl;

    // Lógica de "Todos contra Todos"
    // O loop garante que cada time jogue apenas uma vez contra os outros
    for (int i = 0; i < 4; i++) {
        for (int j = i + 1; j < 4; j++) {
            jogarPartida(selecoes[i], selecoes[j]);
        }
    }

    // Ordena a classificação final
    sort(selecoes.begin(), selecoes.end(), compararTimes);

    cout << "\n========================================" << endl;
    cout << "           TABELA DE CLASSIFICACAO      " << endl;
    cout << "========================================" << endl;
    cout << left << setw(15) << "TIME" 
         << setw(5) << "PTS" 
         << setw(5) << "V" 
         << setw(5) << "E" 
         << setw(5) << "D" 
         << setw(5) << "GP" 
         << setw(5) << "GC" 
         << setw(5) << "SG" << endl;
    cout << "----------------------------------------" << endl;

    for (const auto& time : selecoes) {
        cout << left << setw(15) << time.nome 
             << setw(5) << time.pontos 
             << setw(5) << time.vitorias 
             << setw(5) << time.empates 
             << setw(5) << time.derrotas 
             << setw(5) << time.golsPro 
             << setw(5) << time.golsContra 
             << setw(5) << time.saldoGols << endl;
    }

    cout << "\n########################################" << endl;
    cout << "   CAMPEAO: " << selecoes[0].nome << " com " << selecoes[0].pontos << " pontos!" << endl;
    cout << "########################################" << endl;

    return 0;
}