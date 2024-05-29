import 'dart:io';

class Cliente {
  String nome;
  String profissao;
  double saldo;

  Cliente(this.nome, this.profissao, this.saldo);

  void pix(double valor) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      print("Pix de $valor realizado com sucesso.");
    } else {
      print("Saldo insuficiente para realizar o Pix.");
    }
  }

  void emprestimo(double valor) {
    if (valor > 0) {
      saldo += valor;
      print("Empréstimo de $valor realizado com sucesso.");
    } else {
      print("Valor inválido para o empréstimo.");
    }
  }

  void saque(double valor) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      print("Saque de $valor realizado com sucesso.");
    } else {
      print("Saldo insuficiente para realizar o saque.");
    }
  }

  void extrato() {
    print("Nome: $nome");
    print("Profissão: $profissao");
    print("Saldo: $saldo");
  }
}

void main() {
  print("Digite o nome do cliente:");
  String nome = stdin.readLineSync()!;
  
  print("Digite a profissão do cliente:");
  String profissao = stdin.readLineSync()!;
  
  print("Digite o saldo do cliente:");
  double saldo = double.parse(stdin.readLineSync()!);
  
  Cliente cliente = Cliente(nome, profissao, saldo);

  while (true) {
    print("\nEscolha uma opção:");
    print("1 - Pix");
    print("2 - Empréstimo");
    print("3 - Saque");
    print("4 - Extrato");
    print("5 - Sair");
    
    int opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        print("Digite o valor para o Pix:");
        double valorPix = double.parse(stdin.readLineSync()!);
        cliente.pix(valorPix);
        break;
      case 2:
        print("Digite o valor para o empréstimo:");
        double valorEmprestimo = double.parse(stdin.readLineSync()!);
        cliente.emprestimo(valorEmprestimo);
        break;
      case 3:
        print("Digite o valor para o saque:");
        double valorSaque = double.parse(stdin.readLineSync()!);
        cliente.saque(valorSaque);
        break;
      case 4:
        cliente.extrato();
        break;
      case 5:
        exit(0);
      default:
        print("Opção inválida.");
        break;
    }
  }
}
