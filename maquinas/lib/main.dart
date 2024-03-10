import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Machine {
  final String name;
  final double usageTime; 
  final double powerConsumption; 

  Machine(this.name, this.usageTime, this.powerConsumption);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Consumption Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MachineListScreen(),
    );
  }
}

class MachineListScreen extends StatefulWidget {
  @override
  _MachineListScreenState createState() => _MachineListScreenState();
}

class _MachineListScreenState extends State<MachineListScreen> {
  final List<Machine> machines = [
    Machine('Torno', 2, 1000),
    Machine('Fresa', 1.5, 800),
    Machine('Furadeira', 1, 500),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Máquinas'),
      ),
      body: ListView.builder(
        itemCount: machines.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(machines[index].name),
            subtitle: Text(
                'Tempo de utilização: ${machines[index].usageTime} horas\nConsumo: ${machines[index].powerConsumption} watts'),
            trailing: Text(
                'Consumo total: ${_calculateTotalConsumption(machines[index]).toStringAsFixed(2)} kWh'),
          );
        },
      ),
    );
  }

  double _calculateTotalConsumption(Machine machine) {
    return (machine.usageTime * machine.powerConsumption) / 1000;
  }
}
