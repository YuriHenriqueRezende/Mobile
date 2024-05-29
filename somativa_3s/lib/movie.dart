// Define a classe de modelo `Movie`, que representa um filme
class Movie {
  final String name; // Nome do filme
  final String imageUrl; // URL da imagem do filme
  final String duration; // Duração do filme
  final String year; // Ano de lançamento do filme
  final String rating; // Nota de avaliação do filme

  // Construtor da classe `Movie`
  Movie({
    required this.name, // Nome é obrigatório
    required this.imageUrl, // URL da imagem é obrigatório
    required this.duration, // Duração é obrigatória
    required this.year, // Ano de lançamento é obrigatório
    required this.rating, // Nota de avaliação é obrigatória
  });

  // Factory constructor para criar uma instância de `Movie` a partir de um mapa JSON
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      // Obtém os valores do mapa JSON e atribui aos campos correspondentes, ou define valores padrão se não estiverem disponíveis
      name: json['nome'] ?? 'Unknown Name',
      imageUrl: json['imagem'] ?? 'https://via.placeholder.com/150', // URL padrão para a imagem caso não seja fornecida
      duration: json['duração'] ?? 'Unknown Duration',
      year: json['ano de lançamento'] ?? 'Unknown Year',
      rating: json['nota'] ?? 'Unknown Rating',
    );
  }
}
