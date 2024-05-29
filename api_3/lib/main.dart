import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    //material app é necessário por conta do material design
    //home vai chamar a tela
    // runapp função que inicia a chamada da tela para o app
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "http://10.109.83.24:3000/produtos";
  var produtos  = <Produto>[];
  String teste = "";
  final TextEditingController id = TextEditingController();
  final TextEditingController idDelete = TextEditingController();
  final TextEditingController nome = TextEditingController();
  final TextEditingController valor = TextEditingController();
  // List<int> valor = [];

  _getdado()async{
    //http response método que cria uma variável para a resposta da api
    // await é porque a função é assincrona
    // Uri.parse é necessário para o http.get
    http.Response resposta = await http.get(Uri.parse(url));
    List dado = json.decode(resposta.body); //json decode faz a conversão do dado para json
    print(dado[0]);
    for (int i =0; i<dado.length; i++)
    {
      print(dado[i]);

    }
    setState(() {
      //dado.map vai converter nosso json em uma lista
      produtos = dado.map((json) => Produto.fromJson(json)).toList();
    });
  }
  _post(){
    Map<String, dynamic> mensagem={
      "id":"${id.text}",
      "nome":"${nome.text}",
      "valor":"${valor.text}"
    };

    http.post(Uri.parse(url),
    headers: <String, String>{
      'Content-type' : 'application/json; charset=UTF-8',

    },
    body: jsonEncode(mensagem),
    );
  }
  _deletepost(){
    http.delete(Uri.parse(url + "/${idDelete.text}"),
    
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App http métodos", style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      backgroundColor: Color.fromARGB(255, 238, 0, 0),
      body: ListView(
        children: [
          Center(
            child: Container(
               width: MediaQuery.of(context).size.width - 50,
                  constraints: BoxConstraints(minWidth: 300),
                  color: Color.fromARGB(255, 255, 0, 0),
                  
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Get, Post, Put, Delete http", style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.04 - 4, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    
                    child: ElevatedButton(onPressed: _getdado, child: Text("Ler", style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02 + 3, fontWeight: FontWeight.bold, color: Colors.white )),
                     style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue, // Cor do texto do botão
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15), // Espaçamento interno do botão
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Borda circular do botão
                                ),
                                elevation: 3, // Elevação do botão
                              ),),
                            
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(
                      
                    child: Container(
                      
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Digite seu email",
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 26, 116, 190))),
                            suffixIcon: Icon(Icons.arrow_back)),
                        showCursor: true,
                        controller: idDelete,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    
                    child: ElevatedButton(onPressed: _deletepost, child: Text("Deletar", style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02 + 3, fontWeight: FontWeight.bold, color: Colors.white )),
                     style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue, // Cor do texto do botão
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15), // Espaçamento interno do botão
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Borda circular do botão
                                ),
                                elevation: 3, // Elevação do botão
                              ),),
                            
                  ),
                ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    
                    child: ElevatedButton(onPressed: _post, child: Text("Publicar", style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02 + 3, fontWeight: FontWeight.bold, color: Colors.white )),
                     style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue, // Cor do texto do botão
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15), // Espaçamento interno do botão
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Borda circular do botão
                                ),
                                elevation: 3, // Elevação do botão
                              ),),
                            
                  ),
                ),
               
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text("leticia linda", style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02 + 3, fontWeight: FontWeight.bold, color: Colors.white )),
                // ),
                
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(children: produtos.map((produto) => Text("${produto.nome}- ${produto.valor}", style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02 + 3,
                     color: Colors.white, fontWeight: FontWeight.bold
                    ))).toList(),
                      
                    ),
                 ),
                
              
                
                
              
              ],),
            ),
          )
        ],
        

        ),
      );

    
  }
}

class Produto{
  String id;
  String nome;
  String valor;
  Produto(this.id, this.nome, this.valor);
  factory Produto.fromJson(Map<String, dynamic>json){
    return Produto(json["id"], json["nome"], json["valor"]);
  }
}

class Produto_n{
  List prod= [];
  Produto_n(this.prod);

}