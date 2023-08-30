import 'dart:io';

void main() {
  print("Digite a nota do primeiro aluno:");
  double nota1Aluno1 = double.parse(stdin.readLineSync()!);

  print("Digite a nota do segundo aluno:");
  double nota2Aluno1 = double.parse(stdin.readLineSync()!);

  print("Digite a nota do primeiro aluno:");
  double nota1Aluno2 = double.parse(stdin.readLineSync()!);

  print("Digite a nota do segundo aluno:");
  double nota2Aluno2 = double.parse(stdin.readLineSync()!);

  double mediaAluno1 = (nota1Aluno1 + nota2Aluno1) / 2;
  double mediaAluno2 = (nota1Aluno2 + nota2Aluno2) / 2;

  print("\nMédia do primeiro aluno: $mediaAluno1");
  imprimirResultado(mediaAluno1);

  print("\nMédia do segundo aluno: $mediaAluno2");
  imprimirResultado(mediaAluno2);
}

void imprimirResultado(double media) {
  if (media >= 7) {
    print("Aprovado");
  } else if (media >= 4 && media < 7) {
    print("Exame");
  } else {
    print("Reprovado");
  }
}
