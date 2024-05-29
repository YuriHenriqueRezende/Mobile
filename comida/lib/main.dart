import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Comida {
  final String nome;
  final double valor;

  Comida(this.nome, this.valor);
}

class MyApp extends StatelessWidget {
  final List<Comida> comidas = [
    Comida('Pizza', 20.0),
    Comida('Hambúrguer', 15.0),
    Comida('Batata Frita', 10.0),
    Comida('Salada', 12.0),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Comidas'),
        ),
        body: ComidasList(comidas: comidas),
      ),
    );
  }
}

class ComidasList extends StatelessWidget {
  final List<Comida> comidas;

  ComidasList({required this.comidas});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: comidas.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(comidas[index].nome),
                subtitle: Text('\$${comidas[index].valor.toStringAsFixed(2)}'),
              );
            },
          ),
        ),
        Divider(),
        Text(
          'Total: \$${_calcularTotal(comidas).toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  double _calcularTotal(List<Comida> comidas) {
    double total = 0.0;
    for (var comida in comidas) {
      total += comida.valor;
    }
    return total;
  }
}
