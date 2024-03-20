import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _precobit;
  String _moedaDestino = 'Dólar';
  TextEditingController _valorController = TextEditingController();

  _consultaprecoBitCoin() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> dados = json.decode(response.body);
    print("Codigo de status da resposta da api ${response.statusCode.toString()}");
    setState(() {
      _precobit = dados["BRL"]["buy"].toString();
    });
    print(_precobit);
  }

  double _converterMoeda(double valor, String moedaDestino) {
    if (moedaDestino == 'Euro') {
      return valor / double.parse(_precobit!);
    } else if (moedaDestino == 'Dólar') {
      return valor / double.parse(_precobit!) * 0.18; // Valor do dólar em relação ao bitcoin
    } else {
      return valor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de moedas"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 50,
                child: TextField(
                  controller: _valorController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Digite o valor em R\$',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Converter para:'),
                  Radio<String>(
                    value: 'Euro',
                    groupValue: _moedaDestino,
                    onChanged: (value) {
                      setState(() {
                        _moedaDestino = value!;
                      });
                    },
                  ),
                  Text('Euro'),
                  Radio<String>(
                    value: 'Dólar',
                    groupValue: _moedaDestino,
                    onChanged: (value) {
                      setState(() {
                        _moedaDestino = value!;
                      });
                    },
                  ),
                  Text('Dólar'),
                  Radio<String>(
                    value: 'Reais',
                    groupValue: _moedaDestino,
                    onChanged: (value) {
                      setState(() {
                        _moedaDestino = value!;
                      });
                    },
                  ),
                  Text('Reais'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _consultaprecoBitCoin();
                  double valorReais = double.parse(_valorController.text);
                  double valorConvertido = _converterMoeda(valorReais, _moedaDestino);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Valor convertido'),
                      content: Text('O valor convertido é ${valorConvertido.toStringAsFixed(2)} $_moedaDestino'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("Converter"),
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 200,
                color: Colors.amber,
                child: Image.asset("imagens/bitcoin.png"), // Substitua "imagens/bitcoin.png" pelo caminho correto da sua imagem
              ),
            ],
          ),
        ),
      ),
    );
  }
}