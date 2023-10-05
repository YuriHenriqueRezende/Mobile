class Usuario {
  String login;
  String senha;

  Usuario(this.login, this.senha);

  bool autenticar(String login, String senha) {
    return this.login == login && this.senha == senha;
  }
}
/*
void main() {
  Usuario usuario = Usuario("admin", "1234"); 
  stdout.write("Digite o login: "); 
  String login = stdin.readLineSync(); 
  stdout.write("Digite a senha: "); 
  String senha = stdin.readLineSync();
  if (usuario.autenticar(login, senha)){ 
    print("Login realizado com sucesso!"); 
  } else {
    print("Login ou senha incorretos!");
  }
}
*/