class Carro {
  String marca;
  String modelo;
  int ano;
  bool motorLigado = false;
  
  void ligarMotor() {
    motorLigado = true;
    print("Motor ligado.");
  }
  
  void desligarMotor() {
    motorLigado = false;
    print("Motor desligado.");
  }
  
  String statusMotor() {
    return motorLigado ? "Motor ligado." : "Motor desligado.";
  }
}

void main() {
  Carro meuCarro = Carro();
  meuCarro.marca = "Toyota";
  meuCarro.modelo = "Corolla";
  meuCarro.ano = 2022;
  
  print("Status do motor: ${meuCarro.statusMotor()}");
  
  meuCarro.ligarMotor();
  print("Status do motor: ${meuCarro.statusMotor()}");
  
  meuCarro.desligarMotor();
  print("Status do motor: ${meuCarro.statusMotor()}");
}
