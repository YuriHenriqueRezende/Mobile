// Importa os pacotes necessários para o funcionamento do aplicativo
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material, que fornece widgets e temas para a interface do usuário
import 'package:somativa_3s/RegisterScreen.dart'; // Importa a tela de registro de outro arquivo
import 'package:somativa_3s/MoviesScreen.dart'; // Importa a tela de filmes de outro arquivo
import 'package:somativa_3s/LoginScreen.dart'; // Importa a tela de login de outro arquivo

// O ponto de entrada principal do aplicativo. `runApp` inicializa o aplicativo e exibe o widget fornecido
void main() => runApp(MyApp());

// Define a classe `MyApp` que estende `StatelessWidget`, indicando que este widget não mantém estado
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define a tela inicial do aplicativo como `LoginScreen`
      home: LoginScreen(),
      // Define as rotas nomeadas que podem ser usadas para navegar entre telas
      routes: {
        // Define a rota '/register' que leva à tela de registro
        '/register': (context) => RegisterScreen(),
        // Define a rota '/movies' que leva à tela de filmes
        '/movies': (context) => MoviesScreen(),
      },
    );
  }
}
