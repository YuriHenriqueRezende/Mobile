import 'package:flutter/material.dart';
import 'package:sm_consultoria/service.dart';

class ConsultancyScreen extends StatelessWidget {
  final Service consultancyService = Service('Consultoria', 3000, 'assets/consultancy_image.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultoria')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              consultancyService.imageUrl,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              consultancyService.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Valor: R\$ ${consultancyService.value.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
