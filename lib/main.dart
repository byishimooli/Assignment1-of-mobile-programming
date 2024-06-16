import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _operation = '';
  double _firstNumber = 0;
  double _secondNumber = 0;

  void _calculate() {
    double result;

    switch (_operation) {
      case '+':
        result = _firstNumber + _secondNumber;
        break;
      case '-':
        result = _firstNumber - _secondNumber;
        break;
      case '*':
        result = _firstNumber * _secondNumber;
        break;
      case '/':
        result = _secondNumber != 0 ? _firstNumber / _secondNumber : 0;
        break;
      default:
        result = 0;
    }

    setState(() {
      _controller.text = result.toString();
      _firstNumber = result;
      _secondNumber = 0;
      _operation = '';
    });
  }

  void _setOperation(String operation) {
    setState(() {
      _operation = operation;
      _firstNumber = double.tryParse(_controller.text) ?? _firstNumber;
      _controller.clear();
    });
  }

  void _setSecondNumber() {
    setState(() {
      _secondNumber = double.tryParse(_controller.text) ?? 0;
      _calculate();
    });
  }

  void _clearAll() {
    setState(() {
      _controller.clear();
      _operation = '';
      _firstNumber = 0;
      _secondNumber = 0;
    });
  }

  void _deleteLastCharacter() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  void _appendNumber(String number) {
    setState(() {
      _controller.text += number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: '',
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                ),
                style: const TextStyle(fontSize: 14),
                readOnly: true,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _clearAll,
                    child: const Text('AC'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _deleteLastCharacter,
                    child: const Text('X'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _appendNumber('1'),
                    child: const Text('1'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _appendNumber('2'),
                    child: const Text('2'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _appendNumber('3'),
                    child: const Text('3'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _setOperation('+'),
                    child: const Text('+'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _appendNumber('4'),
                    child: const Text('4'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _appendNumber('5'),
                    child: const Text('5'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _appendNumber('6'),
                    child: const Text('6'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _setOperation('-'),
                    child: const Text('-'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _appendNumber('7'),
                    child: const Text('7'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _appendNumber('8'),
                    child: const Text('8'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _appendNumber('9'),
                    child: const Text('9'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _setOperation('*'),
                    child: const Text('*'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _appendNumber('0'),
                    child: const Text('0'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _appendNumber('.'),
                    child: const Text('.'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _setOperation('/'),
                    child: const Text('/'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _setSecondNumber,
                    child: const Text('='),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
