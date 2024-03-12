import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  _consultar () async {
    String url = "https://viacep.com.br/ws/01311923/json/";
  http.Response response;
  response = await http.get(Uri.parse(url));
  print("codigo ${response.statusCode.toString()}");
  print("API ${response.body}");
  String ? logradouro;
  String ? bairro;
  String ? cidade;
  String ? estado;
  String ? ddd;

  Map<String,dynamic> dados = json.decode(response.body);
  logradouro = dados["logradouro"];
  print("logradouro $logradouro");

  bairro = dados["bairro"];
  print("bairro $bairro");

  cidade = dados["localidade"];
  print("cidade $cidade");

  ddd = dados["ddd"];
  print("ddd $ddd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _consultar, child: Text("Clique"))

        ],
      ),
    );
  }
}