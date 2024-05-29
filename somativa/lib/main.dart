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
        title: const Text("MANGE TRIPS "),
      ),
      body: ListView(
        children: const [
           shoppe("imagens/roberto.jpg", "Senai Roberto Mange", "Venha conhecer a melhor faculdade de \n                     Campinas-SP", 20, 5),
           shoppe("imagens/arraial_do_cabo.jpg", " Arraial do Cabo", "Venha conhecer Arraial do Cabo", 534, 65),
           shoppe("imagens/chile.jpg", "Chile", "Venha conhecer Chile", 446, 95),
           shoppe("imagens/florianopolis.jpg", "Florianópolis", "Venha conhecer Florianópolis", 348, 85),
           shoppe("imagens/jeriacoacoara.jpg", "Jericoacoara", "Venha conhecer Jericoacoara", 571, 75),
           shoppe("imagens/las_vegas.jpg", "Las Vegas", "Venha conhecer Las Vegas", 504, 110),
           shoppe("imagens/madri.jpg", "Madri", "Venha conhecer Madri", 401, 85),
           shoppe("imagens/orlando.jpg", "Orlando", "Venha conhecer Orlando", 616, 105),
           shoppe("imagens/paris.jpg", "Paris", "Venha conhecer O MELHOR JOGADOR DO MUNDO!!!", 546, 95),
           shoppe("imagens/roma.jpg", "Roma", "Venha conhecer Roma", 478, 85),
           shoppe("imagens/angra_dos_reis.jpg", "Angra dos Reis", "Venha conhecer Angra dos Reis", 384, 70),
           
           

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
          "R\$ ${widget.preco_d}/dia - R\$ ${widget.preco_p}/pessoa ",
          style: const TextStyle(fontSize: 20, color: Colors.red),
                ),

        Text(
          "${widget.descricao}\n",
          style: const TextStyle(fontSize: 20), textAlign: TextAlign.left,
                ),
      
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Container(color: const Color.fromARGB(255, 255, 255, 255), width: 200,height: 50,
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
            Container(color: const Color.fromARGB(255, 255, 255, 255), width: 200,height: 50,
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

