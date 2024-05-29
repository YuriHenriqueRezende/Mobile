// Importa os pacotes necessários para o funcionamento do aplicativo
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material, que fornece widgets e temas para a interface do usuário
import 'package:http/http.dart' as http; // Importa o pacote HTTP para fazer requisições HTTP
import 'dart:convert'; // Importa o pacote dart:convert para decodificar as respostas HTTP em JSON

// Define a classe `RegisterScreen` como um StatefulWidget, indicando que esta tela possui estado mutável
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState(); // Retorna uma instância do estado associado à tela de registro
}

// Define a classe de estado `_RegisterScreenState`, que contém a lógica e a estrutura da tela de registro
class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController(); // Controlador para o campo de entrada do nome de usuário
  final TextEditingController _passwordController = TextEditingController(); // Controlador para o campo de entrada da senha

  // Método assíncrono para lidar com o registro de um novo usuário
  Future<void> _register() async {
    // Faz uma requisição GET para a API de usuários
    final response = await http.get(Uri.parse('http://10.109.83.3:3000/usuarios'));

    // Verifica se a requisição foi bem-sucedida (código de status 200)
    if (response.statusCode == 200) {
      // Decodifica a resposta JSON em uma lista de usuários
      final List<dynamic> users = jsonDecode(response.body);

      // Procura por um usuário com o mesmo nome de usuário na lista de usuários existentes
      final existingUser = users.firstWhere(
        (user) => user['username'] == _usernameController.text,
        orElse: () => null, // Retorna nulo se nenhum usuário correspondente for encontrado
      );

      // Verifica se o nome de usuário já existe
      if (existingUser == null) {
        // Se o nome de usuário não existir, faz uma requisição POST para criar um novo usuário
        final createUserResponse = await http.post(
          Uri.parse('http://10.109.83.3:3000/usuarios'),
          body: jsonEncode({
            'username': _usernameController.text,
            'password': _passwordController.text,
          }),
          headers: {'Content-Type': 'application/json'}, // Define o cabeçalho da requisição como JSON
        );

        // Verifica se a criação do usuário foi bem-sucedida (código de status 201)
        if (createUserResponse.statusCode == 201) {
          // Fecha a tela de registro e retorna para a tela anterior
          Navigator.pop(context);
        } else {
          // Exibe uma mensagem de erro se houver problemas ao criar o usuário
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error creating user')),
          );
        }
      } else {
        // Exibe uma mensagem de erro se o nome de usuário já estiver em uso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username already exists')),
        );
      }
    } else {
      // Exibe uma mensagem de erro se houver problemas ao conectar ao servidor
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error connecting to server')),
      );
    }
  }

  // Método responsável por construir a interface da tela de registro
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')), // Barra de aplicativo com o título 'Register'
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
              onPressed: _register, // Define a função a ser executada quando o botão é pressionado
              child: Text('Register'), // Texto exibido no botão
            ),
          ],
        ),
      ),
    );
  }
}
