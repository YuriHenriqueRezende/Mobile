import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
    home: Scaffold(
      appBar: AppBar(
        title: const Text("EletroShoppe 2.0"),
      ),
      body: ListView(
        children: const [
           shoppe("imagens/resistor.jpg", "Teste", "ryan é maravilhoso aasbduregufefhj", 500, 60),
          

        ], //children!!!
      )
    
    ),
    );
  }
}

class shoppe extends StatefulWidget {
  final String imagem;
  final String viagem;
  final String descricao;
  final double preco_d;
  final double preco_p;

  
   const shoppe(this.imagem, this.viagem,this.descricao, this.preco_d,this.preco_p,{super.key});

  @override
  State<shoppe> createState() => _shoppeState();
}

class _shoppeState extends State<shoppe> {
  int contPeople = 0;
  int contDay = 0;
  double total = 0;
  // função setState monitora o estado das variaveis da classe statefull
  void _increment_days(){
    setState(() {
      contDay ++;
    });
  }
  void _increment_people(){
    setState(() {
      contPeople ++;
    });
  }
  void _clean_counter(){
    setState(() {
      contDay = 0;
      contPeople = 0;
      total = 0;
    });
  }
  void _calc(){
    setState(() {
      total = (contDay * widget.preco_d) + (contPeople * widget.preco_p);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(color: Colors.blue,width: 393,height: 250,
        child: Image.asset(widget.imagem,
                    fit: BoxFit.fill,
        ),
        ),
        Text(
          widget.viagem,
          style: const TextStyle(fontSize: 30),
                ),
        Text(
          "R\$ ${widget.preco_d}/dia / R\$ ${widget.preco_p}/pessoa ",
          style: const TextStyle(fontSize: 20, color: Colors.amber),
                ),

        Text(
          "${widget.descricao}\n",
          style: const TextStyle(fontSize: 20), textAlign: TextAlign.left,
                ),
        
        
        // Container(color: Colors.red, width: 200,height: 200, alignment: Alignment.topLeft,
        // child: Text("Quantidade de resistores: $cont \n -------------------------------------------- \n Total a pagar: $total R\$", style: const TextStyle(fontSize: 30),textAlign: TextAlign.center, 
        // ),
        // ),
        
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Container(color: Colors.red, width: 200,height: 50,
            child: Text("Quantidade de dias: $contDay ", style: const TextStyle(fontSize: 20),textAlign: TextAlign.left, 
            ),
            ),
            ElevatedButton(
            onPressed: _increment_days, child: const Icon(Icons.add)),
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Container(color: Colors.red, width: 200,height: 50,
            child: Text("Quantidade de pessoas: $contPeople ", style: const TextStyle(fontSize: 20),textAlign: TextAlign.left, 
            ),
            ),
            ElevatedButton(
            onPressed: _increment_people, child: const Icon(Icons.add)),
          ],
        ),
        Text(
          "Valor total $total R\$",
          style: const TextStyle(fontSize: 20), textAlign: TextAlign.left,
                ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             ElevatedButton(
            onPressed: _clean_counter, child: const Text("Limpar")),
            ElevatedButton(onPressed: _calc, child: const Text("calcular valor"))
          ],
        ),
        
        
        
      ],
    );
   
  }
}

