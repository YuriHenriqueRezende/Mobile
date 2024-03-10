import 'package:flutter/material.dart';
import 'package:sm_consultoria/service.dart';

class ReportScreen extends StatelessWidget {
  final Service reportService = Service('Elaboração de Laudo', 2000, 'assets/report_image.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Elaboração de Laudo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              reportService.imageUrl,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              reportService.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Valor: R\$ ${reportService.value.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
