import 'dart:io';

void main() {
  List<double> temperaturas = [];

  for (int i = 1; i <= 20; i++) {
    print("Digite a temperatura $i:");
    double temperatura = double.parse(stdin.readLineSync()!);
    temperaturas.add(temperatura);
  }

  double somaTemperaturas = 0;
  double maiorTemperatura = temperaturas[0];
  double menorTemperatura = temperaturas[0];

  for (double temperatura in temperaturas) {
    somaTemperaturas += temperatura;

    if (temperatura > maiorTemperatura) {
      maiorTemperatura = temperatura;
    }

    if (temperatura < menorTemperatura) {
      menorTemperatura = temperatura;
    }
  }

  double media = somaTemperaturas / temperaturas.length;

  print("\nMédia das temperaturas: $media");
  print("Maior temperatura: $maiorTemperatura");
  print("Menor temperatura: $menorTemperatura");
}
