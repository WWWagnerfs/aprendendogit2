import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IMCCalculator(),
  ));
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '';

  void calculateIMC() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double imc = weight / (height * height);
      setState(() {
        if (imc < 18.5) {
          result = 'Abaixo do Peso (${imc.toStringAsFixed(2)})';
        } else if (imc >= 18.5 && imc < 24.9) {
          result = 'Peso Normal (${imc.toStringAsFixed(2)})';
        } else if (imc >= 25 && imc < 29.9) {
          result = 'Sobrepeso (${imc.toStringAsFixed(2)})';
        } else if (imc >= 30 && imc < 34.9) {
          result = 'Obesidade Grau 1 (${imc.toStringAsFixed(2)})';
        } else if (imc >= 35 && imc < 39.9) {
          result = 'Obesidade Grau 2 (${imc.toStringAsFixed(2)})';
        } else {
          result = 'Obesidade Grau 3 (${imc.toStringAsFixed(2)})';
        }
      });
    } else {
      setState(() {
        result = 'Informe peso e altura válidos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (KG)'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (Metros)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Resultado: $result',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
