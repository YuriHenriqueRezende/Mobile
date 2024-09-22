import 'dart:math';

import 'package:flutter/material.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Knob and Gauge Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Knob and Gauge Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _minimum = 0; // Valor mínimo do knob
  final double _maximum = 100; // Valor máximo do knob

  late KnobController _controller; // Controlador do knob
  late double _knobValue; // Valor atual do knob

  // Função para atualizar o valor do knob
  void valueChangedListener(double value) {
    if (mounted) {
      setState(() {
        _knobValue = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _knobValue = _minimum; // Valor inicial do knob
    _controller = KnobController(
      initial: _knobValue, // Valor inicial
      minimum: _minimum, // Valor mínimo
      maximum: _maximum, // Valor máximo
      startAngle: 0, // Ângulo inicial
      endAngle: 180, // Ângulo final
      precision: 2, // Precisão do knob
    );
    _controller.addOnValueChangedListener(valueChangedListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Exibe o valor atual do knob
            Text('Knob Value: ${_knobValue.toStringAsFixed(2)}'),
            const SizedBox(height: 25),
            // Botão para definir um valor aleatório para o knob
            ElevatedButton(
              onPressed: () {
                var value =
                    Random().nextDouble() * (_maximum - _minimum) + _minimum;
                _controller.setCurrentValue(value);
              },
              child: const Text('Update Knob Value'),
            ),
            const SizedBox(height: 25),
            // Widget Knob
            Container(
              child: Knob(
                controller: _controller,
                width: 200,
                height: 200,
                // Estilo do knob
               
              ),
            ),
            const SizedBox(height: 25),
            // Widget Gauge
            SizedBox(
              height: 300,
              width: 300,
              child: SfRadialGauge(
                title: GaugeTitle(
                  text: 'Gauge',
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: _minimum,
                    maximum: _maximum,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Colors.orange,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(value: _knobValue),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            '${_knobValue.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeOnValueChangedListener(valueChangedListener);
    super.dispose();
  }
}