import 'package:flutter/material.dart';
import 'package:aluno/aluno.dart'; // Importe seu modelo Aluno aqui
import 'package:aluno/notas.dart'; // Esta será a tela para inserir as notas

void main() => runApp(MaterialApp(home: EntradaAlunoScreen()));

class EntradaAlunoScreen extends StatefulWidget {
  @override
  _EntradaAlunoScreenState createState() => _EntradaAlunoScreenState();
}

class _EntradaAlunoScreenState extends State<EntradaAlunoScreen> {
  final TextEditingController _nomeController = TextEditingController();
  String _disciplinaSelecionada = 'Matemática';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entrada do Aluno')),
      body: Column(
        children: [
          TextField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: 'Nome do Aluno'),
          ),
          DropdownButton<String>(
            value: _disciplinaSelecionada,
            items: <String>['Matemática', 'Português', 'Ciências', 'História']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _disciplinaSelecionada = newValue!;
              });
            },
          ),
          ElevatedButton(
            child: Text('Inserir Notas'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DisciplinaScreen(aluno: Aluno(_nomeController.text), disciplina: _disciplinaSelecionada)),
              );
            },
          ),
        ],
      ),
    );
  }
}
