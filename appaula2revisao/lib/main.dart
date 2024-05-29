import 'package:flutter/material.dart'; // permite utilizar
// os widgets para android

// função principal do aplicativo
void main() {
  runApp(Home());
}
// Cria classe home do tipo Stateless
class Home extends StatelessWidget {
  const Home({super.key}); // construtor
 // override permite a reescrita de funções na classe Home
  @override
  // Widget build cria a tela do app
  Widget build(BuildContext context) {
           // Material APP necessário para criar os widgets
    return MaterialApp(
      // Scaffold layout semi pronto do aplicativo
      home: Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo aula 02"),
      ),
      body: Center(
        child: Column(
          // configurar alinhamento principal do app
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            Container(
            color: Colors.blue,
            height: 100,
            width: 100,
            ),
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
            ElevatedButton(onPressed: (){
              print("Botão pressionado");
            }, 
            child: Text("Mensagem")),
            ],
          ),
        ),
      ),
    );
  }
}
