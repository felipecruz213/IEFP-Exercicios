"""
Programa para gestão do catálogo de produtos. Este programa permite:
    - Listar o catálogo
    - Pesquisar por alguns campos
    - Eliminar um registo do catálogo
    - Guardar o catálogo em ficheiro

v1:
    a) Construtor
        - id: > 0 e 5 dígitos
        - nome: pelo menos 2 palavras, pelo menos 2 letras cada
        - tipo: AL, DL, FRL
        - quantidade: > 0
        - preco: str | dec,  >= 0 mas preço é sempre dec
        - Validações com excepção: InvaliAttr(ValueError)
    b) Atributos
        - como os parâmetros mas preço é dec
    c) Métodos
        - para já só validação do nome
    d) docstring
"""

from decimal import Decimal as dec

class Produto:
    """
    Representação de um produto em memória.
    """
    def __init__(
            self,
            id_: int,               # > 0 e 5 dígitos
            nome: str,              # pelo menos 2 palavras, pelo menos 2 letras cada
            tipo: str,              # AL, DL, FRL
            quantidade: int,        # >= 0
            preco: str | dec        # >= 0
    ):
        # 1. Validar os argumentos (os valores dos parâmetros)
        if _id <= 0 or len(str(id_)):
            raise AttributeError(f"{id_=} Inválido")
        # 2. Inicializar/definir o objecto (convertendo os valores
        # para uma representação interna caso tal seja necessário)
        self.id = id_
        self.nome = nome
        self.tipo = tipo
        self.quantidade = quantidade
        self.preco = dec(preco)


def main():
    # 30987,pão de milho,AL,2,1
    prod1 = Produto(
        id_ = 30987,
        nome = 'pão de milho',
        tipo = 'AL',
        quantidade = 2,
        preco = '1',
    )

    # 30098,leite mimosa,AL,10,2
    prod2 = Produto(
        id_ = 30098,
        nome = 'leite mimosa',
        tipo = 'AL',
        quantidade = 10,
        preco = dec('2'),
    )

    print(f"Produto ID: {prod1.id} NOME: {prod1.nome} ")
    print(f"Produto ID: {prod2.id} NOME: {prod2.nome} ")

if __name__ == '__main__':
    main()

"""
    prod1 = Produto(3097, 'pão de milho', 'AL', 2, '1')

    self = Produto.__new__(3097, 'pão de milho', 'AL', 2, '1')
    Produto.__init__(self, 3097, 'pão de milho', 'AL', 2, '1')

"""