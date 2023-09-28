class Pessoa {
  String nome;
  int idade;
  String profissao;
  double salario;

  Pessoa(this.nome, this.idade, this.profissao, this.salario);

  void exibirTrabalho(String nomeEmpresa, int tempoDeTrabalho) {
    print('Nome da Empresa: $nomeEmpresa');
    print('Tempo de Trabalho: $tempoDeTrabalho anos');
  }
}

void main() {
  Pessoa pessoa1 = Pessoa('João', 30, 'Engenheiro', 5000.00);

  pessoa1.exibirTrabalho('Robert Bosch', 5);
  print('------------------------');
}

