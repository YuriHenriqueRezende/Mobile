import 'package:flutter/material.dart';
import 'package:ohm/triangle_area_screen.dart';
import 'package:ohm/trapezoid_area_screen.dart';
import 'package:ohm/ohms_law_screen.dart';

class CalculationSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selecione o Cálculo')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Área do Triângulo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TriangleAreaScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Área do Trapézio'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrapezoidAreaScreen()),
              );
            },
          ),
          ListTile(
            title: Text('1ª Lei de Ohm'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OhmsLawScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
