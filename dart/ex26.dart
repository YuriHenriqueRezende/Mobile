abstract class MaquinaIndustrial {
  String nome;
  double potencia;
  bool status;

  MaquinaIndustrial(this.nome, this.potencia, this.status);

  void ligar();
  void desligar();
}

class Prensa extends MaquinaIndustrial {
  double pressaoEmToneladas;

  Prensa(String nome, double potencia, bool status, this.pressaoEmToneladas)
      : super(nome, potencia, status);

  @override
  void ligar() {
    status = true;
    print("$nome está ligada. Pressão: $pressaoEmToneladas toneladas.");
  }

  @override
  void desligar() {
    status = false;
    print("$nome está desligada.");
  }
}

class RoboSolda extends MaquinaIndustrial {
  String tipoDeSolda;

  RoboSolda(String nome, double potencia, bool status, this.tipoDeSolda)
      : super(nome, potencia, status);

  @override
  void ligar() {
    status = true;
    print("$nome está ligado. Tipo de Solda: $tipoDeSolda.");
  }

  @override
  void desligar() {
    status = false;
    print("$nome está desligado.");
  }
}

class Transportador extends MaquinaIndustrial {
  double velocidade;

  Transportador(String nome, double potencia, bool status, this.velocidade)
      : super(nome, potencia, status);

  @override
  void ligar() {
    status = true;
    print("$nome está ligado. Velocidade: $velocidade m/s.");
  }

  @override
  void desligar() {
    status = false;
    print("$nome está desligado.");
  }
}

class FornecedorDeEnergia {
  double energiaDisponivel;

  FornecedorDeEnergia(this.energiaDisponivel);

  void fornecerEnergia(MaquinaIndustrial maquina) {
    if (energiaDisponivel >= maquina.potencia) {
      maquina.ligar();
      energiaDisponivel -= maquina.potencia;
      print("Máquina ${maquina.nome} ligada com sucesso.");
    } else {
      print("Não há energia suficiente para ligar a máquina ${maquina.nome}.");
    }
  }
}

void main() {
  Prensa prensa = Prensa("Prensa Hidráulica", 1000.0, false, 50.0);
  RoboSolda roboSolda = RoboSolda("Robô de Solda", 500.0, false, "TIG");
  Transportador transportador = Transportador("Transportador de Esteira", 200.0, false, 2.5);

  List<MaquinaIndustrial> maquinas = [prensa, roboSolda, transportador];

  for (var maquina in maquinas) {
    print("Nome: ${maquina.nome}, Potência: ${maquina.potencia}, Status: ${maquina.status}");
  }

  FornecedorDeEnergia fornecedor = FornecedorDeEnergia(1000.0);
  fornecedor.fornecerEnergia(prensa);
  fornecedor.fornecerEnergia(roboSolda);
  fornecedor.fornecerEnergia(transportador);
}
