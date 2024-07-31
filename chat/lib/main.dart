import 'package:flutter/material.dart';
import 'db/database_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluxograma App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  void _login(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final user = await _dbHelper.getUser(username);
    if (user != null && user['password'] == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegistrationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  void _register(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    await _dbHelper.insertUser({'username': username, 'password': password});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Cadastro')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:3000/products'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Principal')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar produtos'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var product = snapshot.data![index];
                return ListTile(
                  title: Text(product['name']),
                  subtitle: Text(product['description']),
                );
              },
            );
          } else {
            return Center(child: Text('Nenhum produto encontrado'));
          }
        },
      ),
    );
  }
}
