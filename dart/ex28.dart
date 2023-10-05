class Pessoa {
  String _nome; 
  int _idade; 

  Pessoa(this._nome, this._idade);

  String get nome => _nome;

  set nome(String novoNome) {
    if (novoNome.isNotEmpty) {
      _nome = novoNome;
    } else {
      print("Nome não pode ser vazio.");
    }
  }

  int get idade => _idade;

  set idade(int novaIdade) {
    if (novaIdade >= 0) {
      _idade = novaIdade;
    } else {
      print("Idade não pode ser negativa.");
    }
  }

  void mostrarInformacoes() {
    print("Nome: $_nome");
    print("Idade: $_idade anos");
  }
}

void main() {
  var pessoa = Pessoa("João", 30);

  pessoa.mostrarInformacoes();

  pessoa.nome = "Maria";

  pessoa.idade = 25;

  pessoa.mostrarInformacoes();
}
