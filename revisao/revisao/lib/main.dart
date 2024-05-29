import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Lista de componentes Compra"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Componente(),
        ]
      ),
    );
  }
}

class Componente extends StatefulWidget {
  const Componente({super.key});

  @override
  State<Componente> createState() => _Componente();
}

class _Componente extends State<Componente> {
  int cont = 0;
  void _increment_counter(){
    setState(() {
          cont++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(color: Colors.blue,width: 393,height: 250, child: Image.asset('imagens/r.jpg', fit: BoxFit.fill),
              ),
              Text("Componente",style: TextStyle(fontSize: 30),),
            Container(color: Colors.red,width: 200,height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  print("Botao precionado");
                  }, child: Text("Mensagem")),
                ElevatedButton(onPressed: (){
                  print("Contagem + 1");
                }, child: Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}