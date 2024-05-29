class Pessoa {
  // Atributos da classe
  String nome;
  int idade;
  String profissao;
  double salario;

  // Construtor da classe
  Pessoa(this.nome, this.idade, this.profissao, this.salario);

  // Método para exibir o trabalho da pessoa
  void exibirTrabalho(String nomeEmpresa, int tempoTrabalho) {
    print("$nome trabalha na $nomeEmpresa há $tempoTrabalho anos.");
  }
}

void main() {
  Pessoa p = Pessoa("Yuri", 25, "ADS", 5000.0);

  p.exibirTrabalho("Microsoft", 3);
}
