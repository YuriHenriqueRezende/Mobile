import 'package:flutter/material.dart';
import 'package:empresa_sm_denovo/industria_screen.dart';
import 'package:empresa_sm_denovo/agricultura_screen.dart';
import 'package:empresa_sm_denovo/saude_screen.dart';
import 'package:empresa_sm_denovo/economia_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Mobile App',
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

  final List<Widget> _widgetOptions = <Widget>[
    IndustriaScreen(),
    AgriculturaScreen(),
    SaudeScreen(),
    EconomiaScreen(),
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
        title: Text('SM Mobile App'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Indústria',
             backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture),
            label: 'Agricultura',
             backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Saúde',
             backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Economia',
             backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
