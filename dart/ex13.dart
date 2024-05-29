import 'dart:io';

void main() {
  double salario = double.parse(stdin.readLineSync()!);

  double salarioCalculado = calcularSalarioComDescontoEBonus(salario);

  print("O salário líquido é: $salarioCalculado");
}

double calcularSalarioComDescontoEBonus(double salario) {
  double descontoImpostos = salario * 0.10;

  double salarioLiquido = salario - descontoImpostos;

  return salarioLiquido;
}
