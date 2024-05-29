abstract class Automovel {
  String nome;
  String cor;
  int ano;

  Automovel(this.nome, this.cor, this.ano);

  void colocarCinto();
  void ligarCarro();
  void desligarCarro();
  void dirigir();
}

class Carro extends Automovel {
  Carro(String nome, String cor, int ano) : super(nome, cor, ano);

  @override
  void colocarCinto() {
    print("Colocando o cinto de segurança no $nome.");
  }

  @override
  void ligarCarro() {
    print("Ligando o $nome.");
  }

  @override
  void desligarCarro() {
    print("Desligando o $nome.");
  }

  @override
  void dirigir() {
    print("Dirigindo o $nome.");
  }
}

void main() {
  Carro meuCarro = Carro("Wolgsvagem Gol", "Prata", 2004);

  meuCarro.colocarCinto();
  meuCarro.ligarCarro();
  meuCarro.dirigir();
  meuCarro.desligarCarro();
}
