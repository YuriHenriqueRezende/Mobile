import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            color: Colors.white, // cor do container principal
            child: Column(
              // coluna
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // alinhamento
              children: [
                // estabelece relação dos componentes
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 400,
                      height: 80,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 350,
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.amber,
                          height: 50,
                          width: 300,
                    ),
                  ],
                )
              ],
            )
          ]
        )              
      ),
    );
  }
}