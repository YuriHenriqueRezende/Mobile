import 'package:flutter/material.dart';
import 'package:empresa_sm_mobile/tela4.dart';


class Telaop extends StatelessWidget {
  const Telaop({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Tela 3"),
      ),
     body: Column(
      children: [
        Container(color: Colors.red,width: 400,height: 180,
        child: Text("Seu alerta de vaga para campinas",style: TextStyle(fontSize:25 ),textAlign: TextAlign.center,),),
        ElevatedButton(onPressed: (){
        Navigator.pop(context);

        }, child: Text("Tela 2")),
        ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Telao()));
        }, child: Text("Tela 4"))
      ],
     ),

    );
  }
}