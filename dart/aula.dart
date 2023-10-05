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
/*
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
*/
/*
class Usuario {
  String? usuario;
  String? senha;
  void authenticar() {
    var usuario = "admin";
    var senha = "admin";
    if(this.usuario == usuario && this.senha == senha){
      print("Login Correto");
    }
    else{
      print("login incorreto");
    }
  }
}
void main(){
  Usuario usuario = Usuario();
  usuario.usuario = "admin";
  usuario.senha = "admin";
  usuario.authenticar();
}
*/
/*
class Alimento{
  String nome;
  String sabor;
  double peso;

  Alimento(this.nome,this.sabor,this.peso);

}
class Fruta extends Alimento {
  int dia_de_colheita;

  Fruta(String nome, String sabor, double peso,this.dia_de_colheita):super(nome,sabor,peso);

void madura(int isMadura){

  if(isMadura >= dia_de_colheita){
    print("A fruta $nome esta madura");
    } else {
      print("A fruta $nome não esta madura");
    }
  }  
}

class Legumes extends Alimento{
  Legumes(String nome,String sabor,double peso):super(nome,sabor,peso);

void cozinhar(bool iscozinhar){
  if(iscozinhar == true){
  print("O legume $nome precisa cozinhar");
    }else{
      print("O legume $nome não precisa cozinhar");
    }
  }
}

void main(){
  Fruta uva = Fruta("Uva", "Doce", 5, 20);
  uva.madura(25);
  Legumes abobora = Legumes("Abobora", "Doce", 150);
  abobora.cozinhar(true);
}
*/
/*
class Alimento {
  String nome;
  String sabor;
  String cor;
  double peso;
  // Cria construtor Alimento
  Alimento(this.nome, this.sabor, this.cor, this.peso);
}

// Implements pega os metodos da classe abstrata
class Fruta extends Alimento implements Descascar {
  bool? isMadura;
  Fruta(String nome, String sabor, String cor, double peso)
      : super(nome, sabor, cor, peso);

  void Madura(isMadura) {
    if (isMadura == true) {
      print("A fruta $nome está madura");
    } else {
      print("A fruta $nome não está madura");
    }
  }

  @override
  void separarTalheres() {
    print("Pegando a faca para descascar a fruta $nome");
  }

  @override
  void pegarVasilha() {
    print("Pegando vasilha");
  }

  @override
  void comeralimento() {
    print("Fruta $nome descascada pronta para comer");
  }
}

// Cria classe abstrata
abstract class Descascar {
  void separarTalheres();
  void pegarVasilha();
  void comeralimento();
}

class Uva extends Alimento implements Descascar {
  Uva(String nome, String cor, String sabor, double peso)
      : super(nome, cor, sabor, peso);
  @override
  void separarTalheres() {
    print("Não precisa pegar talher para descascar a fruta $nome");
  }

  @override
  void pegarVasilha() {
    print("Não precisa pegar vasilha para  a fruta $nome");
  }

  @override
  void comeralimento() {
    print("Fruta $nome pronta para comer");
  }
}

void main() {
  Fruta Laranja = Fruta("Laranja", "Doce", "Verde", 100);
  Laranja.Madura(true);
  Laranja.separarTalheres();
  Laranja.pegarVasilha();
  Laranja.comeralimento();

  Uva uva = Uva("Uva", "Doce", "Roxa", 20);
  uva.separarTalheres();
  uva.pegarVasilha();
  uva.comeralimento();
}
*/
