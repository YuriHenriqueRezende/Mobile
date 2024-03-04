import 'package:flutter/material.dart';
import 'package:empresa_sm_mobile/tela5.dart';


class Telao extends StatelessWidget {
  const Telao({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Tela 4"),
      ),
     body: Column(
      children: [
        Container(color: Colors.red,width: 400,height: 180,
        child: Text("palmeiras peida contra o são paulo kkkkkkkkk",style: TextStyle(fontSize:25 ),textAlign: TextAlign.center,),),
        ElevatedButton(onPressed: (){
        Navigator.pop(context);

        }, child: Text("Tela 3")),
        ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Tel()));
        }, child: Text("Tela 5"))
      ],
     ),

    );
  }
}