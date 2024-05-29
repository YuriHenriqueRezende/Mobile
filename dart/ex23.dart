class Produtos {
  String nome;
  int quantidade;
  double preco;
  String tipoComunicacao;
  double consumoEnergia;

  Produtos(this.nome, this.quantidade, this.preco, this.tipoComunicacao, this.consumoEnergia);

  void ligar() {
    print("$nome está ligado.");
  }

  void desligar() {
    print("$nome está desligado.");
  }
}

class Fritadeira extends Produtos {
  Fritadeira(String nome, int quantidade, double preco, String tipoComunicacao, double consumoEnergia)
      : super(nome, quantidade, preco, tipoComunicacao, consumoEnergia);

  void ajusteTemperatura(int setpoint) {
    print("$nome - Temperatura ajustada para $setpoint graus Celsius.");
  }
}

class Televisao extends Produtos {
  Televisao(String nome, int quantidade, double preco, String tipoComunicacao, double consumoEnergia)
      : super(nome, quantidade, preco, tipoComunicacao, consumoEnergia);

  void ajusteTemperatura(int setpoint) {
    print("$nome - Brilho ajustado para $setpoint.");
  }
}

class ArCondicionado extends Produtos {
  ArCondicionado(String nome, int quantidade, double preco, String tipoComunicacao, double consumoEnergia)
      : super(nome, quantidade, preco, tipoComunicacao, consumoEnergia);

  void ajusteTemperatura(int setpoint) {
    print("$nome - Temperatura ajustada para $setpoint graus Celsius.");
  }
}

void main() {
  var fritadeira = Fritadeira("Fritadeira sem Óleo", 1, 199.99, "Bluetooth", 1500.0);
  var televisao = Televisao("Smart TV", 2, 799.99, "Wi-Fi", 120.0);
  var arCondicionado = ArCondicionado("Ar-Condicionado Split", 1, 1299.99, "Controle Remoto", 1800.0);

  fritadeira.ligar();
  fritadeira.ajusteTemperatura(180);

  televisao.ligar();
  televisao.ajusteTemperatura(75);

  arCondicionado.ligar();
  arCondicionado.ajusteTemperatura(22);

  fritadeira.desligar();
  televisao.desligar();
  arCondicionado.desligar();
}
