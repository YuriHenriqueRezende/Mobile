import 'package:flutter/material.dart';
import 'package:sm_consultoria/service.dart';

class ProjectScreen extends StatelessWidget {
  final Service projectService = Service('Projeto', 5000, 'assets/project_image.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Projeto')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              projectService.imageUrl,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              projectService.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Valor: R\$ ${projectService.value.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
