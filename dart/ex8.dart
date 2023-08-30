import 'dart:io';

void main() {
  print("Digite um número para calcular sua tabuada:");
  int numero = int.parse(stdin.readLineSync()!);

  print("\nTabuada de $numero:");
  for (int i = 1; i <= 10; i++) {
    int resultado = numero * i;
    print("$numero x $i = $resultado");
  }
}
