import 'package:flutter/material.dart';



class ShoppingListScreen extends StatelessWidget {
  final List<String> items = ['Maçãs', 'Bananas', 'Pão', 'Leite'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Compras')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
