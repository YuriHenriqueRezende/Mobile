import 'dart:io';

void main() {
  print("Digite o valor em reais (R\$):"); //POR ALGUM MOTIVO DA PROBLEMA QUANDO EU COLOCO $ OU SEJA R$ //
  double valorEmReais = double.parse(stdin.readLineSync()!);

  print("\nEscolha a moeda para a conversão:");
  print("1 - Euro");
  print("2 - Dólar");
  print("3 - Francos Suíços");
  
  int escolhaMoeda = int.parse(stdin.readLineSync()!);

  double valorConvertido = 0;

  switch (escolhaMoeda) {
    case 1:
      valorConvertido = valorEmReais * 0.21; // 1 Euro = 5 reais (cotação fictícia)
      break;
    case 2:
      valorConvertido = valorEmReais * 0.18; // 1 Dólar = 5.5 reais (cotação fictícia)
      break;
    case 3:
      valorConvertido = valorEmReais * 0.20; // 1 Franco Suíço = 5 reais (cotação fictícia)
      break;
    default:
      print("Opção inválida.");
      return;
  }

  print("\nValor convertido: $valorConvertido");
}
