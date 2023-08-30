import 'dart:io';

void main() {
  List<double> notas = [];

  for (int i = 1; i <= 10; i++) {
    print("Digite a nota do aluno $i:");
    double nota = double.parse(stdin.readLineSync()!);
    notas.add(nota);
  }

  double somaNotas = 0;

  for (double nota in notas) {
    somaNotas += nota;
  }

  double media = somaNotas / notas.length;

  print("\nMédia das notas: $media");
}
