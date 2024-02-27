import 'package:empresa_sm_mobile/tela2.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: Telaprincipal()
  ));
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("sm_mobile"),
      ),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Container(color: Colors.green,width: 400,height: 180,
          child: Text("A matemática e como uma partitura, o importante não e saber ler musica, o importante e saber ouvi-la",style: TextStyle(fontSize:25 ),textAlign: TextAlign.center,),),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Telasecundaria(),));
          }, child: Text("Tela 2")),
        ],
      ),
    );
  }
}