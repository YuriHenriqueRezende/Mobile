abstract class Alimentar {
  void separarIngredientes();
  void pegarTigela();
  void prepararComida();
}

class Animal {
  String nome;
  int idade;
  String cor;
  String raca;

  Animal(this.nome, this.idade, this.cor, this.raca);
}

class Passaro extends Animal implements Alimentar {
  double peso;

  Passaro(String nome, int idade, String cor, String raca, this.peso)
      : super(nome, idade, cor, raca);

  void acordou() {
    print("$nome, o pássaro, acordou e começou a cantar.");
  }

  void dormiu() {
    print("$nome, o pássaro, dormiu e ficou quieto.");
  }

  @override
  void separarIngredientes() {
    print("$nome, o pássaro, está separando sementes para sua refeição.");
  }

  @override
  void pegarTigela() {
    print("$nome, o pássaro, pegou sua tigela de comida.");
  }

  @override
  void prepararComida() {
    print("$nome, o pássaro, está se alimentando.");
  }
}

class Cachorro extends Animal implements Alimentar {
  double peso;

  Cachorro(String nome, int idade, String cor, String raca, this.peso)
      : super(nome, idade, cor, raca);

  void acordou() {
    print("$nome, o cachorro, acordou e começou a latir.");
  }

  void dormiu() {
    print("$nome, o cachorro, dormiu e ficou quieto.");
  }

  @override
  void separarIngredientes() {
    print("$nome, o cachorro, está separando ingredientes para sua refeição.");
  }

  @override
  void pegarTigela() {
    print("$nome, o cachorro, pegou sua tigela de comida.");
  }

  @override
  void prepararComida() {
    print("$nome, o cachorro, está se alimentando.");
  }
}

class Tigre extends Animal implements Alimentar {
  double peso;

  Tigre(String nome, int idade, String cor, String raca, this.peso)
      : super(nome, idade, cor, raca);

  void acordou() {
    print("$nome, o tigre, acordou e começou a rugir.");
  }

  void dormiu() {
    print("$nome, o tigre, dormiu e ficou descansando.");
  }

  @override
  void separarIngredientes() {
    print("$nome, o tigre, está separando carne para sua refeição.");
  }

  @override
  void pegarTigela() {
    print("$nome, o tigre, pegou sua tigela de comida.");
  }

  @override
  void prepararComida() {
    print("$nome, o tigre, está se alimentando.");
  }
}

class Peixe extends Animal implements Alimentar {
  double peso;

  Peixe(String nome, int idade, String cor, String raca, this.peso)
      : super(nome, idade, cor, raca);

  void acordou() {
    print("$nome, o peixe, acordou e começou a nadar.");
  }

  void dormiu() {
    print("$nome, o peixe, dormiu nas águas tranquilas.");
  }

  @override
  void separarIngredientes() {
    print("$nome, o peixe, está se alimentando de pequenas partículas na água.");
  }

  @override
  void pegarTigela() {
    // Não é aplicável a um peixe, pois eles não usam tigelas.
    print("$nome, o peixe, não usa tigelas.");
  }

  @override
  void prepararComida() {
    print("$nome, o peixe, está se alimentando de partículas na água.");
  }
}

void main() {
  var passaro = Passaro("Canário", 2, "Amarelo", "Silvestre", 0.1);
  var cachorro = Cachorro("Bulldog", 3, "Marrom", "Doméstico", 10.0);
  var tigre = Tigre("Tigre de Bengala", 5, "Laranja", "Selvagem", 250.0);
  var peixe = Peixe("Betta", 1, "Azul", "Aquário", 0.02);

  passaro.acordou();
  passaro.separarIngredientes();
  passaro.pegarTigela();
  passaro.prepararComida();
  passaro.dormiu();

  cachorro.acordou();
  cachorro.separarIngredientes();
  cachorro.pegarTigela();
  cachorro.prepararComida();
  cachorro.dormiu();

  tigre.acordou();
  tigre.separarIngredientes();
  tigre.pegarTigela();
  tigre.prepararComida();
  tigre.dormiu();

  peixe.acordou();
  peixe.separarIngredientes();
  peixe.prepararComida();
  peixe.dormiu();
}
