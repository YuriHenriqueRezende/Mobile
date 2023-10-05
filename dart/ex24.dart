class ComponentesEletronicos {
  String nome;
  String valor;
  int quantidade;

  ComponentesEletronicos(this.nome, this.valor, this.quantidade);

  void exibirInformacoes() {
    print("Nome do componente: $nome");
    print("Valor: $valor");
    print("Quantidade: $quantidade");
  }

  double calcularValorTotal() {
    return double.parse(valor) * quantidade;
  }
}

class Resistor extends ComponentesEletronicos {
  Resistor(String nome, String valor, int quantidade)
      : super(nome, valor, quantidade);
}

class Capacitor extends ComponentesEletronicos {
  Capacitor(String nome, String valor, int quantidade)
      : super(nome, valor, quantidade);
}

class Indutor extends ComponentesEletronicos {
  Indutor(String nome, String valor, int quantidade)
      : super(nome, valor, quantidade);
}

class Diodo extends ComponentesEletronicos {
  Diodo(String nome, String valor, int quantidade)
      : super(nome, valor, quantidade);
}

class Led extends ComponentesEletronicos {
  Led(String nome, String valor, int quantidade)
      : super(nome, valor, quantidade);
}

void main() {
  var capacitor1 = Capacitor("Capacitor 1", "100uF", 5);

  capacitor1.exibirInformacoes();
  print("Valor Total do Capacitor 1: ${capacitor1.calcularValorTotal()}");
}
