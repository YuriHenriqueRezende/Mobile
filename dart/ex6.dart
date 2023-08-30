import 'dart:io';

void main() {
  const double precoEtanol = 1.70;
  const double precoDiesel = 2.00;
  const double precoGasolina = 4.50;

  print("Digite a quantidade de litros vendidos:");
  double quantidadeLitros = double.parse(stdin.readLineSync()!);

  print("Digite o tipo de combustível (E para etanol, D para diesel, G para gasolina):");
  String tipoCombustivel = stdin.readLineSync()!.toUpperCase();

  double desconto = 0;
  double precoLiquido = 0;

  if (tipoCombustivel == 'E') {
    if (quantidadeLitros >= 15) {
      desconto = quantidadeLitros * 0.04 * precoEtanol;
    } else {
      desconto = quantidadeLitros * 0.03 * precoEtanol;
    }
    precoLiquido = (quantidadeLitros * precoEtanol) - desconto;
  } else if (tipoCombustivel == 'D') {
    if (quantidadeLitros >= 15) {
      desconto = quantidadeLitros * 0.05 * precoDiesel;
    } else {
      desconto = quantidadeLitros * 0.03 * precoDiesel;
    }
    precoLiquido = (quantidadeLitros * precoDiesel) - desconto;
  } else if (tipoCombustivel == 'G') {
    if (quantidadeLitros >= 20) {
      desconto = quantidadeLitros * 0.03 * precoGasolina;
    }
    precoLiquido = (quantidadeLitros * precoGasolina) - desconto;
  } else {
    print("Tipo de combustível inválido.");
    return;
  }

  print("\nValor a ser pago pelo cliente: R\$ ${precoLiquido.toStringAsFixed(2)}");
}
