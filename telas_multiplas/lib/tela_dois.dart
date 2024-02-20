import 'package:flutter/material.dart'; // pacote de widgets para o android

class telasecundaria extends StatelessWidget {
  const telasecundaria({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
      body: Column(
        children: [
          Container(color: Colors.deepOrangeAccent,width: 400,height: 100,),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Tela 1"))
        ],
      ),
    );
  }
  
  
  }