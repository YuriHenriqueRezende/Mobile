import 'dart:io';

void main() {
  print("Digite a quantidade de KWh consumida:");
  double quantidadeKWh = double.parse(stdin.readLineSync()!);

  print("Digite o tipo de instalação (R para residência, I para indústria, C para comércio):");
  String tipoInstalacao = stdin.readLineSync()!.toUpperCase();

  double precoTotal = 0;

  switch (tipoInstalacao) {
    case 'R':
      if (quantidadeKWh <= 500) {
        precoTotal = quantidadeKWh * 0.50;
      } else {
        precoTotal = quantidadeKWh * 0.70;
      }
      break;
    case 'I':
      if (quantidadeKWh <= 1000) {
        precoTotal = quantidadeKWh * 0.65;
      } else {
        precoTotal = quantidadeKWh * 0.60;
      }
      break;
    case 'C':
      if (quantidadeKWh <= 5000) {
        precoTotal = quantidadeKWh * 0.55;
      } else {
        precoTotal = quantidadeKWh * 0.50;
      }
      break;
    default:
      print("Tipo de instalação inválido.");
      return;
  }

  print("\nPreço a pagar pelo fornecimento de energia: R\$ ${precoTotal.toStringAsFixed(2)}");
}
