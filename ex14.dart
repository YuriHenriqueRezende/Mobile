import 'dart:io';

void main() {
  double saldo = 1000.0;

  while (true) {
    print("\nMenu de Transações Bancárias:");
    print("1 - Saque");
    print("2 - PIX");
    print("3 - Empréstimos");
    print("4 - Transferências");
    print("5 - Sair");

    int opcao = int.parse(stdin.readLineSync()!);

    if (opcao == 5) {
      print("Encerrando o programa...");
      break;
    }

    switch (opcao) {
      case 1:
        realizarSaque(saldo);
        break;
      case 2:
        realizarPix(saldo);
        break;
      case 3:
        realizarEmprestimo(saldo);
        break;
      case 4:
        realizarTransferencia(saldo);
        break;
      default:
        print("Opção inválida.");
    }
  }
}

void realizarSaque(double saldo) {
  print("Digite o valor do saque:");
  double valor = double.parse(stdin.readLineSync()!);

  if (valor > saldo) {
    print("Saldo insuficiente.");
  } else {
    saldo -= valor;
    print("Saque realizado com sucesso. Saldo restante: $saldo");
  }
}

void realizarPix(double saldo) {
  print("Digite o valor do PIX:");
  double valor = double.parse(stdin.readLineSync()!);

  if (valor > saldo) {
    print("Saldo insuficiente.");
  } else {
    saldo -= valor;
    print("PIX realizado com sucesso. Saldo restante: $saldo");
  }
}

void realizarEmprestimo(double saldo) {
  print("Digite o valor do empréstimo:");
  double valor = double.parse(stdin.readLineSync()!);

  saldo += valor;
  print("Empréstimo realizado com sucesso. Saldo atual: $saldo");
}

void realizarTransferencia(double saldo) {
  print("Digite o valor da transferência:");
  double valor = double.parse(stdin.readLineSync()!);

  if (valor > saldo) {
    print("Saldo insuficiente.");
  } else {
    saldo -= valor;
    print("Transferência realizada com sucesso. Saldo restante: $saldo");
  }
}
