import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserInformationForm(),
    );
  }
}

class UserInformationForm extends StatefulWidget {
  @override
  _UserInformationFormState createState() => _UserInformationFormState();
}

class _UserInformationFormState extends State<UserInformationForm> {
  final _formKey = GlobalKey<FormState>();
  final _userInfo = UserInfo();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aqui você pode enviar os dados para um servidor ou banco de dados
      // Para este exemplo, vamos apenas imprimir no terminal
      print('Nome: ${_userInfo.nome}');
      print('Idade: ${_userInfo.idade}');
      print('Endereço: ${_userInfo.endereco}');
      print('Email: ${_userInfo.email}');
      print('Telefone: ${_userInfo.telefone}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do Usuário'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Por favor, insira seu nome' : null,
                onSaved: (value) => _userInfo.nome = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Idade'),
                validator: (value) => value!.isEmpty ? 'Por favor, insira sua idade' : null,
                onSaved: (value) => _userInfo.idade = value!,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Endereço'),
                validator: (value) => value!.isEmpty ? 'Por favor, insira seu endereço' : null,
                onSaved: (value) => _userInfo.endereco = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Por favor, insira seu email' : null,
                onSaved: (value) => _userInfo.email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) => value!.isEmpty ? 'Por favor, insira seu telefone' : null,
                onSaved: (value) => _userInfo.telefone = value!,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Enviar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo {
  String nome = '';
  String idade = '';
  String endereco = '';
  String email = '';
  String telefone = '';
}
