import 'package:flutter/material.dart';

void main() {
  runApp(App_aula14());
}

class App_aula14 extends StatefulWidget {

  const App_aula14({super.key});

  @override

  State<App_aula14> createState() => _App_aula14State();
}

class _App_aula14State extends State<App_aula14> {
  String _msg = "TIMES";
  @override 
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SÃO PAULO O MELHOR TIME DE TODOS"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: 500,
              height: 200, 
              child: Text(
                _msg,
                style: TextStyle(fontSize: 28),
                textAlign:
                    TextAlign.center,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ElevatedButton(
                onPressed: () {
                  print("Botão pressionado");
                  setState(() {
                    _msg = "PALMEIRAS"; 
                  });
                },
                child: Text("TIME 1")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _msg = "SAO PAULO";
                  });
                },
                child: Text("TIME 2")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _msg = "CURINTIA";
                  });
                },
                child: Text("TIME 3"))
            ],)
          ],
        ),
      ),
    );
  }
}