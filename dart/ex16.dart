class CarrinhoDeCompras {
  Map<String, int> itens = {};
  
  void adicionarItem(String item, int quantidade) {
    if (itens.containsKey(item)) {
      itens[item] = itens[item]! + quantidade;
    } else {
      itens[item] = quantidade;
    }
    print("$quantidade $item(s) adicionado(s) ao carrinho.");
  }
  
  void removerItem(String item) {
    if (itens.containsKey(item)) {
      itens.remove(item);
      print("$item removido do carrinho.");
    } else {
      print("$item não encontrado no carrinho.");
    }
  }
  
  double calcularTotal() {
    double total = 0;
    itens.forEach((item, quantidade) {
      total += obterPreco(item) * quantidade;
    });
    return total;
  }
  
  double obterPreco(String item) {
    // Implemente a lógica real para obter os preços dos itens.
    // Substitua este retorno fictício pelo valor real.
    if (item == "ProdutoA") return 10.0;
    if (item == "ProdutoB") return 20.0;
    if (item == "ProdutoC") return 15.0;
    return 0.0; // Valor padrão se não for encontrado.
  }
}

void main() {
  CarrinhoDeCompras carrinho = CarrinhoDeCompras();
  
  carrinho.adicionarItem("ProdutoA", 2);
  carrinho.adicionarItem("ProdutoB", 1);
  carrinho.adicionarItem("ProdutoC", 3);
  
  print("Total do carrinho: R\$ ${carrinho.calcularTotal().toStringAsFixed(2)}");
  
  carrinho.removerItem("ProdutoB");
  
  print("Total do carrinho: R\$ ${carrinho.calcularTotal().toStringAsFixed(2)}");
}
//OI