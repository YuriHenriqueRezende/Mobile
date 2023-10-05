class Automovel {
  // Atributos da classe mãe
  String cor;
  String modelo;
  String tipoCombustivel;
  int quantidadeRodas;

  // Construtor da classe mãe
  Automovel(this.cor, this.modelo, this.tipoCombustivel, this.quantidadeRodas);

  // Métodos da classe mãe
  void ligarCarro() {
    print("O carro está ligado.");
  }

  void desligarCarro() {
    print("O carro está desligado.");
  }

  void abrirVidro() {
    print("O vidro está aberto.");
  }

  void descerVidro() {
    print("O vidro está fechado.");
  }
}

void main() {
  Automovel c = Automovel("Prata", "Gol", "Etanol", 4);

  c.ligarCarro();
  c.abrirVidro();
  c.descerVidro();
}
