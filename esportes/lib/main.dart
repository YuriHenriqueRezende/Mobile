import 'package:flutter/material.dart';
import 'package:esportes/basketball_screen.dart';
import 'package:esportes/SoccerScreen.dart';
import 'package:esportes/NFLScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Esportes App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Basquete'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasketballScreen()),
              ),
            ),
            ElevatedButton(
              child: Text('Futebol'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoccerScreen()),
              ),
            ),
            ElevatedButton(
              child: Text('NFL'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NFLScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}