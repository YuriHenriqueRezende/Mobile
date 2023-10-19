// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplicativo Tarefas'),
        ),
        body: const Column(
          children: [
            Task("Aprender Flutter"),
            Task(" Jogar video game"),
            Task("Estudar"),
            Task("Jogar futebol"),
          ],
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String tarefa;
  const Task(this.tarefa, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 140),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.grey, height: 100, width: 80, child: Image.network('https://images.tcdn.com.br/img/img_prod/240061/django_16_1_20190227092231.png',
                fit: BoxFit.fill,),),
                Text(
                  tarefa,
                  style: const TextStyle(fontSize: 22),
                ),
                ElevatedButton(
                    onPressed: () {
                      print("Botão pressionado");
                    },
                    child: const Icon(Icons.arrow_drop_up)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}