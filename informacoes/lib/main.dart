import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Informações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInfoForm(),
    );
  }
}

class UserInfoForm extends StatefulWidget {
  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  String? _selectedGender;
  String? _selectedMaritalStatus;

  void _handleGenderChange(String? value) {
    setState(() {
      _selectedGender = value;
    });
  }

  void _handleMaritalStatusChange(String? value) {
    setState(() {
      _selectedMaritalStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Informações'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selecione o Sexo:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: Text('Masculino'),
              value: 'Masculino',
              groupValue: _selectedGender,
              onChanged: _handleGenderChange,
            ),
            RadioListTile<String>(
              title: Text('Feminino'),
              value: 'Feminino',
              groupValue: _selectedGender,
              onChanged: _handleGenderChange,
            ),
            SizedBox(height: 20.0),
            Text(
              'Selecione o Estado Civil:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: Text('Solteiro(a)'),
              value: 'Solteiro(a)',
              groupValue: _selectedMaritalStatus,
              onChanged: _handleMaritalStatusChange,
            ),
            RadioListTile<String>(
              title: Text('Casado(a)'),
              value: 'Casado(a)',
              groupValue: _selectedMaritalStatus,
              onChanged: _handleMaritalStatusChange,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode processar as informações coletadas
                print('Sexo selecionado: $_selectedGender');
                print('Estado Civil selecionado: $_selectedMaritalStatus');
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
