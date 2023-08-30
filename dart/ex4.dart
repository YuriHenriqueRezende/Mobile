import 'dart:io';

void main() {
  print("Digite o valor médio do primeiro modelo de carro:");
  double valor1 = double.parse(stdin.readLineSync()!);

  print("Digite o valor médio do segundo modelo de carro:");
  double valor2 = double.parse(stdin.readLineSync()!);

  print("Digite o valor médio do terceiro modelo de carro:");
  double valor3 = double.parse(stdin.readLineSync()!);

  double maiorValor = valor1;
  double menorValor = valor1;

  if (valor2 > maiorValor) {
    maiorValor = valor2;
  } else if (valor2 < menorValor) {
    menorValor = valor2;
  }

  if (valor3 > maiorValor) {
    maiorValor = valor3;
  } else if (valor3 < menorValor) {
    menorValor = valor3;
  }

  print("\nO carro mais caro tem o valor médio de: $maiorValor");
  print("O carro mais barato tem o valor médio de: $menorValor");
}
