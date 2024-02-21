import 'package:flutter/material.dart';
import 'package:login_telas/tela_entrar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Color containerColor = Colors.white; // Cor inicial do container

  void checkCredentials() {
    String enteredName = nameController.text;
    String enteredPassword = passwordController.text;

    if (enteredName.toLowerCase() == 'senai' &&
        enteredPassword == 'mobile23') {
      setState(() {
        containerColor = Colors.green; // Altera para verde se as credenciais forem corretas
        Navigator.push(context, MaterialPageRoute(builder: (context) => Telasecundaria(),));

      });
    } else {
      setState(() {
        containerColor = Colors.red; // Altera para vermelho se as credenciais forem incorretas
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Do Senai'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 100,
              color: containerColor,
              alignment: Alignment.center,
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome de usuário',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkCredentials,
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
