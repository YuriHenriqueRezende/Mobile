import 'package:flutter/material.dart';

void main() {
  runApp(Telaprincipal());
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aplicativo Dinâmico"),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Contador(),
         ],
        ),
      ),
    );
  }
}


class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => ContadorState();
}

class ContadorState extends State<Contador> {
   int cont = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            color: Colors.blue,
            height: 150,
            width: 150,
             // Child estabelece relação entre o container e o texto
           child: Text("${cont}",
           style: TextStyle(fontSize: 30),textAlign: TextAlign.center),
          ),
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            cont++;
          });
        }, 
        child: Text("Contador")),
        ElevatedButton(onPressed: (){
          setState(() {
            cont =0;
          });
        }, child: Text("Zerar")),
      ],
    );
  }
}