class Produto {
  String nome;
  double preco;
  int quantidade;

  Produto(String nome, double preco, int quantidade)
      : nome = nome,
        preco = preco,
        quantidade = quantidade;

  void exibirInformacoes() {
    print("Nome: $nome");
    print("Preço: R\$ $preco");
    print("Quantidade: $quantidade unidades");
  }
}

void main() {
  var meuProduto = Produto("Camiseta", 29.99, 10);

  meuProduto.exibirInformacoes();
}
