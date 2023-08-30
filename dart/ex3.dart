import 'dart:io';

void main() {
  print("Digite a idade da primeira pessoa:");
  int idade1 = int.parse(stdin.readLineSync()!);

  print("Digite a idade da segunda pessoa:");
  int idade2 = int.parse(stdin.readLineSync()!);

  if (idade1 > idade2) {
    print("A primeira pessoa é mais velha.");
  } else if (idade2 > idade1) {
    print("A segunda pessoa é mais velha.");
  } else {
    print("As duas pessoas têm a mesma idade.");
  }
}
