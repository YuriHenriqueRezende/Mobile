import 'package:flutter/material.dart';
import 'package:jogadores/players.dart';

class PlayerListScreen extends StatelessWidget {
  final String sport;

  PlayerListScreen({required this.sport});

  @override
  Widget build(BuildContext context) {
    List<Player> players = _getPlayers(sport);

    return Scaffold(
      appBar: AppBar(
        title: Text('Jogadores de $sport'),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(players[index].name),
            subtitle: Text('Idade: ${players[index].age.toString()} | ${sport == 'Futebol' ? 'Gols' : 'Pontos'}: ${players[index].points.toString()}'),
          );
        },
      ),
    );
  }

  List<Player> _getPlayers(String sport) {
    if (sport == 'Futebol') {
      return [
        Player(name: 'Messi', age: 34, points: 743),
        Player(name: 'Ronaldo', age: 36, points: 785),
        Player(name: 'Neymar', age: 29, points: 324),
      ];
    } else {
      return [
        Player(name: 'LeBron James', age: 36, points: 35243),
        Player(name: 'Kevin Durant', age: 33, points: 25234),
        Player(name: 'Stephen Curry', age: 33, points: 19125),
      ];
    }
  }
}
