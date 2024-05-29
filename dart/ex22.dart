class Maquinas {
  String nome;
  int quantidadeEixos;
  int rotacoesPorMinuto;
  double consumoDeEnergia;

  Maquinas(this.nome, this.quantidadeEixos, this.rotacoesPorMinuto, this.consumoDeEnergia);

  void ligar() {
    print("$nome está ligada.");
  }

  void desligar() {
    print("$nome está desligada.");
  }

  void ajustarVelocidade(int novaVelocidade) {
    if (novaVelocidade >= 0) {
      rotacoesPorMinuto = novaVelocidade;
      print("$nome teve a velocidade ajustada para $rotacoesPorMinuto RPM.");
    } else {
      print("A velocidade deve ser um valor não negativo.");
    }
  }
}

class Furadeira extends Maquinas {
  Furadeira(String nome, int rotacoesPorMinuto, double consumoDeEnergia)
      : super(nome, 1, rotacoesPorMinuto, consumoDeEnergia);

  void furar() {
    print("$nome está furando.");
  }
}

void main() {
  var furadeira = Furadeira("Furadeira de Bancada", 1500, 5.0);

  furadeira.ligar();
  furadeira.ajustarVelocidade(2000);
  furadeira.furar();
  furadeira.desligar();
}
