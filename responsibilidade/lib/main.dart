import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Tela1(),
  ));
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Responsivo"),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            color: Colors.red,
          )),
          Expanded(child: Container(
            color: Colors.green,
          )),
          Expanded(child: Container(
            color: Colors.blue,
          )),
          Expanded(child: Container(
            color: Colors.white,
          )),
        ],
      ),
    );
  }
}
