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
        Container(color: Colors.green,width: 400,height: 180,),
        ElevatedButton(onPressed: (){
        Navigator.pop(context);

        }, child: Text("Tela login")),
      ],
     ),

    );
  }
}