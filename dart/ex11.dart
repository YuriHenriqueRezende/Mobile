import 'dart:io';

void main() {
  Map<String, dynamic> informacoesUsuario = obterInformacoesUsuario();
  
  print("\nInformações do usuário:");
  print("Nome: ${informacoesUsuario['nome']}");
  print("Curso: ${informacoesUsuario['curso']}");
  print("Idade: ${informacoesUsuario['idade']}");
}

Map<String, dynamic> obterInformacoesUsuario() {
  print("Digite seu nome:");
  String nome = stdin.readLineSync()!;

  print("Digite seu curso:");
  String curso = stdin.readLineSync()!;

  print("Digite sua idade:");
  int idade = int.parse(stdin.readLineSync()!);

  return {
    'nome': nome,
    'curso': curso,
    'idade': idade,
  };
}
