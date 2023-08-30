import 'dart:io';

void main() {
  print("Digite seu nome:");
  String nome = stdin.readLineSync()!;

  print("Digite sua idade:");
  int idade = int.parse(stdin.readLineSync()!);

  print("Digite seu curso:");
  String curso = stdin.readLineSync()!;

  print("\nInformações digitadas:");
  print("Nome: $nome");
  print("Idade: $idade");
  print("Curso: $curso");
}
