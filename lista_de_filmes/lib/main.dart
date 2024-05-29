import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senai Film',
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  final List<String> movies = [
    'Star Wars I',
    'Star Wars II',
    'Star Wars III',
    'Star Wars IV',
    'Star Wars V',
    'Star Wars VI',
    'Star Wars VII',
    'Star Wars VIII',
    'Star Wars IX',
    'star wars obi wan kenobi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Senai Film'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(movies[index])
            ),
          );
        },
      ),
    );
  }
}
