import 'package:flutter/material.dart';
import 'package:boas_vindas/ShoppingListScreen.dart';



void main() {
  runApp(MaterialApp(
    home: WelcomeScreen(),
  ));
}


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem-vindo')),
      body: Center(
        child: ElevatedButton(
          child: Text('Ver Lista de Compras'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingListScreen()),
            );
          },
        ),
      ),
    );
  }
}
