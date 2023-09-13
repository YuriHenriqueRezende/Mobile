/*
void escreve_msg() {
  print("Senai_ADS");
}

void main() {
  escreve_msg();
}
*/
/*
double calc_salario(double salario, int bonus)=> salario - (0.1*salario) +bonus;
void main()
{
 double total_s;
 total_s = calc_salario(5000,2000);
 print('Salario total R $total_s');
}
*/
/*
void exibir_dados(String nome,{ int? idade, double? h}) // Cria função com 
{
 print("Nome $nome");
 print("Idade: $idade");
 print("Altura: $h");
}
void main()
{
 exibir_dados("Yuri", idade:19, h:1.80); // passagem de parâmetros opcionais 
}
*/
/*
void calc_salario(double sal, Function f) {
  print("Salario $sal");
  calc_bonus();
}

void calc_bonus() {
  print("Bonus R\$ 50,00");
}

void main() {
  calc_salario(5000, calc_bonus);
}
*/
class Casa {
  String? cor; // Atributo cor
  double? valor;

// criar metodos
  void abrirJanela(int qtde_janelas) {
    print("Abrir janela, qtde de janelas $qtde_janelas");
  }

  void abrirPorta() {
    print("Porta aberta");
  }

  void abrirCasa() {
    this.abrirJanela(2);
    this.abrirPorta();
  }
}

void main() {
  // Instancia a classe com o objeto Casa
  Casa minhaCasa = Casa();
  minhaCasa.cor = "Blue";
  print(minhaCasa.cor);
  minhaCasa.abrirPorta();
  minhaCasa.abrirJanela(3);
  minhaCasa.abrirCasa();
  Casa imovel1 = Casa();
  imovel1.cor = "Vermelho";
  print(imovel1.cor);
  imovel1.valor = 550.000;
  print("O valor do imovel 1 é R\$  ${imovel1.valor} ");
}