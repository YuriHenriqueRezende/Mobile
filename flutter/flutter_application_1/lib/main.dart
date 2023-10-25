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
          title: Text('Aplicativo Tarefas'),
        ),
        body: Column(
          children: [
            Task("Aprender Flutter",
                "https://cdn-images-1.medium.com/v2/resize:fit:1024/0*vowtRZE_wvyVA7CB"),
            Task(" Jogar video game",
                "https://a-static.mlcdn.com.br/800x560/console-sony-playstation-5-825gb-marvels-spider-man-2-limited-edition/magazineluiza/237808200/7c0d5369fd416119d04202e4eb5513a0.jpg"),
            Task("Estudar",
                "https://img.imageboss.me/revista-cdn/cdn/6161/2264a8d4f17f8ee3f56155468163979b38eefbbf.jpg?1515696991"),
            Task("Jogar futebol",
                "https://conteudo.imguol.com.br/c/esporte/15/2022/12/18/messi-com-o-trofeu-da-copa-do-mundo-no-qatar-1671394673199_v2_900x506.jpg"),
          ],
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String tarefa;
  final String img;
  const Task(this.tarefa, this.img, {super.key});

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
                Container(
                  color: Colors.grey,
                  height: 100,
                  width: 80,
                  child: Image.network(
                    img,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  tarefa,
                  style: TextStyle(fontSize: 22),
                ),
                ElevatedButton(
                    onPressed: () {
                      print("Botão pressionado");
                    },
                    child: Icon(Icons.arrow_drop_up)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
