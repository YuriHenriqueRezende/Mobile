import 'package:flutter/material.dart';
import 'package:comida_denovo/japan_screen.dart';
import 'package:comida_denovo/italy_screen.dart';
import 'package:comida_denovo/mexico_screen.dart';
import 'package:comida_denovo/india_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comidas Típicas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    JapanScreen(),
    ItalyScreen(),
    MexicoScreen(),
    IndiaScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comidas Típicas'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Japão',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Itália',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'México',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Índia',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
