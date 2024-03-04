import 'package:flutter/material.dart';

class Tel extends StatelessWidget {
  const Tel({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Tela 5"),
      ),
     body: Column(
      children: [
        Container(color: const Color.fromARGB(255, 136, 84, 84),width: 400,height: 180,
        child: Text("são paulo",style: TextStyle(fontSize:25 ),textAlign: TextAlign.center,),),
      ],
     ),
    );
  }
}