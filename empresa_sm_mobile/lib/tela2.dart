import 'package:empresa_sm_mobile/tela3.dart';
import 'package:flutter/material.dart';

class Telasecundaria extends StatelessWidget {
  const Telasecundaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Tela 2"),
      ),
     body: Column(
      children: [
        Container(color: Colors.red,width: 400,height: 180,
        child: Text("Agora é sua vez de lidar com as conseguencias da sua realização.",style: TextStyle(fontSize:25 ),textAlign: TextAlign.center,),),
        ElevatedButton(onPressed: (){
        Navigator.pop(context);

        }, child: Text("Tela 1")),
        ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Telaop()));
        }, child: Text("Tela 3"))
      ],
     ),

    );
  }
}