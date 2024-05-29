// Importa os pacotes necessários para o funcionamento do aplicativo
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material, que fornece widgets e temas para a interface do usuário
import 'package:http/http.dart' as http; // Importa o pacote HTTP para fazer requisições HTTP
import 'dart:convert'; // Importa o pacote dart:convert para decodificar as respostas HTTP em JSON
import 'movie.dart'; // Importa a classe de modelo Movie, que define a estrutura dos filmes

// Define a classe `MoviesScreen` como um StatefulWidget, indicando que esta tela possui estado mutável
class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState(); // Retorna uma instância do estado associado à tela de filmes
}

// Define a classe de estado `_MoviesScreenState`, que contém a lógica e a estrutura da tela de filmes
class _MoviesScreenState extends State<MoviesScreen> {
  late Future<List<Movie>> _movies; // Declara uma variável para armazenar o futuro que contém a lista de filmes

  @override
  void initState() {
    super.initState();
    _movies = fetchMovies(); // Inicializa o futuro com a lista de filmes ao iniciar o estado da tela
  }

  // Método assíncrono para buscar a lista de filmes da API
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/danielvieira95/DESM-2/master/filmes.json'));

    // Verifica se a requisição foi bem-sucedida (código de status 200)
    if (response.statusCode == 200) {
      List<dynamic> moviesJson = jsonDecode(response.body);
      // Mapeia a lista de JSON para uma lista de objetos Movie utilizando o método fromJson definido na classe Movie
      return moviesJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      // Lança uma exceção se não for possível carregar os filmes
      throw Exception('Failed to load movies');
    }
  }

  // Método responsável por construir a interface da tela de filmes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'), // Título da barra de aplicativo
        backgroundColor: Colors.red, // Cor de fundo da barra de aplicativo
      ),
      body: FutureBuilder<List<Movie>>(
        future: _movies, // Define o futuro que contém a lista de filmes
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Retorna um indicador de progresso enquanto os filmes estão sendo carregados
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Retorna uma mensagem de erro se houver algum problema ao carregar os filmes
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Retorna uma mensagem se não houver filmes disponíveis
            return Center(child: Text('No movies available'));
          } else {
            // Retorna uma lista de filmes
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index]; // Obtém o filme na posição atual
                // Retorna um card com as informações do filme (imagem, título, duração, ano e nota)
                return Card(
                  color: Colors.blue, // Cor de fundo do card
                  child: ListTile(
                    leading: Image.network(
                      movie.imageUrl, // URL da imagem do filme
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.error), // Ícone exibido em caso de erro ao carregar a imagem
                    ),
                    title: Text(
                      movie.name,
                      style: TextStyle(color: Colors.white), // Cor do texto do título
                    ),
                    subtitle: Text(
                      '${movie.year} - ${movie.duration} - ${movie.rating}',
                      style: TextStyle(color: Colors.white), // Cor do texto do subtítulo
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
