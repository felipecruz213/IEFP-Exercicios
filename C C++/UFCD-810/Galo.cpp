#include <iostream>
using namespace std;

int galo[9];
int jog1;
int jog2;
bool resultado=false;
int njogada;




void mostraJogo() {
	
	cout<<endl;
	
	if (galo[0]==1) cout<<"X"; 
	else if (galo[0]==2) cout<<"O"; 
	     else if (galo[0]==0) cout<<" "; 
	cout<<"|";
	
	if (galo[1]==1) cout<<"X"; 
	else if (galo[1]==2) cout<<"O"; 
	     else if (galo[1]==0) cout<<" "; 
	cout<<"|";
	
	if (galo[2]==1) cout<<"X"; 
	else if (galo[2]==2) cout<<"O"; 
	     else if (galo[2]==0) cout<<" "; 
	cout<<endl<<"-----"<<endl;
	
	if (galo[3]==1) cout<<"X"; 
	else if (galo[3]==2) cout<<"O"; 
	     else if (galo[3]==0) cout<<" "; 
	cout<<"|";
	
	if (galo[4]==1)	cout<<"X"; 
	else if (galo[4]==2) cout<<"O"; 
	     else if (galo[4]==0) cout<<" "; 
	cout<<"|";
	
	if (galo[5]==1)	cout<<"X"; 
	else if (galo[5]==2) cout<<"O"; 
	     else if (galo[5]==0) cout<<" "; 
	cout<<endl<<"-----"<<endl;
	
	if (galo[6]==1) cout<<"X";
	else if (galo[6]==2) cout<<"O";
	     else if (galo[6]==0) cout<<" ";
	cout<<"|";
	
	if (galo[7]==1) cout<<"X";
	else if (galo[7]==2) cout<<"O";
	     else if (galo[7]==0) cout<<" ";
	cout<<"|";
	
	if (galo[8]==1) cout<<"X";
	else if (galo[8]==2) cout<<"O";
	     else if (galo[8]==0) cout<<" ";
		
}



void jogador1() {
	
	cout<<endl<<endl<<"escolha a jogada do jogador 1 : ";
	cin>>jog1;
	
	do {
		
	    if (galo[jog1]!=0) {
		    cout<<"casa ocupada";
			cout<<endl<<endl<<"escolha a jogada do jogador 1 : ";
			cin>>jog1;
	    }   
	} while (galo[jog1]!=0);
	galo[jog1]=1;
	njogada++;
}


void jogador2() {
	
	cout<<endl<<"escolha a jogada do jogador 2 : ";
	cin>>jog2;
	
	do {
		
	    if (galo[jog2]!=0) {
		    cout<<"casa ocupada";
			cout<<endl<<"escolha a jogada do jogador 2 : ";
			cin>>jog2;
	    }

	} while (galo[jog2]!=0);
	galo[jog2]=2;
	njogada++;
}	






void veres(){
	
	if (galo[0]==1 && galo[1]==1 && galo[2]==1){
		resultado=true;
		cout<<endl<<"jogador 1 vencedor!"<<endl;
		return;
	}
	
	if (galo[0]==2 && galo[1]==2 && galo[2]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}
	
	if (galo[0]==1 && galo[4]==1 && galo[8]==1) {
		resultado=true;
		cout<<endl<<"jogador 1 vencedor!"<<endl;
		return;
	}
	
	if (galo[0]==2 && galo[4]==2 && galo[8]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}

	if (galo[3]==2 && galo[4]==2 && galo[5]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}
	
	if (galo[3]==1 && galo[4]==1 && galo[5]==1) {
		resultado=true;
		cout<<endl<<"jogador 1 vencedor!"<<endl;
		return;
	}
	
	if (galo[6]==2 && galo[7]==2 && galo[8]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}
	
	if (galo[6]==1 && galo[7]==1 && galo[8]==1) {
		resultado=true;
		cout<<endl<<"jogador 1 vencedor!"<<endl;
		return;
	}
	
	if (galo[0]==2 && galo[3]==2 && galo[6]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}
	
	if (galo[0]==1 && galo[3]==1 && galo[6]==1) {
		resultado=true;
		cout<<endl<<"jogador 1 vencedor!"<<endl;
		return;
	}
	
	if (galo[1]==2 && galo[4]==2 && galo[7]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}
	
	if (galo[1]==1 && galo[4]==1 && galo[7]==1) {
		resultado=true;
		cout<<endl<<"jogador 1 vencedor!"<<endl;
		return;
	}
	
	if (galo[2]==2 && galo[5]==2 && galo[8]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}
	
	if (galo[2]==1 && galo[5]==1 && galo[8]==1) {
		resultado=true;
		cout<<endl<<"jogador 1 vencedor!"<<endl;
		return;
	}
	
	if (galo[0]==2 && galo[4]==2 && galo[8]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}
	
	if (galo[2]==2 && galo[4]==2 && galo[6]==2) {
		resultado=true;
		cout<<endl<<"jogador 2 vencedor!"<<endl;
		return;
	}
	
	if (galo[2]==1 && galo[4]==1 && galo[6]==1) {
		resultado=true;
		cout<<endl<<"jogador 1 vencedor!"<<endl;
		return;
	}

	
			
}

int main() {
    
    int i;
	
	    // Iniciliza jogo
	    for (i=0; i<9; i++) galo[i]=0;
	    njogada = 0;
		
		do {
			mostraJogo();
			
			jogador1();
			
			veres();
			if (resultado==true || njogada==9) {
				mostraJogo();
				cin.get();
				break;
			}
			
			mostraJogo();
			
			jogador2();
			
			veres();
			if (resultado==true || njogada==9) {
			   mostraJogo();
			   cin.get();
			   break;
           		}

		} while (resultado!=true || njogada==9);
		
		cout << endl << "Adeus e obrigado !!!!";
		cin.get();
}
