import 'package:flutter/material.dart';
import 'package:ohm/calculation_selection_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalculationSelectionScreen()),
            );
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
