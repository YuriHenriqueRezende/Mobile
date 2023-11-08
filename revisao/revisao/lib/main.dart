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
          Container(color: Colors.blue,width: 393,height: 250,
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
      ),
    );
  }
}