import 'package:flutter/material.dart';

class IndustriaScreen extends StatefulWidget {
  @override
  _IndustriaScreenState createState() => _IndustriaScreenState();
}

class _IndustriaScreenState extends State<IndustriaScreen> {
  String _output = '0';
  String _currentInput = '';
  double _result = 0;
  String _operator = '';

  void _handleButtonClick(String text) {
    setState(() {
      if (text == 'C') {
        _output = '0';
        _currentInput = '';
        _result = 0;
        _operator = '';
      } else if (text == '=') {
        _result = _calculate();
        _output = _result.toString();
        _operator = '';
      } else if (text == '+' || text == '-' || text == '*' || text == '/') {
        _operator = text;
        _result = double.parse(_currentInput);
        _currentInput = '';
      } else {
        if (_currentInput == '0') {
          _currentInput = '';
        }
        _currentInput += text;
        _output = _currentInput;
      }
    });
  }

  double _calculate() {
    double secondOperand = double.parse(_currentInput);
    switch (_operator) {
      case '+':
        return _result + secondOperand;
      case '-':
        return _result - secondOperand;
      case '*':
        return _result * secondOperand;
      case '/':
        return _result / secondOperand;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Industria'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('C'),
              _buildButton('0'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () => _handleButtonClick(text),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
