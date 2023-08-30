import 'dart:io';

void main() {
  print("Digite o primeiro valor:");
  double valor1 = double.parse(stdin.readLineSync()!);

  print("Digite o segundo valor:");
  double valor2 = double.parse(stdin.readLineSync()!);

  print("Escolha a operação (+ para soma, - para subtração, * para multiplicação, / para divisão):");
  String operacao = stdin.readLineSync()!;

  double resultado = 0;

  switch (operacao) {
    case '+':
      resultado = valor1 + valor2;
      break;
    case '-':
      resultado = valor1 - valor2;
      break;
    case '*':
      resultado = valor1 * valor2;
      break;
    case '/':
      if (valor2 != 0) {
        resultado = valor1 / valor2;
      } else {
        print("Não é possível dividir por zero.");
        return;
      }
      break;
    default:
      print("Operação inválida.");
      return;
  }

  print("Resultado: $resultado");
}
