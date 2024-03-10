import 'package:flutter/material.dart';
import 'aluno.dart'; // Garanta que você tem o modelo Aluno

class DisciplinaScreen extends StatefulWidget {
  final Aluno aluno;
  final String disciplina;

  DisciplinaScreen({required this.aluno, required this.disciplina});

  @override
  _DisciplinaScreenState createState() => _DisciplinaScreenState();
}

class _DisciplinaScreenState extends State<DisciplinaScreen> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();

  void _calcularMedia() {
    final double nota1 = double.parse(_nota1Controller.text);
    final double nota2 = double.parse(_nota2Controller.text);
    final double nota3 = double.parse(_nota3Controller.text);
    final double media = (nota1 + nota2 + nota3) / 3;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Text("${widget.aluno.nome} foi ${media >= 7 ? "aprovado" : "reprovado"} em ${widget.disciplina} com média $media"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notas de ${widget.disciplina}')),
      body: Column(
        children: [
          TextField(
            controller: _nota1Controller,
            decoration: InputDecoration(labelText: 'Nota 1'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _nota2Controller,
            decoration: InputDecoration(labelText: 'Nota 2'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _nota3Controller,
            decoration: InputDecoration(labelText: 'Nota 3'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            child: Text('Calcular Média'),
            onPressed: _calcularMedia,
          ),
        ],
      ),
    );
  }
}
