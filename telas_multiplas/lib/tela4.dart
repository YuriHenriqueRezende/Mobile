import 'package:app_aula03_telas_multiplas/tela5.dart';
import 'package:flutter/material.dart';

class telacontador extends StatefulWidget {
  const telacontador({super.key});

  @override
  State<telacontador> createState() => telacontadorState();
}
int cont =0;
class telacontadorState extends State<telacontador> {
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(color:  Colors.blueAccent,width: 100,height: 100,
            child: Text("Contagem "+ " $cont",style: TextStyle(fontSize: 20),),),
          ),
          ElevatedButton(onPressed: (){
            // Set state atualiza o valor da variavel com base no estado
            setState(() {
              cont++;
              
            });
          }, child: Icon(Icons.add)),
          ElevatedButton(onPressed: (){
            setState(() {
              cont =0;
            });
          }, child: Icon(Icons.lock_reset_sharp)),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>campotexto()));

          }, child: Text("Tela 5")), // Adiciona icone no botão
        ],
      ),
    );
  }
}