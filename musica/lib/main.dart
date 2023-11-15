import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Músicas',
      home: MusicListScreen(),
    );
  }
}

class MusicListScreen extends StatelessWidget {
  final List<String> songs = [
    'Star Wars The Rise of Skywalker',
    'Singin in The Rain',
    'Deus e Eu no Sertao',
    'Borboletas',
    'The Ecstasy Of Gold',
    'You Give Love A Bad Name',
    'Dont Stop Believin',
    'Loney Boy',
    'Banda Marcial Senai Luiz Varga Limeira',
    'Nave Espacial',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Músicas'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(songs[index]),
              leading: Icon(Icons.music_note),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                },
              ),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}
