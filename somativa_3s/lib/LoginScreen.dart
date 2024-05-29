// Importa os pacotes necessários para o funcionamento do aplicativo
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material, que fornece widgets e temas para a interface do usuário
import 'package:http/http.dart' as http; // Importa o pacote HTTP para fazer requisições HTTP
import 'dart:convert'; // Importa o pacote dart:convert para decodificar as respostas HTTP em JSON

// Define a classe `LoginScreen` como um StatefulWidget, indicando que esta tela possui estado mutável
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState(); // Retorna uma instância do estado associado à tela de login
}

// Define a classe de estado `_LoginScreenState`, que contém a lógica e a estrutura da tela de login
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController(); // Controlador para o campo de entrada do nome de usuário
  final TextEditingController _passwordController = TextEditingController(); // Controlador para o campo de entrada da senha

  // Método assíncrono para lidar com a tentativa de login do usuário
  Future<void> _login() async {
    // Faz uma requisição GET para a API de usuários
    final response = await http.get(Uri.parse('http://10.109.83.3:3000/usuarios'));

    // Verifica se a requisição foi bem-sucedida (código de status 200)
    if (response.statusCode == 200) {
      // Decodifica a resposta JSON em uma lista de usuários
      final List<dynamic> users = jsonDecode(response.body);

      // Procura o usuário na lista com base no nome de usuário e senha inseridos
      final user = users.firstWhere(
        (user) =>
            user['username'] == _usernameController.text &&
            user['password'] == _passwordController.text,
        orElse: () => null, // Retorna nulo se nenhum usuário corresponder aos critérios de busca
      );

      // Verifica se um usuário foi encontrado
      if (user != null) {
        // Navega para a tela de filmes se as credenciais forem válidas
        Navigator.pushReplacementNamed(context, '/movies');
      } else {
        // Exibe uma mensagem de erro se as credenciais forem inválidas
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials')),
        );
      }
    } else {
      // Exibe uma mensagem de erro se houver problemas ao conectar ao servidor
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error connecting to server')),
      );
    }
  }

  // Método responsável por construir a interface da tela de login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')), // Barra de aplicativo com o título 'Login'
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'), // Campo de entrada para o nome de usuário
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'), // Campo de entrada para a senha
              obscureText: true, // Oculta o texto digitado para a senha
            ),
            SizedBox(height: 20), // Espaçamento entre os widgets
            ElevatedButton(
              onPressed: _login, // Define a função a ser executada quando o botão é pressionado
              child: Text('Login'), // Texto exibido no botão
            ),
            SizedBox(height: 20), // Espaçamento entre os widgets
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register'); // Navega para a tela de registro ao pressionar o botão de registro
              },
              child: Text('Register'), // Texto exibido no botão de registro
            ),
          ],
        ),
      ),
    );
  }
}
