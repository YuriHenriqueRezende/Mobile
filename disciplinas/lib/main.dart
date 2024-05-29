import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Disciplinas do Curso de ADS',
      home: DisciplineListScreen(),
    );
  }
}

class DisciplineListScreen extends StatelessWidget {
  final List<String> disciplines = [
    'Inteligencia Artificial e Big Data',
    'Internet Das Coisas',
    'Desenvolvimento Mobile',
    'Desenvolvimento Web',
    'Integração Vertical e Horizontal',
    'Banco de Dados II',
    'Atividades de Extenção',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Disciplinas do Curso de ADS'),
      ),
      body: ListView.builder(
        itemCount: disciplines.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(disciplines[index]),
              subtitle: Text('Professor: Professor ${index + 1}'),
              leading: Icon(Icons.book),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}
