// Exemplo para a tela de Basquete (basketball_screen.dart)
import 'package:flutter/material.dart';
import 'package:esportes/player.dart'; 


class SoccerScreen extends StatelessWidget {
  final List<Player> players = [
    Player(name: 'Neymar da Silva Santos Júnior ', team: 'Brasil', stats: {'Pontos': 30, 'Assistências': 5}),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Futebol')),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(players[index].name),
            subtitle: Text('Time: ${players[index].team}'),
          );
        },
      ),
    );
  }
}