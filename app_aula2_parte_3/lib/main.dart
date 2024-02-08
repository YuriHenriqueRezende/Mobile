import 'package:flutter/material.dart';

void main() {
  runApp(Campotexto());
}

class Campotexto extends StatefulWidget {
  const Campotexto({super.key});

  @override
  State<Campotexto> createState() => _CampotextoState();
}

class _CampotextoState extends State<Campotexto> {
  // variavel para armazenar o que é digitado no campo texto
  TextEditingController campo_nome = TextEditingController(); 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App caixa texto"),
        ),
        body: Column(
          children: [
            // Campo que permite a entrada de texto no aplicativo
            TextField(
             // tipo de teclado
             keyboardType: TextInputType.name, // seleciona o tipo de entrada do campo texto
             decoration: InputDecoration(
              labelText:"Digite seu email"),
              // on changed parametro que permite detectar toda mudança no campo texto
              /*onChanged: (String texto){
                print(texto);
              }*/ 
              // Nao exibe no terminal o texto enquanto eu digito, só aparece depois que eu aperto enter
              /*onSubmitted: (String texto){
                print(texto);
              },*/
              controller: campo_nome, // variavel que armazena o que é digitado no campo  texto
            ),
            ElevatedButton(onPressed: (){              
              setState(() {
                print("${campo_nome.text}");
              });
             
            }, child: Text("Verificar")),
            Container(
              color: Colors.blue,
              height: 200,
              width: 200,
              child: Text("${campo_nome.text}"),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                campo_nome.text ="";
              });
            }, child: Text("Limpar")),
                     ],
        ),
      ),
    );
  }
}