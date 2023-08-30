import 'dart:io';

void main() {
  double base = double.parse(stdin.readLineSync()!);
  double altura = double.parse(stdin.readLineSync()!);

  double area = calcularAreaTriangulo(base, altura);

  print("A área do triângulo é: $area");
}

double calcularAreaTriangulo(double base, double altura) {
  double area = (base * altura) / 2;
  return area;
}
